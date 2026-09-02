attribute vec3 attr_pos;
attribute vec2 attr_uv0;
attribute vec3 attr_norm;

uniform mat4 modelViewProjection;

out vec2 v_coord0;

void main() {
    v_coord0 = attr_uv0;

    float pos_z =  attr_pos.z - offset ;

    float new_x = -(curvature * pow(pos_z , 2.0)) - pos_z * tilt - shift;

    gl_Position.x = attr_pos.x;
    gl_Position.x += + new_x / 1000.0;

    gl_Position.y = attr_pos.y;
    gl_Position.z = attr_pos.z - offset;

    gl_Position.w = 1.0;

    gl_Position = modelViewProjection * vec4(gl_Position.xyz, 1.0);
}
