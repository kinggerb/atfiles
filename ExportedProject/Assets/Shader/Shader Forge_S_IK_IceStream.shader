Shader "Shader Forge/S_IK_IceStream" {
	Properties {
		_Colour ("Colour", Vector) = (0.08235294,0.4627451,0.5882353,1)
		_TextureMasks ("TextureMasks", 2D) = "white" {}
		_OutlineColour ("OutlineColour", Vector) = (0.1529412,0.5960785,0.6509804,1)
		_TextureMasks01 ("TextureMasks01", 2D) = "white" {}
		_Colour01 ("Colour01", Vector) = (0.4392157,0.854902,0.9568628,1)
		_PanSpeed ("PanSpeed", Float) = 1
		_TextureMasks02 ("TextureMasks02", 2D) = "white" {}
		_Distortion ("Distortion", 2D) = "white" {}
		_Noise ("Noise", 2D) = "white" {}
		_NoiseGrad ("NoiseGrad", 2D) = "white" {}
		_Noise01 ("Noise01", 2D) = "white" {}
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