in vec2 v_coord0;
out vec4 fragColor;

void main() {
    float yStart = 0.25;
    float yEnd = 0.98;
    float xStart = 0.35;
    float xEnd = 0.65;
    if(v_coord0.y > yStart && v_coord0.y < yEnd && v_coord0.x > xStart && v_coord0.x < xEnd){
        vec2 v_coord0_t = v_coord0;
        v_coord0_t.y = (v_coord0.y-yStart)/(yEnd-yStart);
        v_coord0_t.x = (v_coord0.x-xStart)/(xEnd-xStart);
        vec4 tex = texture(map, v_coord0_t);
        fragColor =  vec4(laneColor.rgb, tex.a);
    }else{
        fragColor = vec4(0.0, 0.0, 0.0, 0.0);
    }
}
