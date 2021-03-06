/*
 * MMD Shader for Unity
 *
 * Copyright 2012 Masataka SUMI, Takahiro INOUE
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */
Shader "MMD/Transparent/PMDMaterial"
{
	Properties
	{
		_Color("Diffuse", Color) = (1,1,1,1)
		_Opacity("Opacity", Float) = 1.0
		_SpecularColor("Specular", Color) = (1,1,1)
		_AmbColor("Ambient", Color) = (1,1,1)
		_Shininess("Shininess", Float) = 0
		_MainTex("Texture", 2D) = "white" {}
		_ToonTex("Toon Texture", 2D) = "white" {}
		_SphereAddTex("Sphere (Addition)", 2D) = "black" {}
		_SphereMulTex("Sphere (multiplication)", 2D) = "white" {}
	}

	SubShader
	{
		// Settings
		Tags
		{
			"Queue" = "Transparent"
			"RenderType" = "Transparent"
		}
		
		// Surface Shader
		Cull Back
		ZWrite On
		Blend SrcAlpha OneMinusSrcAlpha
		CGPROGRAM
		#pragma surface surf MMD
		#include "MeshPmdMaterialSurface.cginc"
		ENDCG

		// Surface Shader
		Cull Front
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		CGPROGRAM
		#pragma surface surf MMD
		#include "MeshPmdMaterialSurface.cginc"
		ENDCG

	}

	// Other Environment
	Fallback "Transparent/Diffuse"
}
