#version 400 core

in vec2 position;

out vec4 clipSpace;
out vec2 textureCoords;
out vec3 toCameraVector;
out vec3 fromLightVector;

const float tiling = 5.0;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 transformationMatrix;
uniform vec3 cameraPosition;
uniform vec3 lightPosition;

void main(void) {

	vec4 worldPosition = transformationMatrix * vec4(position.x, 0.0, position.y, 1.0);
	clipSpace = projectionMatrix * viewMatrix * worldPosition;
	textureCoords = vec2(position.x / 2.0 + 0.5, position.y / 2.0 + 0.5) * tiling;
	toCameraVector = cameraPosition - worldPosition.xyz;
	fromLightVector = worldPosition.xyz - lightPosition;
	
	gl_Position = clipSpace;
 
}