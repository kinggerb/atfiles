Shader "Shader Forge/S_IK_WaterDrips" {
	Properties {
		_Colour ("Colour", Vector) = (0.262223,0.5671524,0.877,1)
		_TextureMasks ("TextureMasks", 2D) = "white" {}
		_TextureMasks01 ("TextureMasks01", 2D) = "white" {}
		_PanSpeed ("PanSpeed", Float) = 1
		_NoiseMask ("NoiseMask", 2D) = "white" {}
		[MaterialToggle] _DripSwitch ("DripSwitch", Float) = 0
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