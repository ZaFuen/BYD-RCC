in vec2 v_coord0;
out vec4 fragColor;

uniform float u_time;  // 用于动画的时间变量
uniform float zhangGe; // 控制虚线动画的参数

void main() {
    float fade = smoothstep(fadeEnd, fadeStart, v_coord0.y);
    vec4 tex = texture(map, v_coord0);
    
    // 计算流动动画的偏移量
    float flowOffset = 0.0;
    float animationSpeed = 0.0;
    
    if (zhangGe > 0.0) {
        // 根据zhangGe值设置动画速度
        animationSpeed = zhangGe * 0.5;
        flowOffset = u_time * animationSpeed;
        
        // 定义虚线模式：实线-空隙-实线-空隙...
        float dashLength = dashLineSpace; // 实线长度
        float gapLength = dashLineSpace;  // 空隙长度
        
        // 计算总周期长度
        float cycleLength = dashLength + gapLength;
        
        // 修改这里：使用 + 号让动画向下移动（前进方向）
        float posInCycle = mod(v_coord0.y + flowOffset, cycleLength);
        
        // 判断是否在实线部分
        float visible = 0.0;
        if (posInCycle < dashLength) {
            visible = 1.0;
        }
        
        fragColor = vec4(laneColor.rgb, tex.a * fade * opacity * visible);
    }
    else {
        // zhangGe == 0 时为实线
        fragColor = vec4(laneColor.rgb, tex.a * fade * opacity);
    }
}