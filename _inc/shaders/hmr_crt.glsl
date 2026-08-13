#version 120

#ifdef VERTEX

attribute vec2 VertexCoord;
attribute vec2 TexCoord;
attribute vec4 COLOR;

varying vec2 vTexCoord;
varying vec4 vColor;

uniform mat4 MVPMatrix;

void main()
{
    gl_Position = MVPMatrix * vec4(VertexCoord, 0.0, 1.0);
    vTexCoord = TexCoord;
    vColor = COLOR;
}

#endif

#ifdef FRAGMENT

uniform sampler2D Texture;
varying vec2 vTexCoord;
varying vec4 vColor;

void main()
{
    // 1. Courbure de l'écran
    vec2 crt_uv = vTexCoord * 2.0 - 1.0;
    vec2 offset = crt_uv.yx / 8.5;
    crt_uv = crt_uv + crt_uv * offset * offset;
    
    // 2. Zoom arrière de 4% pour laisser suffisamment d'espace physique au cadre (et sa bande noire épaisse)
    crt_uv = crt_uv * 1.04; 
    crt_uv = crt_uv * 0.5 + 0.5;

    // 3. Calcul de la distance par rapport au bord
    // min_dist est positif dans l'écran, 0 sur le bord exact, et négatif dans la bordure noire
    vec2 edge_dist = min(crt_uv, 1.0 - crt_uv);
    float min_dist = min(edge_dist.x, edge_dist.y);
    
    // edge_fade vaut 1.0 dans l'écran, et 0.0 à l'extérieur avec une toute petite zone de lissage
    float edge_fade = smoothstep(0.0, 0.005, min_dist);

    vec4 final_color = vec4(0.0);

    // --- RENDU DE L'ÉCRAN (Si on est au moins un peu à l'intérieur) ---
    if (edge_fade > 0.0) {
        // Aberration chromatique
        float dist = length(crt_uv - 0.5);
        float shift = 0.002 * dist; 
        float r = texture2D(Texture, crt_uv + vec2(shift, 0.0)).r;
        float g = texture2D(Texture, crt_uv).g;
        float b = texture2D(Texture, crt_uv - vec2(shift, 0.0)).b;
        vec3 color = vec3(r, g, b);

        // Scanlines
        float scanlines = sin(gl_FragCoord.y * 3.14159265) * 0.05 + 0.95;

        // Vignette
        vec2 center = crt_uv - 0.5;
        float vignette = 1.0 - dot(center, center) * 0.8;
        vignette = smoothstep(0.0, 1.0, vignette);

        // Contraste
        color *= 1.05;

        // Reflet de la vitre
        float arc_dist = length(crt_uv - vec2(0.5, -0.5));
        float reflection = smoothstep(1.6, 1.3, arc_dist) * smoothstep(1.0, 1.3, arc_dist);
        reflection *= smoothstep(0.4, 1.0, crt_uv.y);
        color += vec3(reflection * 0.12);


        final_color = vec4(color * scanlines * vignette, 1.0) * vColor;
    }

    // --- RENDU DU CADRE PLASTIQUE / REFLET BEZEL (À l'extérieur de l'écran) ---
    float screen_mask = smoothstep(-0.001, 0.001, min_dist);
    if (screen_mask < 1.0) {
        // Position sur le bord de l'image
        vec2 edge_pos = clamp(crt_uv, 0.0, 1.0);
        
        // Vecteur de dépassement à l'extérieur de l'écran
        vec2 out_dist = crt_uv - edge_pos;
        
        // Magie du biseau : multiplicateur adouci (x4.0 au lieu de 12.0)
        // Les reflets n'iront plus chercher le milieu de l'écran (ce qui donnait un rendu moche)
        vec2 reflection_uv = edge_pos - out_dist * 4.0;
        
        // Miroir sécurisé au cas où on dépasserait le centre
        vec2 mirrored_uv = abs(reflection_uv);
        mirrored_uv = 1.0 - abs(1.0 - mirrored_uv);
        
        // -- CONSTRUCTION DU CADRE PHYSIQUE 3D --
        float frame_dist = abs(min_dist); // Distance à l'extérieur de l'écran
        
        // 1. Le "Gap" (vide sous la vitre) : Bande noire franche doublée en épaisseur
        float frame_start = smoothstep(0.004, 0.007, frame_dist);
        
        // 2. Fond statique du cadre : Gris lisse et propre (le grain faisait brouillon)
        vec3 frame_color = vec3(0.08); 
        
        // 3. Éclairage 3D (Highlight) : simule la lumière accrochant le biseau du cadre
        float highlight = smoothstep(0.004, 0.008, frame_dist) * smoothstep(0.016, 0.008, frame_dist);
        frame_color += vec3(0.12) * highlight;
        
        // 4. Ombre externe : on ne descend jamais à zéro ! (mix avec 0.4)
        // Cela garantit que les bords extérieurs du cadre restent parfaitement visibles
        float outer_shadow = smoothstep(0.040, 0.010, frame_dist);
        frame_color *= mix(0.4, 1.0, outer_shadow);
        
        // 5. Flou en spirale (Bokeh) pour le reflet
        float radius = 0.003 + frame_dist * 0.2; 
        
        vec3 bezel_color = vec3(0.0);
        float theta = 0.0;
        float taps = 24.0;
        
        for (float i = 0.0; i < 24.0; i += 1.0) {
            float r = sqrt(i + 0.5) / 4.898; 
            vec2 offset = vec2(cos(theta), sin(theta)) * r * radius;
            bezel_color += texture2D(Texture, mirrored_uv + offset).rgb;
            theta += 2.39996; 
        }
        bezel_color /= taps;
        
        // 6. Application du reflet par-dessus le cadre statique
        // On fait disparaître progressivement le reflet vers l'extérieur pour simuler 
        // le changement d'angle de vue sur le biseau
        float reflection_fade = smoothstep(0.020, 0.006, frame_dist);
        bezel_color *= 0.15 * frame_start * reflection_fade; 
        
        // Le plastique est découpé par le gap
        frame_color *= frame_start;
        
        // Mélange final avec la coupure nette de l'écran
        final_color = mix(vec4(frame_color + bezel_color, 1.0) * vColor, final_color, screen_mask);
    }

    gl_FragColor = final_color;
}

#endif
