const inv_oklab_A : mat3x3<f32>  = mat3x3<f32>( vec3f(0.2104542553, 1.9779984951, 0.0259040371), 
                                                vec3f(0.7936177850, -2.4285922050, 0.7827717662), 
                                                vec3f(-0.0040720468, 0.4505937099, -0.8086757660) );

const inv_oklab_B : mat3x3<f32>  = mat3x3<f32>( vec3f(0.4121656120, 0.2118591070, 0.0883097947), 
                                                vec3f(0.5362752080, 0.6807189584, 0.2818474174), 
                                                vec3f(0.0514575653, 0.1074065790, 0.6302613616) );

fn rgb2oklab(linear: vec3f) -> vec3f {
    let lms = inv_oklab_B * linear;
    return inv_oklab_A * (sign(lms) * pow(abs(lms), vec3f(0.3333333333333)));
}
