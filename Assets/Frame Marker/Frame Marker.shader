Shader "Custom/Frame Marker"
{
    Properties
    {
        _MainTex("Marker", 2D) = ""{}
        _Opacity("Opacity", Float) = 1
    }
    
    CGINCLUDE

#include "UnityCG.cginc"

sampler2D _MainTex;
float4 _MainTex_ST;
float _Opacity;

struct v2f
{
    float4 position : SV_POSITION;
    float2 texcoord : TEXCOORD0;
};

v2f vert(appdata_base v)
{
    v2f o;
    o.position = mul(UNITY_MATRIX_MVP, v.vertex);
    o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
    return o;
}

float4 frag(v2f i) : SV_Target 
{
    float4 marker = tex2D(_MainTex, i.texcoord);
    marker.a *= _Opacity;
    return marker;
}

    ENDCG 
    
    Subshader
    {
        Tags { "Queue"="Overlay" }
        Pass
        {
            ZTest Always Cull Off ZWrite Off
            Fog { Mode off }
            Blend SrcAlpha OneMinusSrcAlpha
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    }
}
