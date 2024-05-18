Shader "Custom/RoughNoise"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _NoiseScale ("Noise Scale", Float) = 5.0
        _Speed ("Speed", Float) = 1.0
        _Threshold ("Noise Threshold", Float) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _NoiseScale;
            float _Speed;
            float _Threshold;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            // Simple random function
            float random (float2 uv)
            {
                return frac(sin(dot(uv.xy ,float2(12.9898,78.233))) * 43758.5453);
            }

            float3 noiseColor (float2 uv)
            {
                float value = random(uv);
                if (value < _Threshold)
                    return float3(0, 0, 0); // Black
                else
                    return float3(1, 1, 1); // White
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // Move the noise pattern over time using Unity's _Time variable
                float2 uv = i.uv * _NoiseScale + _Time.y * _Speed;
                float3 noise = noiseColor(uv);
                return fixed4(noise, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
