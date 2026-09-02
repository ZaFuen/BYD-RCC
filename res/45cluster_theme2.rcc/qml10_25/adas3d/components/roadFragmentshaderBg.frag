in vec2 v_coord0;
out vec4 fragColor;

void main() {

    if(v_coord0.y > fadeStart && v_coord0.y < fadeEnd){
        vec2 v_coord0_t = v_coord0;
        v_coord0_t.y = (v_coord0.y-fadeStart)/(fadeEnd-fadeStart);
        vec4 tex = texture(map, v_coord0_t);
//        float fade = smoothstep(fadeStart, fadeEnd, v_coord0.y);
        //fragColor = vec4(laneColor.rgb, tex.a);//*fade;//*0.8;
        fragColor = tex;
    }else{
        fragColor = vec4(0.0, 0.0, 0.0, 0.0);//vec4(laneColor.rgb, 1.0)*0.6;//tex*0.0;
    }
}
