attribute vec3 attr_pos;
attribute vec2 attr_uv0;
attribute vec3 attr_norm;

uniform mat4 modelViewProjection;

out vec2 v_coord0;

void main() {
    v_coord0 = attr_uv0;

    float pos_z = attr_pos.z - offset;

    float new_x = -(curvature * pow(pos_z , 2.0)) - pos_z * tilt - shift;

    float pos_x =  attr_pos.x;
    pos_x += + new_x / 1000.0;

    float minZ = -1000.0 * t;
    float maxZ = -1500.0;
    if(pos_z < minZ){
        pos_z = minZ;
    }
    else if(pos_z > maxZ){
        pos_z = maxZ;
    }


    float new_x2 = (1.0-cos(PI*(maxZ-pos_z)/(minZ-maxZ)))/2.0*k;
    pos_x += new_x2;

    gl_Position.x = pos_x;
    gl_Position.y = attr_pos.y;
    gl_Position.z = attr_pos.z - offset;
    gl_Position.w = 1.0;
    gl_Position = modelViewProjection * vec4(gl_Position.xyz, 1.0);
}
