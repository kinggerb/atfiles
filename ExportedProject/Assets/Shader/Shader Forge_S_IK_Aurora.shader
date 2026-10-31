Shader "Shader Forge/S_IK_Aurora" {
	Properties {
		_Colour ("Colour", Vector) = (0.2941177,0.7921569,0.9176471,1)
		_TextureMask ("TextureMask", 2D) = "white" {}
		_TextureMask01 ("TextureMask01", 2D) = "white" {}
		_Colour01 ("Colour01", Vector) = (0.2980392,0.6588235,0.9490197,1)
		_Colour02 ("Colour02", Vector) = (0.3254902,0.6117647,0.9176471,1)
		_Colour03 ("Colour03", Vector) = (0.2,0.6941177,0.8941177,1)
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
	Fallback "Diffuse"
	//CustomEditor "ShaderForgeMaterialInspector"
}