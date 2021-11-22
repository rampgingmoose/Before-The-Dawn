// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Render Settings, 5, 10)]_RenderingCat("[ Rendering Cat ]", Float) = 0
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[IntRange]_RenderPriority("Render Priority", Range( -100 , 100)) = 0
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,Same,2)]_RenderNormals("Render Normals", Float) = 0
		[StyledSpace(10)]_ReceiveSpace("# Receive Space", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Receive Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderDecals("Receive Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Receive SSR/SSGI", Float) = 0
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		_Cutoff("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_FadeSpace("# Fade Space", Float) = 0
		[StyledCategory(Global Settings)]_GlobalCat("[ Global Cat ]", Float) = 0
		[StyledEnum(Default _Layer 1 _Layer 2 _Layer 3 _Layer 4 _Layer 5 _Layer 6 _Layer 7 _Layer 8)]_LayerColorsValue("Layer Colors", Float) = 0
		[StyledEnum(Default _Layer 1 _Layer 2 _Layer 3 _Layer 4 _Layer 5 _Layer 6 _Layer 7 _Layer 8)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(Default _Layer 1 _Layer 2 _Layer 3 _Layer 4 _Layer 5 _Layer 6 _Layer 7 _Layer 8)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(Default _Layer 1 _Layer 2 _Layer 3 _Layer 4 _Layer 5 _Layer 6 _Layer 7 _Layer 8)]_LayerReactValue("Layer React", Float) = 0
		[StyledSpace(10)]_LayersSpace("# Layers Space", Float) = 0
		[StyledMessage(Info, Procedural Variation in use. The Variation might not work as expected when switching from one LOD to another., _VertexVariationMode, 1 , 0, 10)]_VariationGlobalsMessage("# Variation Globals Message", Float) = 0
		_GlobalColors("Global Colors", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalAlpha("Global Alpha", Range( 0 , 1)) = 1
		_GlobalSize("Global Size", Range( 0 , 1)) = 1
		[StyledRemapSlider(_ColorsMaskMinValue, _ColorsMaskMaxValue, 0, 1, 10, 0)]_ColorsMaskRemap("Colors Mask", Vector) = (0,0,0,0)
		[HideInInspector]_ColorsMaskMinValue("Colors Mask Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_ColorsMaskMaxValue("Colors Mask Max Value", Range( 0 , 1)) = 1
		_ColorsVariationValue("Colors Variation", Range( 0 , 1)) = 0
		[StyledRemapSlider(_OverlayMaskMinValue, _OverlayMaskMaxValue, 0, 1, 10, 0)]_OverlayMaskRemap("Overlay Mask", Vector) = (0,0,0,0)
		[HideInInspector]_OverlayMaskMinValue("Overlay Mask Min Value", Range( 0 , 1)) = 0.45
		[HideInInspector]_OverlayMaskMaxValue("Overlay Mask Max Value", Range( 0 , 1)) = 0.55
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0
		[Space(10)]_AlphaVariationValue("Alpha Variation", Range( 0 , 1)) = 1
		[StyledCategory(Main Settings)]_MainCat("[ Main Cat ]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainNormalTex("Main Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 1
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 1
		[StyledCategory(Detail Settings)]_DetailCat("[ Detail Cat ]", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[Enum(Vertex Blue,0,Projection,1)]_DetailTypeMode("Detail Type", Float) = 0
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blending", Vector) = (0,0,0,0)
		[StyledCategory(Occlusion Settings)]_OcclusionCat("[ Occlusion Cat ]", Float) = 0
		[HDR]_VertexOcclusionColor("Vertex Occlusion Color", Color) = (1,1,1,1)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1)]_VertexOcclusionRemap("Vertex Occlusion Mask", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Vertex Occlusion Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Vertex Occlusion Max Value", Range( 0 , 1)) = 1
		[StyledCategory(Subsurface Settings)]_SubsurfaceCat("[ Subsurface Cat ]", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (0.4,0.4,0.1,1)
		[StyledRemapSlider(_SubsurfaceMaskMinValue, _SubsurfaceMaskMaxValue,0,1)]_SubsurfaceMaskRemap("Subsurface Mask", Vector) = (0,0,0,0)
		[HideInInspector]_SubsurfaceMaskMinValue("Subsurface Mask Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_SubsurfaceMaskMaxValue("Subsurface Mask Max Value", Range( 0 , 1)) = 1
		[Space(10)][DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[HideInInspector][Space(10)][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[Space(10)]_MainLightScatteringValue("Subsurface Scattering Intensity", Range( 0 , 16)) = 8
		_MainLightAngleValue("Subsurface Scattering Angle", Range( 0 , 16)) = 8
		[Space(10)]_TranslucencyIntensityValue("Translucency Intensity", Range( 0 , 50)) = 1
		_TranslucencyNormalValue("Translucency Normal", Range( 0 , 1)) = 0.1
		_TranslucencyScatteringValue("Translucency Scattering", Range( 1 , 50)) = 2
		_TranslucencyDirectValue("Translucency Direct", Range( 0 , 1)) = 1
		_TranslucencyAmbientValue("Translucency Ambient", Range( 0 , 1)) = 0.2
		_TranslucencyShadowValue("Translucency Shadow", Range( 0 , 1)) = 1
		[StyledMessage(Warning,  Translucency is not supported in HDRP. Diffusion Profiles will be used instead., 10, 5)]_TranslucencyHDMessage("# Translucency HD Message", Float) = 0
		[StyledCategory(Gradient Settings)]_GradientCat("[ Gradient Cat ]", Float) = 0
		[HDR]_GradientColorOne("Gradient Color One", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient Color Two", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Mask Max ", Range( 0 , 1)) = 1
		[StyledCategory(Noise Settings)]_NoiseCat("[ Noise Cat ]", Float) = 0
		[HDR]_NoiseColorOne("Noise Color One", Color) = (1,1,1,1)
		[HDR]_NoiseColorTwo("Noise Color Two", Color) = (1,1,1,1)
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Mask", Vector) = (0,0,0,0)
		[HideInInspector]_NoiseMinValue("Noise Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_NoiseMaxValue("Noise Mask Max ", Range( 0 , 1)) = 1
		_NoiseScaleValue("Noise Scale", Range( 0 , 1)) = 0.01
		[StyledCategory(Emissive Settings)]_EmissiveCat("[ Emissive Cat]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[Enum(None,0,Any,10,Baked,20,Realtime,30)]_EmissiveFlagMode("Emissive Baking", Float) = 0
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[StyledEmissiveIntensity]_EmissiveIntensityParams("Emissive Intensity", Vector) = (1,1,1,0)
		[StyledCategory(Perspective Settings)]_PerspectiveCat("[ Perspective Cat ]", Float) = 0
		_PerspectivePushValue("Perspective Push", Range( 0 , 4)) = 0
		_PerspectiveNoiseValue("Perspective Noise", Range( 0 , 4)) = 0
		_PerspectiveAngleValue("Perspective Angle", Range( 0 , 8)) = 1
		[StyledCategory(Size Fade Settings)]_SizeFadeCat("[ Size Fade Cat ]", Float) = 0
		[StyledMessage(Info, The Size Fade feature is recommended to be used to fade out vegetation at a distance in combination with the LOD Groups or with a 3rd party culling system., _SizeFadeMode, 1, 0, 10)]_SizeFadeMessage("# Size Fade Message", Float) = 0
		[Enum(Off,0,On,1)]_SizeFadeMode("Size Fade Mode", Float) = 0
		_SizeFadeStartValue("Size Fade Start", Range( 0 , 1000)) = 200
		_SizeFadeEndValue("Size Fade End", Range( 0 , 1000)) = 300
		[StyledCategory(Motion Settings)]_MotionCat("[ Motion Cat ]", Float) = 0
		[StyledMessage(Info, Procedural variation in use. Use the Scale settings if the Variation is breaking the bending and rolling animation., _VertexVariationMode, 1 , 0, 10)]_VariationMotionMessage("# Variation Motion Message", Float) = 0
		[HDR]_MotionHighlightColor("Motion Highlight", Color) = (2,2,2,1)
		[StyledSpace(10)]_MotionSpace("# Motion Space", Float) = 0
		_MotionAmplitude_10("Primary Bending", Range( 0 , 1)) = 0.05
		[IntRange]_MotionSpeed_10("Primary Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Primary Scale", Range( 0 , 20)) = 0
		_MotionVariation_10("Primary Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_32("Details Flutter", Range( 0 , 1)) = 0.2
		[IntRange]_MotionSpeed_32("Details Speed", Range( 0 , 40)) = 4
		_MotionScale_32("Details Scale", Range( 0 , 20)) = 0
		_MotionVariation_32("Details Variation", Range( 0 , 20)) = 2
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 1)) = 1
		[ASEEnd]_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 1
		[HideInInspector]_MaxBoundsInfo("_MaxBoundsInfo", Vector) = (1,1,1,1)
		[HideInInspector]_render_normals_options("_render_normals_options", Vector) = (1,1,1,0)
		[HideInInspector]_vertex_pivot_mode("_vertex_pivot_mode", Float) = 0
		[HideInInspector]_Color("_LegacyColor", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("_LegacyMainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("_LegacyBumpMap", 2D) = "white" {}
		[HideInInspector][StyledToggle]_VertexDataMode("_VertexDataMode", Float) = 0
		[HideInInspector][Enum(Single Pivot,0,Baked Pivots,1)]_VertexPivotMode("_VertexPivotMode", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_VertexMasksMode("_VertexMasksMode", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsVersion("_IsVersion", Float) = 480
		[HideInInspector]_IsGrassShader("_IsGrassShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }
		Cull [_render_cull]
		AlphaToMask Off
		HLSLINCLUDE
		#pragma target 4.0

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend [_render_src] [_render_dst], One Zero
			ZWrite [_render_zw]
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA
			

			HLSLPROGRAM
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70403
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_VERTEX_DATA_BATCHED
			//TVE Shader Type Defines
			#define TVE_IS_GRASS_SHADER
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
           //Nature Renderer (Procedural Instancing)
           #include "Assets/Visual Design Cafe/Nature Shaders/Common/Nodes/Integrations/Nature Renderer.cginc"
           #pragma instancing_options procedural:SetupNatureRenderer
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float4 ase_color : COLOR;
				float4 ase_texcoord12 : TEXCOORD12;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			half4 _GradientColorTwo;
			half4 _OverlayMaskRemap;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _MotionHighlightColor;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			float4 _NoiseMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _NoiseColorTwo;
			half4 _EmissiveColor;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveUVs;
			half4 _NoiseColorOne;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _MainColor;
			half3 _render_normals_options;
			half _NoiseScaleValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _render_zw;
			half _PerspectiveNoiseValue;
			half _PerspectivePushValue;
			half _SizeFadeMode;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _GlobalSize;
			half _VertexDataMode;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionMaskValue;
			half _PerspectiveAngleValue;
			half _NoiseMinValue;
			half _ColorsMaskMinValue;
			half _LayerColorsValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			half _GlobalEmissive;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _NoiseMaxValue;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _MainLightScatteringValue;
			half _MainLightAngleValue;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _LayerReactValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerExtrasValue;
			half _InteractionAmplitude;
			half _MotionAmplitude_10;
			half _MotionVariation_10;
			half _RenderCull;
			half _LayersSpace;
			half _FadeSpace;
			half _TranslucencyHDMessage;
			half _SubsurfaceCat;
			half _VertexMasksMode;
			half _NoiseCat;
			half _SizeFadeCat;
			half _VariationMotionMessage;
			half _RenderNormals;
			half _TranslucencyIntensityValue;
			half _IsTVEShader;
			half _DetailMode;
			half _DetailCat;
			half _EmissiveFlagMode;
			half _MotionSpace;
			half _EmissiveCat;
			half _Cutoff;
			half _GradientCat;
			half _OcclusionCat;
			half _render_dst;
			half _IsStandardShader;
			half _IsGrassShader;
			half _render_src;
			half _render_cull;
			half _TranslucencyAmbientValue;
			float _MotionScale_10;
			half _VariationGlobalsMessage;
			half _RenderClip;
			float _MotionSpeed_10;
			half _LayerMotionValue;
			half _vertex_pivot_mode;
			half _AlphaVariationValue;
			half _VertexPivotMode;
			half _TranslucencyScatteringValue;
			half _TranslucencyDirectValue;
			half _IsVersion;
			half _DetailTypeMode;
			half _RenderSSR;
			half _DetailBlendMode;
			half _ReceiveSpace;
			half _SizeFadeMessage;
			half _RenderingCat;
			half _PerspectiveCat;
			half _TranslucencyShadowValue;
			half _RenderZWrite;
			half _RenderPriority;
			half _GlobalCat;
			half _MotionCat;
			half _MainCat;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _VertexVariationMode;
			half _RenderMode;
			half _TranslucencyNormalValue;
			half _GlobalAlpha;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			float4 TVE_MotionTweaks;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoord;
			SAMPLER(samplerTVE_MotionTex);
			float TVE_MotionUsage[9];
			TEXTURE2D(TVE_NoiseTex);
			half4 TVE_NoiseParams;
			SAMPLER(samplerTVE_NoiseTex);
			half4 TVE_ReactParams;
			TEXTURE2D_ARRAY(TVE_ReactTex);
			half4 TVE_ReactCoord;
			SAMPLER(samplerTVE_ReactTex);
			float TVE_ReactUsage[9];
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_DistanceFadeBias;
			TEXTURE3D(TVE_WorldTex3D);
			SAMPLER(samplerTVE_WorldTex3D);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoord;
			SAMPLER(samplerTVE_ColorsTex);
			float TVE_ColorsUsage[9];
			half4 TVE_MainLightParams;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			float TVE_ExtrasUsage[9];
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_EmissiveTex);
			SAMPLER(sampler_EmissiveTex);
			TEXTURE2D(_MainMaskTex);
			half TVE_OverlaySmoothness;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g55655 = v.vertex.xyz;
				float3 appendResult60_g55709 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				half3 Mesh_PivotsData2831_g55655 = ( appendResult60_g55709 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g55655 = Mesh_PivotsData2831_g55655;
				float3 temp_output_2283_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				half3 VertexPos40_g55681 = temp_output_2283_0_g55655;
				float3 appendResult74_g55681 = (float3(VertexPos40_g55681.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g55681 = appendResult74_g55681;
				float3 break84_g55681 = VertexPos40_g55681;
				float3 appendResult81_g55681 = (float3(0.0 , break84_g55681.y , break84_g55681.z));
				half3 VertexPosOtherAxis82_g55681 = appendResult81_g55681;
				half ObjectData20_g55710 = 3.14;
				float Bounds_Height374_g55655 = _MaxBoundsInfo.y;
				half WorldData19_g55710 = ( Bounds_Height374_g55655 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55710 = WorldData19_g55710;
				#else
				float staticSwitch14_g55710 = ObjectData20_g55710;
				#endif
				float Motion_Max_Bending1133_g55655 = staticSwitch14_g55710;
				float4x4 break19_g55661 = GetObjectToWorldMatrix();
				float3 appendResult20_g55661 = (float3(break19_g55661[ 0 ][ 3 ] , break19_g55661[ 1 ][ 3 ] , break19_g55661[ 2 ][ 3 ]));
				float3 appendResult60_g55663 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float3 temp_output_91_0_g55661 = ( appendResult60_g55663 * _vertex_pivot_mode );
				float3 PivotsOnly105_g55661 = (mul( GetObjectToWorldMatrix(), float4( temp_output_91_0_g55661 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g55662 = ( appendResult20_g55661 + PivotsOnly105_g55661 );
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g55662 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55662 = WorldData19_g55662;
				#else
				float3 staticSwitch14_g55662 = ObjectData20_g55662;
				#endif
				float3 temp_output_114_0_g55661 = staticSwitch14_g55662;
				float3 vertexToFrag4224_g55655 = temp_output_114_0_g55661;
				half3 ObjectData20_g55705 = vertexToFrag4224_g55655;
				float3 vertexToFrag3890_g55655 = ase_worldPos;
				half3 WorldData19_g55705 = vertexToFrag3890_g55655;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55705 = WorldData19_g55705;
				#else
				float3 staticSwitch14_g55705 = ObjectData20_g55705;
				#endif
				float3 ObjectPosition4223_g55655 = staticSwitch14_g55705;
				float3 Position83_g55714 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55714 = _LayerMotionValue;
				float4 lerpResult87_g55714 = lerp( TVE_MotionParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_MotionCoord).zw + ( (TVE_MotionCoord).xy * (Position83_g55714).xz ) ),temp_output_84_0_g55714, 0.0 ) , TVE_MotionUsage[(int)temp_output_84_0_g55714]);
				half4 Global_Motion_Params3909_g55655 = lerpResult87_g55714;
				float4 break322_g55720 = Global_Motion_Params3909_g55655;
				half Wind_Power369_g55720 = break322_g55720.z;
				float lerpResult376_g55720 = lerp( TVE_MotionTweaks.x , 1.0 , Wind_Power369_g55720);
				half Wind_Power_103106_g55655 = lerpResult376_g55720;
				float2 panner73_g55658 = ( _TimeParameters.x * (TVE_NoiseParams).xy + ( (ObjectPosition4223_g55655).xz * TVE_NoiseParams.z ));
				float4 tex2DNode75_g55658 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g55658, 0.0 );
				float4 saferPower77_g55658 = max( abs( tex2DNode75_g55658 ) , 0.0001 );
				half Wind_Power2223_g55655 = Wind_Power369_g55720;
				float temp_output_167_0_g55658 = Wind_Power2223_g55655;
				float lerpResult168_g55658 = lerp( 1.4 , 0.2 , temp_output_167_0_g55658);
				float4 temp_cast_5 = (lerpResult168_g55658).xxxx;
				float4 break174_g55658 = pow( saferPower77_g55658 , temp_cast_5 );
				half Global_NoiseTex_R34_g55655 = break174_g55658.r;
				float3 appendResult397_g55720 = (float3(break322_g55720.x , 0.0 , break322_g55720.y));
				float3 temp_output_398_0_g55720 = (appendResult397_g55720*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g55720 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55720 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g55655 = (temp_output_339_0_g55720).xz;
				half Input_Speed62_g55680 = _MotionSpeed_10;
				float mulTime373_g55680 = _TimeParameters.x * Input_Speed62_g55680;
				float3 break111_g55703 = ObjectPosition4223_g55655;
				half Variation_Complex102_g55703 = frac( ( v.ase_color.r + ( break111_g55703.x + break111_g55703.z ) ) );
				half ObjectData20_g55704 = Variation_Complex102_g55703;
				half Variation_Simple105_g55703 = v.ase_color.r;
				half WorldData19_g55704 = Variation_Simple105_g55703;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55704 = WorldData19_g55704;
				#else
				float staticSwitch14_g55704 = ObjectData20_g55704;
				#endif
				half Motion_Variation3073_g55655 = staticSwitch14_g55704;
				half Motion_Variation284_g55680 = ( _MotionVariation_10 * Motion_Variation3073_g55655 );
				float Motion_Scale287_g55680 = ( _MotionScale_10 * ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) );
				half Sine_MinusOneToOne281_g55680 = sin( ( mulTime373_g55680 + Motion_Variation284_g55680 + Motion_Scale287_g55680 ) );
				half Wind_Squash4479_g55655 = TVE_MotionTweaks.w;
				half Input_WindSquash419_g55680 = Wind_Squash4479_g55655;
				half Input_WindPower327_g55680 = Wind_Power_103106_g55655;
				float lerpResult321_g55680 = lerp( Sine_MinusOneToOne281_g55680 , (Sine_MinusOneToOne281_g55680*Input_WindSquash419_g55680 + 1.0) , Input_WindPower327_g55680);
				half Mesh_Motion_1082_g55655 = v.ase_texcoord3.x;
				half2 Motion_10_Bending2258_g55655 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g55655 ) * Wind_Power_103106_g55655 * Global_NoiseTex_R34_g55655 * Wind_DirectionOS39_g55655 * lerpResult321_g55680 * Mesh_Motion_1082_g55655 );
				half Interaction_Amplitude4137_g55655 = _InteractionAmplitude;
				float3 Position83_g55679 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55679 = _LayerReactValue;
				float4 lerpResult87_g55679 = lerp( TVE_ReactParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ReactTex, samplerTVE_ReactTex, ( (TVE_ReactCoord).zw + ( (TVE_ReactCoord).xy * (Position83_g55679).xz ) ),temp_output_84_0_g55679, 0.0 ) , TVE_ReactUsage[(int)temp_output_84_0_g55679]);
				half4 Global_React_Params4173_g55655 = lerpResult87_g55679;
				float4 break322_g55659 = Global_React_Params4173_g55655;
				half Interaction_Mask66_g55655 = break322_g55659.z;
				float3 appendResult397_g55659 = (float3(break322_g55659.x , 0.0 , break322_g55659.y));
				float3 temp_output_398_0_g55659 = (appendResult397_g55659*2.0 + -1.0);
				float3 temp_output_339_0_g55659 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55659 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Interaction_DirectionOS4158_g55655 = (temp_output_339_0_g55659).xz;
				float lerpResult4494_g55655 = lerp( 1.0 , Mesh_Motion_1082_g55655 , _InteractionMaskValue);
				half2 Motion_10_Interaction53_g55655 = ( Interaction_Amplitude4137_g55655 * Motion_Max_Bending1133_g55655 * Interaction_Mask66_g55655 * Interaction_Mask66_g55655 * Interaction_DirectionOS4158_g55655 * lerpResult4494_g55655 );
				float2 lerpResult109_g55655 = lerp( Motion_10_Bending2258_g55655 , Motion_10_Interaction53_g55655 , ( Interaction_Mask66_g55655 * saturate( Interaction_Amplitude4137_g55655 ) ));
				float2 break143_g55655 = lerpResult109_g55655;
				half Motion_10_ZAxis190_g55655 = break143_g55655.y;
				half Angle44_g55681 = Motion_10_ZAxis190_g55655;
				half3 VertexPos40_g55690 = ( VertexPosRotationAxis50_g55681 + ( VertexPosOtherAxis82_g55681 * cos( Angle44_g55681 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g55681 ) * sin( Angle44_g55681 ) ) );
				float3 appendResult74_g55690 = (float3(0.0 , 0.0 , VertexPos40_g55690.z));
				half3 VertexPosRotationAxis50_g55690 = appendResult74_g55690;
				float3 break84_g55690 = VertexPos40_g55690;
				float3 appendResult81_g55690 = (float3(break84_g55690.x , break84_g55690.y , 0.0));
				half3 VertexPosOtherAxis82_g55690 = appendResult81_g55690;
				half Motion_10_XAxis216_g55655 = break143_g55655.x;
				half Angle44_g55690 = -Motion_10_XAxis216_g55655;
				half Motion_Scale321_g55708 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g55708 = _MotionSpeed_32;
				float mulTime349_g55708 = _TimeParameters.x * Input_Speed62_g55708;
				float Motion_Variation330_g55708 = ( _MotionVariation_32 * Motion_Variation3073_g55655 );
				float Bounds_Radius121_g55655 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g55708 = ( _MotionAmplitude_32 * Bounds_Radius121_g55655 * 0.1 );
				float3 temp_output_299_0_g55708 = ( sin( ( ( ase_worldPos * Motion_Scale321_g55708 ) + mulTime349_g55708 + Motion_Variation330_g55708 ) ) * Input_Amplitude58_g55708 );
				half Mesh_Motion_30144_g55655 = v.ase_texcoord3.z;
				float lerpResult378_g55720 = lerp( TVE_MotionTweaks.z , 1.0 , Wind_Power369_g55720);
				half Wind_Power_303115_g55655 = lerpResult378_g55720;
				float temp_output_7_0_g55697 = TVE_MotionFadeEnd;
				half Wind_FadeOut4005_g55655 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g55697 ) / ( TVE_MotionFadeStart - temp_output_7_0_g55697 ) ) );
				half Motion_Selective4260_g55655 = 1.0;
				half3 Motion_30_Details263_g55655 = ( temp_output_299_0_g55708 * ( Global_NoiseTex_R34_g55655 * Mesh_Motion_30144_g55655 * Wind_Power_303115_g55655 * Wind_FadeOut4005_g55655 * Motion_Selective4260_g55655 ) );
				float3 Vertex_Motion_Object833_g55655 = ( ( VertexPosRotationAxis50_g55690 + ( VertexPosOtherAxis82_g55690 * cos( Angle44_g55690 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g55690 ) * sin( Angle44_g55690 ) ) ) + Motion_30_Details263_g55655 );
				float3 temp_output_3474_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				float3 appendResult2043_g55655 = (float3(Motion_10_XAxis216_g55655 , 0.0 , Motion_10_ZAxis190_g55655));
				float3 Vertex_Motion_World1118_g55655 = ( ( temp_output_3474_0_g55655 + appendResult2043_g55655 ) + Motion_30_Details263_g55655 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch3312_g55655 = Vertex_Motion_World1118_g55655;
				#else
				float3 staticSwitch3312_g55655 = ( Vertex_Motion_Object833_g55655 + ( 0.0 * _VertexDataMode ) );
				#endif
				half Global_Vertex_Size174_g55655 = break322_g55659.w;
				float lerpResult346_g55655 = lerp( 1.0 , Global_Vertex_Size174_g55655 , _GlobalSize);
				float3 appendResult3480_g55655 = (float3(lerpResult346_g55655 , lerpResult346_g55655 , lerpResult346_g55655));
				half3 ObjectData20_g55719 = appendResult3480_g55655;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g55719 = _Vector11;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55719 = WorldData19_g55719;
				#else
				float3 staticSwitch14_g55719 = ObjectData20_g55719;
				#endif
				half3 Vertex_Size1741_g55655 = staticSwitch14_g55719;
				half3 _Vector5 = half3(1,1,1);
				float temp_output_7_0_g55715 = _SizeFadeEndValue;
				float temp_output_335_0_g55655 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g55655 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g55715 ) / ( _SizeFadeStartValue - temp_output_7_0_g55715 ) ) );
				float3 appendResult3482_g55655 = (float3(temp_output_335_0_g55655 , temp_output_335_0_g55655 , temp_output_335_0_g55655));
				float3 lerpResult3556_g55655 = lerp( _Vector5 , appendResult3482_g55655 , _SizeFadeMode);
				half3 ObjectData20_g55722 = lerpResult3556_g55655;
				half3 WorldData19_g55722 = _Vector5;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55722 = WorldData19_g55722;
				#else
				float3 staticSwitch14_g55722 = ObjectData20_g55722;
				#endif
				float3 Vertex_SizeFade1740_g55655 = staticSwitch14_g55722;
				float3 normalizeResult2696_g55655 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g55655 = cross( normalizeResult2696_g55655 , half3(0,1,0) );
				float3 appendResult2710_g55655 = (float3(-break2709_g55655.z , 0.0 , break2709_g55655.x));
				float3 appendResult2667_g55655 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g55655 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult2212_g55655 = dot( ViewDir_Normalized3963_g55655 , float3(0,1,0) );
				half Mask_HView2656_g55655 = dotResult2212_g55655;
				float saferPower2652_g55655 = max( Mask_HView2656_g55655 , 0.0001 );
				half3 Grass_Coverage2661_g55655 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g55655 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g55655*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g55655 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g55655 = ( ( staticSwitch3312_g55655 * Vertex_Size1741_g55655 * Vertex_SizeFade1740_g55655 ) + Mesh_PivotsOS2291_g55655 + Grass_Coverage2661_g55655 );
				
				float temp_output_7_0_g55684 = _GradientMinValue;
				float4 lerpResult2779_g55655 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( v.ase_color.a - temp_output_7_0_g55684 ) / ( _GradientMaxValue - temp_output_7_0_g55684 ) ) ));
				half3 Gradient_Tint2784_g55655 = (lerpResult2779_g55655).rgb;
				float3 vertexToFrag11_g55667 = Gradient_Tint2784_g55655;
				o.ase_texcoord7.xyz = vertexToFrag11_g55667;
				float3 temp_cast_15 = (_NoiseScaleValue).xxx;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float temp_output_7_0_g55693 = _NoiseMinValue;
				half Noise_Mask3162_g55655 = saturate( ( ( SAMPLE_TEXTURE3D_LOD( TVE_WorldTex3D, samplerTVE_WorldTex3D, ( temp_cast_15 * WorldPosition3905_g55655 * 0.1 ), 0.0 ).r - temp_output_7_0_g55693 ) / ( _NoiseMaxValue - temp_output_7_0_g55693 ) ) );
				float4 lerpResult2800_g55655 = lerp( _NoiseColorTwo , _NoiseColorOne , Noise_Mask3162_g55655);
				half3 Noise_Tint2802_g55655 = (lerpResult2800_g55655).rgb;
				float3 vertexToFrag11_g55669 = Noise_Tint2802_g55655;
				o.ase_texcoord8.xyz = vertexToFrag11_g55669;
				float lerpResult169_g55658 = lerp( 4.0 , 2.0 , temp_output_167_0_g55658);
				half Global_NoiseTex_H2869_g55655 = pow( abs( tex2DNode75_g55658.a ) , lerpResult169_g55658 );
				half3 Highlight_Tint3231_g55655 = ( ( (_MotionHighlightColor).rgb * Global_NoiseTex_H2869_g55655 * Wind_Power_103106_g55655 * Wind_FadeOut4005_g55655 * v.ase_color.a ) + float3( 1,1,1 ) );
				float3 vertexToFrag11_g55698 = Highlight_Tint3231_g55655;
				o.ase_texcoord9.xyz = vertexToFrag11_g55698;
				float2 vertexToFrag11_g55666 = ( ( v.texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord10.xy = vertexToFrag11_g55666;
				float3 Position58_g55656 = WorldPosition3905_g55655;
				float temp_output_82_0_g55656 = _LayerColorsValue;
				float4 lerpResult88_g55656 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_ColorsCoord).zw + ( (TVE_ColorsCoord).xy * (Position58_g55656).xz ) ),temp_output_82_0_g55656, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g55656]);
				half Global_ColorsTex_A1701_g55655 = (lerpResult88_g55656).a;
				float vertexToFrag11_g55671 = Global_ColorsTex_A1701_g55655;
				o.ase_texcoord7.w = vertexToFrag11_g55671;
				o.ase_texcoord11.xyz = vertexToFrag3890_g55655;
				float3 temp_cast_18 = (1.0).xxx;
				float Mesh_Occlusion318_g55655 = v.ase_color.g;
				float temp_output_7_0_g55706 = _VertexOcclusionMinValue;
				float3 lerpResult2945_g55655 = lerp( (_VertexOcclusionColor).rgb , temp_cast_18 , saturate( ( ( Mesh_Occlusion318_g55655 - temp_output_7_0_g55706 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g55706 ) ) ));
				float3 vertexToFrag11_g55665 = lerpResult2945_g55655;
				o.ase_texcoord12.xyz = vertexToFrag11_g55665;
				
				float2 vertexToFrag11_g55707 = ( ( v.texcoord.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				o.ase_texcoord10.zw = vertexToFrag11_g55707;
				
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;
				o.ase_texcoord11.w = 0;
				o.ase_texcoord12.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g55655;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag ( VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						, FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float3 vertexToFrag11_g55667 = IN.ase_texcoord7.xyz;
				float3 vertexToFrag11_g55669 = IN.ase_texcoord8.xyz;
				float3 vertexToFrag11_g55698 = IN.ase_texcoord9.xyz;
				float2 vertexToFrag11_g55666 = IN.ase_texcoord10.xy;
				half2 Main_UVs15_g55655 = vertexToFrag11_g55666;
				float4 tex2DNode29_g55655 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g55655 );
				float3 temp_output_51_0_g55655 = ( (_MainColor).rgb * (tex2DNode29_g55655).rgb );
				half3 Main_Albedo99_g55655 = temp_output_51_0_g55655;
				half3 Blend_Albedo265_g55655 = Main_Albedo99_g55655;
				half3 Blend_AlbedoTinted2808_g55655 = ( vertexToFrag11_g55667 * vertexToFrag11_g55669 * vertexToFrag11_g55698 * Blend_Albedo265_g55655 );
				float dotResult3616_g55655 = dot( Blend_AlbedoTinted2808_g55655 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_0 = (dotResult3616_g55655).xxx;
				float vertexToFrag11_g55671 = IN.ase_texcoord7.w;
				half Global_Colors_Influence3668_g55655 = vertexToFrag11_g55671;
				float3 lerpResult3618_g55655 = lerp( Blend_AlbedoTinted2808_g55655 , temp_cast_0 , Global_Colors_Influence3668_g55655);
				float3 vertexToFrag3890_g55655 = IN.ase_texcoord11.xyz;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float3 Position58_g55656 = WorldPosition3905_g55655;
				float temp_output_82_0_g55656 = _LayerColorsValue;
				float4 lerpResult88_g55656 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_ColorsCoord).zw + ( (TVE_ColorsCoord).xy * (Position58_g55656).xz ) ),temp_output_82_0_g55656 ) , TVE_ColorsUsage[(int)temp_output_82_0_g55656]);
				half3 Global_ColorsTex_RGB1700_g55655 = (lerpResult88_g55656).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g55701 = 2.0;
				#else
				float staticSwitch1_g55701 = 4.594794;
				#endif
				half3 Global_Colors1954_g55655 = ( Global_ColorsTex_RGB1700_g55655 * staticSwitch1_g55701 );
				float lerpResult3870_g55655 = lerp( 1.0 , IN.ase_color.r , _ColorsVariationValue);
				half Global_Colors_Value3650_g55655 = ( _GlobalColors * lerpResult3870_g55655 );
				float temp_output_7_0_g55702 = _ColorsMaskMinValue;
				half Global_Colors_Mask3692_g55655 = saturate( ( ( ( 1.0 - IN.ase_color.a ) - temp_output_7_0_g55702 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g55702 ) ) );
				float3 lerpResult3628_g55655 = lerp( Blend_AlbedoTinted2808_g55655 , ( lerpResult3618_g55655 * Global_Colors1954_g55655 ) , ( Global_Colors_Value3650_g55655 * Global_Colors_Mask3692_g55655 ));
				half3 Blend_AlbedoColored863_g55655 = lerpResult3628_g55655;
				float3 temp_output_799_0_g55655 = (_SubsurfaceColor).rgb;
				float dotResult3930_g55655 = dot( temp_output_799_0_g55655 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult3930_g55655).xxx;
				float3 lerpResult3932_g55655 = lerp( temp_output_799_0_g55655 , temp_cast_3 , Global_Colors_Influence3668_g55655);
				float3 lerpResult3942_g55655 = lerp( temp_output_799_0_g55655 , ( lerpResult3932_g55655 * Global_Colors1954_g55655 ) , ( Global_Colors_Value3650_g55655 * Global_Colors_Mask3692_g55655 ));
				half3 Subsurface_Color1722_g55655 = lerpResult3942_g55655;
				half MainLight_Subsurface4041_g55655 = TVE_MainLightParams.a;
				half Subsurface_Intensity1752_g55655 = ( _SubsurfaceValue * MainLight_Subsurface4041_g55655 );
				float temp_output_7_0_g55689 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask1557_g55655 = saturate( ( ( IN.ase_color.a - temp_output_7_0_g55689 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g55689 ) ) );
				half3 Subsurface_Transmission884_g55655 = ( Subsurface_Color1722_g55655 * Subsurface_Intensity1752_g55655 * Subsurface_Mask1557_g55655 );
				half3 MainLight_Direction3926_g55655 = TVE_MainLightDirection;
				float3 normalizeResult2169_g55655 = normalize( WorldViewDirection );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult785_g55655 = dot( -MainLight_Direction3926_g55655 , ViewDir_Normalized3963_g55655 );
				float saferPower1624_g55655 = max( (dotResult785_g55655*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g55655 = 0.0;
				#else
				float staticSwitch1602_g55655 = ( pow( saferPower1624_g55655 , _MainLightAngleValue ) * _MainLightScatteringValue );
				#endif
				half Mask_Subsurface_View782_g55655 = staticSwitch1602_g55655;
				half3 Subsurface_Scattering1693_g55655 = ( Subsurface_Transmission884_g55655 * Blend_AlbedoColored863_g55655 * Mask_Subsurface_View782_g55655 );
				half3 Blend_AlbedoAndSubsurface149_g55655 = ( Blend_AlbedoColored863_g55655 + Subsurface_Scattering1693_g55655 );
				half3 Global_OverlayColor1758_g55655 = (TVE_OverlayColor).rgb;
				half Main_AlbedoTex_G3526_g55655 = tex2DNode29_g55655.g;
				float3 Position82_g55713 = WorldPosition3905_g55655;
				float temp_output_84_0_g55713 = _LayerExtrasValue;
				float4 lerpResult88_g55713 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_ExtrasCoord).zw + ( (TVE_ExtrasCoord).xy * (Position82_g55713).xz ) ),temp_output_84_0_g55713 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g55713]);
				float4 break89_g55713 = lerpResult88_g55713;
				half Global_Extras_Overlay156_g55655 = break89_g55713.b;
				float temp_output_1025_0_g55655 = ( _GlobalOverlay * Global_Extras_Overlay156_g55655 );
				float lerpResult1065_g55655 = lerp( 1.0 , IN.ase_color.r , _OverlayVariationValue);
				half Overlay_Commons1365_g55655 = ( temp_output_1025_0_g55655 * lerpResult1065_g55655 );
				float temp_output_7_0_g55673 = _OverlayMaskMinValue;
				half Overlay_Mask269_g55655 = saturate( ( ( ( ( ( IN.ase_color.a * 0.5 ) + Main_AlbedoTex_G3526_g55655 ) * Overlay_Commons1365_g55655 ) - temp_output_7_0_g55673 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g55673 ) ) );
				float3 lerpResult336_g55655 = lerp( Blend_AlbedoAndSubsurface149_g55655 , Global_OverlayColor1758_g55655 , Overlay_Mask269_g55655);
				half3 Final_Albedo359_g55655 = lerpResult336_g55655;
				float3 vertexToFrag11_g55665 = IN.ase_texcoord12.xyz;
				float3 Vertex_Occlusion648_g55655 = saturate( vertexToFrag11_g55665 );
				
				float3 unpack4112_g55655 = UnpackNormalScale( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g55655 ), _MainNormalValue );
				unpack4112_g55655.z = lerp( 1, unpack4112_g55655.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g55655 = unpack4112_g55655;
				float3 temp_output_13_0_g55699 = Main_Normal137_g55655;
				float3 switchResult12_g55699 = (((ase_vface>0)?(temp_output_13_0_g55699):(( temp_output_13_0_g55699 * _render_normals_options ))));
				half3 Blend_Normal312_g55655 = switchResult12_g55699;
				half3 Final_Normal366_g55655 = Blend_Normal312_g55655;
				
				float4 temp_output_4214_0_g55655 = ( _EmissiveColor * _EmissiveIntensityParams.x );
				float2 vertexToFrag11_g55707 = IN.ase_texcoord10.zw;
				half2 Emissive_UVs2468_g55655 = vertexToFrag11_g55707;
				half Global_Extras_Emissive4203_g55655 = break89_g55713.r;
				float lerpResult4206_g55655 = lerp( 1.0 , Global_Extras_Emissive4203_g55655 , _GlobalEmissive);
				half3 Final_Emissive2476_g55655 = ( (( temp_output_4214_0_g55655 * SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs2468_g55655 ) )).rgb * lerpResult4206_g55655 );
				
				float3 temp_cast_7 = (( 0.04 * _RenderSpecular )).xxx;
				
				float4 tex2DNode35_g55655 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g55655 );
				half Main_Smoothness227_g55655 = ( tex2DNode35_g55655.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g55655 = Main_Smoothness227_g55655;
				half Global_OverlaySmoothness311_g55655 = TVE_OverlaySmoothness;
				float lerpResult343_g55655 = lerp( Blend_Smoothness314_g55655 , Global_OverlaySmoothness311_g55655 , Overlay_Mask269_g55655);
				half Final_Smoothness371_g55655 = lerpResult343_g55655;
				half Global_Extras_Wetness305_g55655 = break89_g55713.g;
				float lerpResult3673_g55655 = lerp( 0.0 , Global_Extras_Wetness305_g55655 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g55655 = saturate( ( Final_Smoothness371_g55655 + lerpResult3673_g55655 ) );
				
				float lerpResult240_g55655 = lerp( 1.0 , tex2DNode35_g55655.g , _MainOcclusionValue);
				half Main_Occlusion247_g55655 = lerpResult240_g55655;
				half Blend_Occlusion323_g55655 = Main_Occlusion247_g55655;
				
				float localCustomAlphaClip3735_g55655 = ( 0.0 );
				half Final_AlphaFade3727_g55655 = 1.0;
				float Main_Alpha316_g55655 = ( _MainColor.a * tex2DNode29_g55655.a );
				float Mesh_Variation16_g55655 = IN.ase_color.r;
				float lerpResult4033_g55655 = lerp( 0.9 , (Mesh_Variation16_g55655*0.5 + 0.5) , _AlphaVariationValue);
				half Global_Extras_Alpha1033_g55655 = break89_g55713.a;
				float temp_output_4022_0_g55655 = ( lerpResult4033_g55655 - ( 1.0 - Global_Extras_Alpha1033_g55655 ) );
				half AlphaTreshold2132_g55655 = _Cutoff;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch4017_g55655 = ( temp_output_4022_0_g55655 + AlphaTreshold2132_g55655 );
				#else
				float staticSwitch4017_g55655 = temp_output_4022_0_g55655;
				#endif
				float lerpResult4011_g55655 = lerp( 1.0 , staticSwitch4017_g55655 , _GlobalAlpha);
				half Global_Alpha315_g55655 = saturate( lerpResult4011_g55655 );
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch3792_g55655 = ( ( Main_Alpha316_g55655 * Global_Alpha315_g55655 ) - ( AlphaTreshold2132_g55655 - 0.5 ) );
				#else
				float staticSwitch3792_g55655 = ( Main_Alpha316_g55655 * Global_Alpha315_g55655 );
				#endif
				half Final_Alpha3754_g55655 = staticSwitch3792_g55655;
				float temp_output_661_0_g55655 = ( Final_AlphaFade3727_g55655 * Final_Alpha3754_g55655 );
				float Alpha3735_g55655 = temp_output_661_0_g55655;
				float Treshold3735_g55655 = 0.5;
				{
				#if TVE_ALPHA_CLIP
				clip(Alpha3735_g55655 - Treshold3735_g55655);
				#endif
				}
				half Final_Clip914_g55655 = saturate( Alpha3735_g55655 );
				
				float3 Albedo = ( Final_Albedo359_g55655 * Vertex_Occlusion648_g55655 );
				float3 Normal = Final_Normal366_g55655;
				float3 Emission = Final_Emissive2476_g55655;
				float3 Specular = temp_cast_7;
				float Metallic = 0;
				float Smoothness = Final_SmoothnessAndWetness4130_g55655;
				float Occlusion = Blend_Occlusion323_g55655;
				float Alpha = Final_Clip914_g55655;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			HLSLPROGRAM
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70403
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_VERTEX_DATA_BATCHED
			//TVE Shader Type Defines
			#define TVE_IS_GRASS_SHADER
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
           //Nature Renderer (Procedural Instancing)
           #include "Assets/Visual Design Cafe/Nature Shaders/Common/Nodes/Integrations/Nature Renderer.cginc"
           #pragma instancing_options procedural:SetupNatureRenderer
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			half4 _GradientColorTwo;
			half4 _OverlayMaskRemap;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _MotionHighlightColor;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			float4 _NoiseMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _NoiseColorTwo;
			half4 _EmissiveColor;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveUVs;
			half4 _NoiseColorOne;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _MainColor;
			half3 _render_normals_options;
			half _NoiseScaleValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _render_zw;
			half _PerspectiveNoiseValue;
			half _PerspectivePushValue;
			half _SizeFadeMode;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _GlobalSize;
			half _VertexDataMode;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionMaskValue;
			half _PerspectiveAngleValue;
			half _NoiseMinValue;
			half _ColorsMaskMinValue;
			half _LayerColorsValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			half _GlobalEmissive;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _NoiseMaxValue;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _MainLightScatteringValue;
			half _MainLightAngleValue;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _LayerReactValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerExtrasValue;
			half _InteractionAmplitude;
			half _MotionAmplitude_10;
			half _MotionVariation_10;
			half _RenderCull;
			half _LayersSpace;
			half _FadeSpace;
			half _TranslucencyHDMessage;
			half _SubsurfaceCat;
			half _VertexMasksMode;
			half _NoiseCat;
			half _SizeFadeCat;
			half _VariationMotionMessage;
			half _RenderNormals;
			half _TranslucencyIntensityValue;
			half _IsTVEShader;
			half _DetailMode;
			half _DetailCat;
			half _EmissiveFlagMode;
			half _MotionSpace;
			half _EmissiveCat;
			half _Cutoff;
			half _GradientCat;
			half _OcclusionCat;
			half _render_dst;
			half _IsStandardShader;
			half _IsGrassShader;
			half _render_src;
			half _render_cull;
			half _TranslucencyAmbientValue;
			float _MotionScale_10;
			half _VariationGlobalsMessage;
			half _RenderClip;
			float _MotionSpeed_10;
			half _LayerMotionValue;
			half _vertex_pivot_mode;
			half _AlphaVariationValue;
			half _VertexPivotMode;
			half _TranslucencyScatteringValue;
			half _TranslucencyDirectValue;
			half _IsVersion;
			half _DetailTypeMode;
			half _RenderSSR;
			half _DetailBlendMode;
			half _ReceiveSpace;
			half _SizeFadeMessage;
			half _RenderingCat;
			half _PerspectiveCat;
			half _TranslucencyShadowValue;
			half _RenderZWrite;
			half _RenderPriority;
			half _GlobalCat;
			half _MotionCat;
			half _MainCat;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _VertexVariationMode;
			half _RenderMode;
			half _TranslucencyNormalValue;
			half _GlobalAlpha;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			float4 TVE_MotionTweaks;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoord;
			SAMPLER(samplerTVE_MotionTex);
			float TVE_MotionUsage[9];
			TEXTURE2D(TVE_NoiseTex);
			half4 TVE_NoiseParams;
			SAMPLER(samplerTVE_NoiseTex);
			half4 TVE_ReactParams;
			TEXTURE2D_ARRAY(TVE_ReactTex);
			half4 TVE_ReactCoord;
			SAMPLER(samplerTVE_ReactTex);
			float TVE_ReactUsage[9];
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_DistanceFadeBias;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			float TVE_ExtrasUsage[9];


			
			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g55655 = v.vertex.xyz;
				float3 appendResult60_g55709 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g55655 = ( appendResult60_g55709 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g55655 = Mesh_PivotsData2831_g55655;
				float3 temp_output_2283_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				half3 VertexPos40_g55681 = temp_output_2283_0_g55655;
				float3 appendResult74_g55681 = (float3(VertexPos40_g55681.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g55681 = appendResult74_g55681;
				float3 break84_g55681 = VertexPos40_g55681;
				float3 appendResult81_g55681 = (float3(0.0 , break84_g55681.y , break84_g55681.z));
				half3 VertexPosOtherAxis82_g55681 = appendResult81_g55681;
				half ObjectData20_g55710 = 3.14;
				float Bounds_Height374_g55655 = _MaxBoundsInfo.y;
				half WorldData19_g55710 = ( Bounds_Height374_g55655 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55710 = WorldData19_g55710;
				#else
				float staticSwitch14_g55710 = ObjectData20_g55710;
				#endif
				float Motion_Max_Bending1133_g55655 = staticSwitch14_g55710;
				float4x4 break19_g55661 = GetObjectToWorldMatrix();
				float3 appendResult20_g55661 = (float3(break19_g55661[ 0 ][ 3 ] , break19_g55661[ 1 ][ 3 ] , break19_g55661[ 2 ][ 3 ]));
				float3 appendResult60_g55663 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float3 temp_output_91_0_g55661 = ( appendResult60_g55663 * _vertex_pivot_mode );
				float3 PivotsOnly105_g55661 = (mul( GetObjectToWorldMatrix(), float4( temp_output_91_0_g55661 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g55662 = ( appendResult20_g55661 + PivotsOnly105_g55661 );
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g55662 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55662 = WorldData19_g55662;
				#else
				float3 staticSwitch14_g55662 = ObjectData20_g55662;
				#endif
				float3 temp_output_114_0_g55661 = staticSwitch14_g55662;
				float3 vertexToFrag4224_g55655 = temp_output_114_0_g55661;
				half3 ObjectData20_g55705 = vertexToFrag4224_g55655;
				float3 vertexToFrag3890_g55655 = ase_worldPos;
				half3 WorldData19_g55705 = vertexToFrag3890_g55655;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55705 = WorldData19_g55705;
				#else
				float3 staticSwitch14_g55705 = ObjectData20_g55705;
				#endif
				float3 ObjectPosition4223_g55655 = staticSwitch14_g55705;
				float3 Position83_g55714 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55714 = _LayerMotionValue;
				float4 lerpResult87_g55714 = lerp( TVE_MotionParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_MotionCoord).zw + ( (TVE_MotionCoord).xy * (Position83_g55714).xz ) ),temp_output_84_0_g55714, 0.0 ) , TVE_MotionUsage[(int)temp_output_84_0_g55714]);
				half4 Global_Motion_Params3909_g55655 = lerpResult87_g55714;
				float4 break322_g55720 = Global_Motion_Params3909_g55655;
				half Wind_Power369_g55720 = break322_g55720.z;
				float lerpResult376_g55720 = lerp( TVE_MotionTweaks.x , 1.0 , Wind_Power369_g55720);
				half Wind_Power_103106_g55655 = lerpResult376_g55720;
				float2 panner73_g55658 = ( _TimeParameters.x * (TVE_NoiseParams).xy + ( (ObjectPosition4223_g55655).xz * TVE_NoiseParams.z ));
				float4 tex2DNode75_g55658 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g55658, 0.0 );
				float4 saferPower77_g55658 = max( abs( tex2DNode75_g55658 ) , 0.0001 );
				half Wind_Power2223_g55655 = Wind_Power369_g55720;
				float temp_output_167_0_g55658 = Wind_Power2223_g55655;
				float lerpResult168_g55658 = lerp( 1.4 , 0.2 , temp_output_167_0_g55658);
				float4 temp_cast_5 = (lerpResult168_g55658).xxxx;
				float4 break174_g55658 = pow( saferPower77_g55658 , temp_cast_5 );
				half Global_NoiseTex_R34_g55655 = break174_g55658.r;
				float3 appendResult397_g55720 = (float3(break322_g55720.x , 0.0 , break322_g55720.y));
				float3 temp_output_398_0_g55720 = (appendResult397_g55720*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g55720 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55720 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g55655 = (temp_output_339_0_g55720).xz;
				half Input_Speed62_g55680 = _MotionSpeed_10;
				float mulTime373_g55680 = _TimeParameters.x * Input_Speed62_g55680;
				float3 break111_g55703 = ObjectPosition4223_g55655;
				half Variation_Complex102_g55703 = frac( ( v.ase_color.r + ( break111_g55703.x + break111_g55703.z ) ) );
				half ObjectData20_g55704 = Variation_Complex102_g55703;
				half Variation_Simple105_g55703 = v.ase_color.r;
				half WorldData19_g55704 = Variation_Simple105_g55703;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55704 = WorldData19_g55704;
				#else
				float staticSwitch14_g55704 = ObjectData20_g55704;
				#endif
				half Motion_Variation3073_g55655 = staticSwitch14_g55704;
				half Motion_Variation284_g55680 = ( _MotionVariation_10 * Motion_Variation3073_g55655 );
				float Motion_Scale287_g55680 = ( _MotionScale_10 * ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) );
				half Sine_MinusOneToOne281_g55680 = sin( ( mulTime373_g55680 + Motion_Variation284_g55680 + Motion_Scale287_g55680 ) );
				half Wind_Squash4479_g55655 = TVE_MotionTweaks.w;
				half Input_WindSquash419_g55680 = Wind_Squash4479_g55655;
				half Input_WindPower327_g55680 = Wind_Power_103106_g55655;
				float lerpResult321_g55680 = lerp( Sine_MinusOneToOne281_g55680 , (Sine_MinusOneToOne281_g55680*Input_WindSquash419_g55680 + 1.0) , Input_WindPower327_g55680);
				half Mesh_Motion_1082_g55655 = v.ase_texcoord3.x;
				half2 Motion_10_Bending2258_g55655 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g55655 ) * Wind_Power_103106_g55655 * Global_NoiseTex_R34_g55655 * Wind_DirectionOS39_g55655 * lerpResult321_g55680 * Mesh_Motion_1082_g55655 );
				half Interaction_Amplitude4137_g55655 = _InteractionAmplitude;
				float3 Position83_g55679 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55679 = _LayerReactValue;
				float4 lerpResult87_g55679 = lerp( TVE_ReactParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ReactTex, samplerTVE_ReactTex, ( (TVE_ReactCoord).zw + ( (TVE_ReactCoord).xy * (Position83_g55679).xz ) ),temp_output_84_0_g55679, 0.0 ) , TVE_ReactUsage[(int)temp_output_84_0_g55679]);
				half4 Global_React_Params4173_g55655 = lerpResult87_g55679;
				float4 break322_g55659 = Global_React_Params4173_g55655;
				half Interaction_Mask66_g55655 = break322_g55659.z;
				float3 appendResult397_g55659 = (float3(break322_g55659.x , 0.0 , break322_g55659.y));
				float3 temp_output_398_0_g55659 = (appendResult397_g55659*2.0 + -1.0);
				float3 temp_output_339_0_g55659 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55659 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Interaction_DirectionOS4158_g55655 = (temp_output_339_0_g55659).xz;
				float lerpResult4494_g55655 = lerp( 1.0 , Mesh_Motion_1082_g55655 , _InteractionMaskValue);
				half2 Motion_10_Interaction53_g55655 = ( Interaction_Amplitude4137_g55655 * Motion_Max_Bending1133_g55655 * Interaction_Mask66_g55655 * Interaction_Mask66_g55655 * Interaction_DirectionOS4158_g55655 * lerpResult4494_g55655 );
				float2 lerpResult109_g55655 = lerp( Motion_10_Bending2258_g55655 , Motion_10_Interaction53_g55655 , ( Interaction_Mask66_g55655 * saturate( Interaction_Amplitude4137_g55655 ) ));
				float2 break143_g55655 = lerpResult109_g55655;
				half Motion_10_ZAxis190_g55655 = break143_g55655.y;
				half Angle44_g55681 = Motion_10_ZAxis190_g55655;
				half3 VertexPos40_g55690 = ( VertexPosRotationAxis50_g55681 + ( VertexPosOtherAxis82_g55681 * cos( Angle44_g55681 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g55681 ) * sin( Angle44_g55681 ) ) );
				float3 appendResult74_g55690 = (float3(0.0 , 0.0 , VertexPos40_g55690.z));
				half3 VertexPosRotationAxis50_g55690 = appendResult74_g55690;
				float3 break84_g55690 = VertexPos40_g55690;
				float3 appendResult81_g55690 = (float3(break84_g55690.x , break84_g55690.y , 0.0));
				half3 VertexPosOtherAxis82_g55690 = appendResult81_g55690;
				half Motion_10_XAxis216_g55655 = break143_g55655.x;
				half Angle44_g55690 = -Motion_10_XAxis216_g55655;
				half Motion_Scale321_g55708 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g55708 = _MotionSpeed_32;
				float mulTime349_g55708 = _TimeParameters.x * Input_Speed62_g55708;
				float Motion_Variation330_g55708 = ( _MotionVariation_32 * Motion_Variation3073_g55655 );
				float Bounds_Radius121_g55655 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g55708 = ( _MotionAmplitude_32 * Bounds_Radius121_g55655 * 0.1 );
				float3 temp_output_299_0_g55708 = ( sin( ( ( ase_worldPos * Motion_Scale321_g55708 ) + mulTime349_g55708 + Motion_Variation330_g55708 ) ) * Input_Amplitude58_g55708 );
				half Mesh_Motion_30144_g55655 = v.ase_texcoord3.z;
				float lerpResult378_g55720 = lerp( TVE_MotionTweaks.z , 1.0 , Wind_Power369_g55720);
				half Wind_Power_303115_g55655 = lerpResult378_g55720;
				float temp_output_7_0_g55697 = TVE_MotionFadeEnd;
				half Wind_FadeOut4005_g55655 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g55697 ) / ( TVE_MotionFadeStart - temp_output_7_0_g55697 ) ) );
				half Motion_Selective4260_g55655 = 1.0;
				half3 Motion_30_Details263_g55655 = ( temp_output_299_0_g55708 * ( Global_NoiseTex_R34_g55655 * Mesh_Motion_30144_g55655 * Wind_Power_303115_g55655 * Wind_FadeOut4005_g55655 * Motion_Selective4260_g55655 ) );
				float3 Vertex_Motion_Object833_g55655 = ( ( VertexPosRotationAxis50_g55690 + ( VertexPosOtherAxis82_g55690 * cos( Angle44_g55690 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g55690 ) * sin( Angle44_g55690 ) ) ) + Motion_30_Details263_g55655 );
				float3 temp_output_3474_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				float3 appendResult2043_g55655 = (float3(Motion_10_XAxis216_g55655 , 0.0 , Motion_10_ZAxis190_g55655));
				float3 Vertex_Motion_World1118_g55655 = ( ( temp_output_3474_0_g55655 + appendResult2043_g55655 ) + Motion_30_Details263_g55655 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch3312_g55655 = Vertex_Motion_World1118_g55655;
				#else
				float3 staticSwitch3312_g55655 = ( Vertex_Motion_Object833_g55655 + ( 0.0 * _VertexDataMode ) );
				#endif
				half Global_Vertex_Size174_g55655 = break322_g55659.w;
				float lerpResult346_g55655 = lerp( 1.0 , Global_Vertex_Size174_g55655 , _GlobalSize);
				float3 appendResult3480_g55655 = (float3(lerpResult346_g55655 , lerpResult346_g55655 , lerpResult346_g55655));
				half3 ObjectData20_g55719 = appendResult3480_g55655;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g55719 = _Vector11;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55719 = WorldData19_g55719;
				#else
				float3 staticSwitch14_g55719 = ObjectData20_g55719;
				#endif
				half3 Vertex_Size1741_g55655 = staticSwitch14_g55719;
				half3 _Vector5 = half3(1,1,1);
				float temp_output_7_0_g55715 = _SizeFadeEndValue;
				float temp_output_335_0_g55655 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g55655 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g55715 ) / ( _SizeFadeStartValue - temp_output_7_0_g55715 ) ) );
				float3 appendResult3482_g55655 = (float3(temp_output_335_0_g55655 , temp_output_335_0_g55655 , temp_output_335_0_g55655));
				float3 lerpResult3556_g55655 = lerp( _Vector5 , appendResult3482_g55655 , _SizeFadeMode);
				half3 ObjectData20_g55722 = lerpResult3556_g55655;
				half3 WorldData19_g55722 = _Vector5;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55722 = WorldData19_g55722;
				#else
				float3 staticSwitch14_g55722 = ObjectData20_g55722;
				#endif
				float3 Vertex_SizeFade1740_g55655 = staticSwitch14_g55722;
				float3 normalizeResult2696_g55655 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g55655 = cross( normalizeResult2696_g55655 , half3(0,1,0) );
				float3 appendResult2710_g55655 = (float3(-break2709_g55655.z , 0.0 , break2709_g55655.x));
				float3 appendResult2667_g55655 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g55655 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult2212_g55655 = dot( ViewDir_Normalized3963_g55655 , float3(0,1,0) );
				half Mask_HView2656_g55655 = dotResult2212_g55655;
				float saferPower2652_g55655 = max( Mask_HView2656_g55655 , 0.0001 );
				half3 Grass_Coverage2661_g55655 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g55655 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g55655*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g55655 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g55655 = ( ( staticSwitch3312_g55655 * Vertex_Size1741_g55655 * Vertex_SizeFade1740_g55655 ) + Mesh_PivotsOS2291_g55655 + Grass_Coverage2661_g55655 );
				
				float2 vertexToFrag11_g55666 = ( ( v.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord2.xy = vertexToFrag11_g55666;
				o.ase_texcoord3.xyz = vertexToFrag3890_g55655;
				
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g55655;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip3735_g55655 = ( 0.0 );
				half Final_AlphaFade3727_g55655 = 1.0;
				float2 vertexToFrag11_g55666 = IN.ase_texcoord2.xy;
				half2 Main_UVs15_g55655 = vertexToFrag11_g55666;
				float4 tex2DNode29_g55655 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g55655 );
				float Main_Alpha316_g55655 = ( _MainColor.a * tex2DNode29_g55655.a );
				float Mesh_Variation16_g55655 = IN.ase_color.r;
				float lerpResult4033_g55655 = lerp( 0.9 , (Mesh_Variation16_g55655*0.5 + 0.5) , _AlphaVariationValue);
				float3 vertexToFrag3890_g55655 = IN.ase_texcoord3.xyz;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float3 Position82_g55713 = WorldPosition3905_g55655;
				float temp_output_84_0_g55713 = _LayerExtrasValue;
				float4 lerpResult88_g55713 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_ExtrasCoord).zw + ( (TVE_ExtrasCoord).xy * (Position82_g55713).xz ) ),temp_output_84_0_g55713 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g55713]);
				float4 break89_g55713 = lerpResult88_g55713;
				half Global_Extras_Alpha1033_g55655 = break89_g55713.a;
				float temp_output_4022_0_g55655 = ( lerpResult4033_g55655 - ( 1.0 - Global_Extras_Alpha1033_g55655 ) );
				half AlphaTreshold2132_g55655 = _Cutoff;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch4017_g55655 = ( temp_output_4022_0_g55655 + AlphaTreshold2132_g55655 );
				#else
				float staticSwitch4017_g55655 = temp_output_4022_0_g55655;
				#endif
				float lerpResult4011_g55655 = lerp( 1.0 , staticSwitch4017_g55655 , _GlobalAlpha);
				half Global_Alpha315_g55655 = saturate( lerpResult4011_g55655 );
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch3792_g55655 = ( ( Main_Alpha316_g55655 * Global_Alpha315_g55655 ) - ( AlphaTreshold2132_g55655 - 0.5 ) );
				#else
				float staticSwitch3792_g55655 = ( Main_Alpha316_g55655 * Global_Alpha315_g55655 );
				#endif
				half Final_Alpha3754_g55655 = staticSwitch3792_g55655;
				float temp_output_661_0_g55655 = ( Final_AlphaFade3727_g55655 * Final_Alpha3754_g55655 );
				float Alpha3735_g55655 = temp_output_661_0_g55655;
				float Treshold3735_g55655 = 0.5;
				{
				#if TVE_ALPHA_CLIP
				clip(Alpha3735_g55655 - Treshold3735_g55655);
				#endif
				}
				half Final_Clip914_g55655 = saturate( Alpha3735_g55655 );
				
				float Alpha = Final_Clip914_g55655;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70403
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_VERTEX_DATA_BATCHED
			//TVE Shader Type Defines
			#define TVE_IS_GRASS_SHADER
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
           //Nature Renderer (Procedural Instancing)
           #include "Assets/Visual Design Cafe/Nature Shaders/Common/Nodes/Integrations/Nature Renderer.cginc"
           #pragma instancing_options procedural:SetupNatureRenderer
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			half4 _GradientColorTwo;
			half4 _OverlayMaskRemap;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _MotionHighlightColor;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			float4 _NoiseMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _NoiseColorTwo;
			half4 _EmissiveColor;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveUVs;
			half4 _NoiseColorOne;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _MainColor;
			half3 _render_normals_options;
			half _NoiseScaleValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _render_zw;
			half _PerspectiveNoiseValue;
			half _PerspectivePushValue;
			half _SizeFadeMode;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _GlobalSize;
			half _VertexDataMode;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionMaskValue;
			half _PerspectiveAngleValue;
			half _NoiseMinValue;
			half _ColorsMaskMinValue;
			half _LayerColorsValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			half _GlobalEmissive;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _NoiseMaxValue;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _MainLightScatteringValue;
			half _MainLightAngleValue;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _LayerReactValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerExtrasValue;
			half _InteractionAmplitude;
			half _MotionAmplitude_10;
			half _MotionVariation_10;
			half _RenderCull;
			half _LayersSpace;
			half _FadeSpace;
			half _TranslucencyHDMessage;
			half _SubsurfaceCat;
			half _VertexMasksMode;
			half _NoiseCat;
			half _SizeFadeCat;
			half _VariationMotionMessage;
			half _RenderNormals;
			half _TranslucencyIntensityValue;
			half _IsTVEShader;
			half _DetailMode;
			half _DetailCat;
			half _EmissiveFlagMode;
			half _MotionSpace;
			half _EmissiveCat;
			half _Cutoff;
			half _GradientCat;
			half _OcclusionCat;
			half _render_dst;
			half _IsStandardShader;
			half _IsGrassShader;
			half _render_src;
			half _render_cull;
			half _TranslucencyAmbientValue;
			float _MotionScale_10;
			half _VariationGlobalsMessage;
			half _RenderClip;
			float _MotionSpeed_10;
			half _LayerMotionValue;
			half _vertex_pivot_mode;
			half _AlphaVariationValue;
			half _VertexPivotMode;
			half _TranslucencyScatteringValue;
			half _TranslucencyDirectValue;
			half _IsVersion;
			half _DetailTypeMode;
			half _RenderSSR;
			half _DetailBlendMode;
			half _ReceiveSpace;
			half _SizeFadeMessage;
			half _RenderingCat;
			half _PerspectiveCat;
			half _TranslucencyShadowValue;
			half _RenderZWrite;
			half _RenderPriority;
			half _GlobalCat;
			half _MotionCat;
			half _MainCat;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _VertexVariationMode;
			half _RenderMode;
			half _TranslucencyNormalValue;
			half _GlobalAlpha;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			float4 TVE_MotionTweaks;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoord;
			SAMPLER(samplerTVE_MotionTex);
			float TVE_MotionUsage[9];
			TEXTURE2D(TVE_NoiseTex);
			half4 TVE_NoiseParams;
			SAMPLER(samplerTVE_NoiseTex);
			half4 TVE_ReactParams;
			TEXTURE2D_ARRAY(TVE_ReactTex);
			half4 TVE_ReactCoord;
			SAMPLER(samplerTVE_ReactTex);
			float TVE_ReactUsage[9];
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_DistanceFadeBias;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			float TVE_ExtrasUsage[9];


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g55655 = v.vertex.xyz;
				float3 appendResult60_g55709 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g55655 = ( appendResult60_g55709 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g55655 = Mesh_PivotsData2831_g55655;
				float3 temp_output_2283_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				half3 VertexPos40_g55681 = temp_output_2283_0_g55655;
				float3 appendResult74_g55681 = (float3(VertexPos40_g55681.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g55681 = appendResult74_g55681;
				float3 break84_g55681 = VertexPos40_g55681;
				float3 appendResult81_g55681 = (float3(0.0 , break84_g55681.y , break84_g55681.z));
				half3 VertexPosOtherAxis82_g55681 = appendResult81_g55681;
				half ObjectData20_g55710 = 3.14;
				float Bounds_Height374_g55655 = _MaxBoundsInfo.y;
				half WorldData19_g55710 = ( Bounds_Height374_g55655 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55710 = WorldData19_g55710;
				#else
				float staticSwitch14_g55710 = ObjectData20_g55710;
				#endif
				float Motion_Max_Bending1133_g55655 = staticSwitch14_g55710;
				float4x4 break19_g55661 = GetObjectToWorldMatrix();
				float3 appendResult20_g55661 = (float3(break19_g55661[ 0 ][ 3 ] , break19_g55661[ 1 ][ 3 ] , break19_g55661[ 2 ][ 3 ]));
				float3 appendResult60_g55663 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float3 temp_output_91_0_g55661 = ( appendResult60_g55663 * _vertex_pivot_mode );
				float3 PivotsOnly105_g55661 = (mul( GetObjectToWorldMatrix(), float4( temp_output_91_0_g55661 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g55662 = ( appendResult20_g55661 + PivotsOnly105_g55661 );
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g55662 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55662 = WorldData19_g55662;
				#else
				float3 staticSwitch14_g55662 = ObjectData20_g55662;
				#endif
				float3 temp_output_114_0_g55661 = staticSwitch14_g55662;
				float3 vertexToFrag4224_g55655 = temp_output_114_0_g55661;
				half3 ObjectData20_g55705 = vertexToFrag4224_g55655;
				float3 vertexToFrag3890_g55655 = ase_worldPos;
				half3 WorldData19_g55705 = vertexToFrag3890_g55655;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55705 = WorldData19_g55705;
				#else
				float3 staticSwitch14_g55705 = ObjectData20_g55705;
				#endif
				float3 ObjectPosition4223_g55655 = staticSwitch14_g55705;
				float3 Position83_g55714 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55714 = _LayerMotionValue;
				float4 lerpResult87_g55714 = lerp( TVE_MotionParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_MotionCoord).zw + ( (TVE_MotionCoord).xy * (Position83_g55714).xz ) ),temp_output_84_0_g55714, 0.0 ) , TVE_MotionUsage[(int)temp_output_84_0_g55714]);
				half4 Global_Motion_Params3909_g55655 = lerpResult87_g55714;
				float4 break322_g55720 = Global_Motion_Params3909_g55655;
				half Wind_Power369_g55720 = break322_g55720.z;
				float lerpResult376_g55720 = lerp( TVE_MotionTweaks.x , 1.0 , Wind_Power369_g55720);
				half Wind_Power_103106_g55655 = lerpResult376_g55720;
				float2 panner73_g55658 = ( _TimeParameters.x * (TVE_NoiseParams).xy + ( (ObjectPosition4223_g55655).xz * TVE_NoiseParams.z ));
				float4 tex2DNode75_g55658 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g55658, 0.0 );
				float4 saferPower77_g55658 = max( abs( tex2DNode75_g55658 ) , 0.0001 );
				half Wind_Power2223_g55655 = Wind_Power369_g55720;
				float temp_output_167_0_g55658 = Wind_Power2223_g55655;
				float lerpResult168_g55658 = lerp( 1.4 , 0.2 , temp_output_167_0_g55658);
				float4 temp_cast_5 = (lerpResult168_g55658).xxxx;
				float4 break174_g55658 = pow( saferPower77_g55658 , temp_cast_5 );
				half Global_NoiseTex_R34_g55655 = break174_g55658.r;
				float3 appendResult397_g55720 = (float3(break322_g55720.x , 0.0 , break322_g55720.y));
				float3 temp_output_398_0_g55720 = (appendResult397_g55720*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g55720 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55720 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g55655 = (temp_output_339_0_g55720).xz;
				half Input_Speed62_g55680 = _MotionSpeed_10;
				float mulTime373_g55680 = _TimeParameters.x * Input_Speed62_g55680;
				float3 break111_g55703 = ObjectPosition4223_g55655;
				half Variation_Complex102_g55703 = frac( ( v.ase_color.r + ( break111_g55703.x + break111_g55703.z ) ) );
				half ObjectData20_g55704 = Variation_Complex102_g55703;
				half Variation_Simple105_g55703 = v.ase_color.r;
				half WorldData19_g55704 = Variation_Simple105_g55703;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55704 = WorldData19_g55704;
				#else
				float staticSwitch14_g55704 = ObjectData20_g55704;
				#endif
				half Motion_Variation3073_g55655 = staticSwitch14_g55704;
				half Motion_Variation284_g55680 = ( _MotionVariation_10 * Motion_Variation3073_g55655 );
				float Motion_Scale287_g55680 = ( _MotionScale_10 * ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) );
				half Sine_MinusOneToOne281_g55680 = sin( ( mulTime373_g55680 + Motion_Variation284_g55680 + Motion_Scale287_g55680 ) );
				half Wind_Squash4479_g55655 = TVE_MotionTweaks.w;
				half Input_WindSquash419_g55680 = Wind_Squash4479_g55655;
				half Input_WindPower327_g55680 = Wind_Power_103106_g55655;
				float lerpResult321_g55680 = lerp( Sine_MinusOneToOne281_g55680 , (Sine_MinusOneToOne281_g55680*Input_WindSquash419_g55680 + 1.0) , Input_WindPower327_g55680);
				half Mesh_Motion_1082_g55655 = v.ase_texcoord3.x;
				half2 Motion_10_Bending2258_g55655 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g55655 ) * Wind_Power_103106_g55655 * Global_NoiseTex_R34_g55655 * Wind_DirectionOS39_g55655 * lerpResult321_g55680 * Mesh_Motion_1082_g55655 );
				half Interaction_Amplitude4137_g55655 = _InteractionAmplitude;
				float3 Position83_g55679 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55679 = _LayerReactValue;
				float4 lerpResult87_g55679 = lerp( TVE_ReactParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ReactTex, samplerTVE_ReactTex, ( (TVE_ReactCoord).zw + ( (TVE_ReactCoord).xy * (Position83_g55679).xz ) ),temp_output_84_0_g55679, 0.0 ) , TVE_ReactUsage[(int)temp_output_84_0_g55679]);
				half4 Global_React_Params4173_g55655 = lerpResult87_g55679;
				float4 break322_g55659 = Global_React_Params4173_g55655;
				half Interaction_Mask66_g55655 = break322_g55659.z;
				float3 appendResult397_g55659 = (float3(break322_g55659.x , 0.0 , break322_g55659.y));
				float3 temp_output_398_0_g55659 = (appendResult397_g55659*2.0 + -1.0);
				float3 temp_output_339_0_g55659 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55659 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Interaction_DirectionOS4158_g55655 = (temp_output_339_0_g55659).xz;
				float lerpResult4494_g55655 = lerp( 1.0 , Mesh_Motion_1082_g55655 , _InteractionMaskValue);
				half2 Motion_10_Interaction53_g55655 = ( Interaction_Amplitude4137_g55655 * Motion_Max_Bending1133_g55655 * Interaction_Mask66_g55655 * Interaction_Mask66_g55655 * Interaction_DirectionOS4158_g55655 * lerpResult4494_g55655 );
				float2 lerpResult109_g55655 = lerp( Motion_10_Bending2258_g55655 , Motion_10_Interaction53_g55655 , ( Interaction_Mask66_g55655 * saturate( Interaction_Amplitude4137_g55655 ) ));
				float2 break143_g55655 = lerpResult109_g55655;
				half Motion_10_ZAxis190_g55655 = break143_g55655.y;
				half Angle44_g55681 = Motion_10_ZAxis190_g55655;
				half3 VertexPos40_g55690 = ( VertexPosRotationAxis50_g55681 + ( VertexPosOtherAxis82_g55681 * cos( Angle44_g55681 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g55681 ) * sin( Angle44_g55681 ) ) );
				float3 appendResult74_g55690 = (float3(0.0 , 0.0 , VertexPos40_g55690.z));
				half3 VertexPosRotationAxis50_g55690 = appendResult74_g55690;
				float3 break84_g55690 = VertexPos40_g55690;
				float3 appendResult81_g55690 = (float3(break84_g55690.x , break84_g55690.y , 0.0));
				half3 VertexPosOtherAxis82_g55690 = appendResult81_g55690;
				half Motion_10_XAxis216_g55655 = break143_g55655.x;
				half Angle44_g55690 = -Motion_10_XAxis216_g55655;
				half Motion_Scale321_g55708 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g55708 = _MotionSpeed_32;
				float mulTime349_g55708 = _TimeParameters.x * Input_Speed62_g55708;
				float Motion_Variation330_g55708 = ( _MotionVariation_32 * Motion_Variation3073_g55655 );
				float Bounds_Radius121_g55655 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g55708 = ( _MotionAmplitude_32 * Bounds_Radius121_g55655 * 0.1 );
				float3 temp_output_299_0_g55708 = ( sin( ( ( ase_worldPos * Motion_Scale321_g55708 ) + mulTime349_g55708 + Motion_Variation330_g55708 ) ) * Input_Amplitude58_g55708 );
				half Mesh_Motion_30144_g55655 = v.ase_texcoord3.z;
				float lerpResult378_g55720 = lerp( TVE_MotionTweaks.z , 1.0 , Wind_Power369_g55720);
				half Wind_Power_303115_g55655 = lerpResult378_g55720;
				float temp_output_7_0_g55697 = TVE_MotionFadeEnd;
				half Wind_FadeOut4005_g55655 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g55697 ) / ( TVE_MotionFadeStart - temp_output_7_0_g55697 ) ) );
				half Motion_Selective4260_g55655 = 1.0;
				half3 Motion_30_Details263_g55655 = ( temp_output_299_0_g55708 * ( Global_NoiseTex_R34_g55655 * Mesh_Motion_30144_g55655 * Wind_Power_303115_g55655 * Wind_FadeOut4005_g55655 * Motion_Selective4260_g55655 ) );
				float3 Vertex_Motion_Object833_g55655 = ( ( VertexPosRotationAxis50_g55690 + ( VertexPosOtherAxis82_g55690 * cos( Angle44_g55690 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g55690 ) * sin( Angle44_g55690 ) ) ) + Motion_30_Details263_g55655 );
				float3 temp_output_3474_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				float3 appendResult2043_g55655 = (float3(Motion_10_XAxis216_g55655 , 0.0 , Motion_10_ZAxis190_g55655));
				float3 Vertex_Motion_World1118_g55655 = ( ( temp_output_3474_0_g55655 + appendResult2043_g55655 ) + Motion_30_Details263_g55655 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch3312_g55655 = Vertex_Motion_World1118_g55655;
				#else
				float3 staticSwitch3312_g55655 = ( Vertex_Motion_Object833_g55655 + ( 0.0 * _VertexDataMode ) );
				#endif
				half Global_Vertex_Size174_g55655 = break322_g55659.w;
				float lerpResult346_g55655 = lerp( 1.0 , Global_Vertex_Size174_g55655 , _GlobalSize);
				float3 appendResult3480_g55655 = (float3(lerpResult346_g55655 , lerpResult346_g55655 , lerpResult346_g55655));
				half3 ObjectData20_g55719 = appendResult3480_g55655;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g55719 = _Vector11;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55719 = WorldData19_g55719;
				#else
				float3 staticSwitch14_g55719 = ObjectData20_g55719;
				#endif
				half3 Vertex_Size1741_g55655 = staticSwitch14_g55719;
				half3 _Vector5 = half3(1,1,1);
				float temp_output_7_0_g55715 = _SizeFadeEndValue;
				float temp_output_335_0_g55655 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g55655 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g55715 ) / ( _SizeFadeStartValue - temp_output_7_0_g55715 ) ) );
				float3 appendResult3482_g55655 = (float3(temp_output_335_0_g55655 , temp_output_335_0_g55655 , temp_output_335_0_g55655));
				float3 lerpResult3556_g55655 = lerp( _Vector5 , appendResult3482_g55655 , _SizeFadeMode);
				half3 ObjectData20_g55722 = lerpResult3556_g55655;
				half3 WorldData19_g55722 = _Vector5;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55722 = WorldData19_g55722;
				#else
				float3 staticSwitch14_g55722 = ObjectData20_g55722;
				#endif
				float3 Vertex_SizeFade1740_g55655 = staticSwitch14_g55722;
				float3 normalizeResult2696_g55655 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g55655 = cross( normalizeResult2696_g55655 , half3(0,1,0) );
				float3 appendResult2710_g55655 = (float3(-break2709_g55655.z , 0.0 , break2709_g55655.x));
				float3 appendResult2667_g55655 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g55655 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult2212_g55655 = dot( ViewDir_Normalized3963_g55655 , float3(0,1,0) );
				half Mask_HView2656_g55655 = dotResult2212_g55655;
				float saferPower2652_g55655 = max( Mask_HView2656_g55655 , 0.0001 );
				half3 Grass_Coverage2661_g55655 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g55655 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g55655*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g55655 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g55655 = ( ( staticSwitch3312_g55655 * Vertex_Size1741_g55655 * Vertex_SizeFade1740_g55655 ) + Mesh_PivotsOS2291_g55655 + Grass_Coverage2661_g55655 );
				
				float2 vertexToFrag11_g55666 = ( ( v.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord2.xy = vertexToFrag11_g55666;
				o.ase_texcoord3.xyz = vertexToFrag3890_g55655;
				
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g55655;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip3735_g55655 = ( 0.0 );
				half Final_AlphaFade3727_g55655 = 1.0;
				float2 vertexToFrag11_g55666 = IN.ase_texcoord2.xy;
				half2 Main_UVs15_g55655 = vertexToFrag11_g55666;
				float4 tex2DNode29_g55655 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g55655 );
				float Main_Alpha316_g55655 = ( _MainColor.a * tex2DNode29_g55655.a );
				float Mesh_Variation16_g55655 = IN.ase_color.r;
				float lerpResult4033_g55655 = lerp( 0.9 , (Mesh_Variation16_g55655*0.5 + 0.5) , _AlphaVariationValue);
				float3 vertexToFrag3890_g55655 = IN.ase_texcoord3.xyz;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float3 Position82_g55713 = WorldPosition3905_g55655;
				float temp_output_84_0_g55713 = _LayerExtrasValue;
				float4 lerpResult88_g55713 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_ExtrasCoord).zw + ( (TVE_ExtrasCoord).xy * (Position82_g55713).xz ) ),temp_output_84_0_g55713 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g55713]);
				float4 break89_g55713 = lerpResult88_g55713;
				half Global_Extras_Alpha1033_g55655 = break89_g55713.a;
				float temp_output_4022_0_g55655 = ( lerpResult4033_g55655 - ( 1.0 - Global_Extras_Alpha1033_g55655 ) );
				half AlphaTreshold2132_g55655 = _Cutoff;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch4017_g55655 = ( temp_output_4022_0_g55655 + AlphaTreshold2132_g55655 );
				#else
				float staticSwitch4017_g55655 = temp_output_4022_0_g55655;
				#endif
				float lerpResult4011_g55655 = lerp( 1.0 , staticSwitch4017_g55655 , _GlobalAlpha);
				half Global_Alpha315_g55655 = saturate( lerpResult4011_g55655 );
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch3792_g55655 = ( ( Main_Alpha316_g55655 * Global_Alpha315_g55655 ) - ( AlphaTreshold2132_g55655 - 0.5 ) );
				#else
				float staticSwitch3792_g55655 = ( Main_Alpha316_g55655 * Global_Alpha315_g55655 );
				#endif
				half Final_Alpha3754_g55655 = staticSwitch3792_g55655;
				float temp_output_661_0_g55655 = ( Final_AlphaFade3727_g55655 * Final_Alpha3754_g55655 );
				float Alpha3735_g55655 = temp_output_661_0_g55655;
				float Treshold3735_g55655 = 0.5;
				{
				#if TVE_ALPHA_CLIP
				clip(Alpha3735_g55655 - Treshold3735_g55655);
				#endif
				}
				half Final_Clip914_g55655 = saturate( Alpha3735_g55655 );
				
				float Alpha = Final_Clip914_g55655;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70403
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_VERTEX_DATA_BATCHED
			//TVE Shader Type Defines
			#define TVE_IS_GRASS_SHADER
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
           //Nature Renderer (Procedural Instancing)
           #include "Assets/Visual Design Cafe/Nature Shaders/Common/Nodes/Integrations/Nature Renderer.cginc"
           #pragma instancing_options procedural:SetupNatureRenderer
			//SHADER INJECTION POINT END


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			half4 _GradientColorTwo;
			half4 _OverlayMaskRemap;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _MotionHighlightColor;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			float4 _NoiseMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _NoiseColorTwo;
			half4 _EmissiveColor;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveUVs;
			half4 _NoiseColorOne;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _MainColor;
			half3 _render_normals_options;
			half _NoiseScaleValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _render_zw;
			half _PerspectiveNoiseValue;
			half _PerspectivePushValue;
			half _SizeFadeMode;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _GlobalSize;
			half _VertexDataMode;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionMaskValue;
			half _PerspectiveAngleValue;
			half _NoiseMinValue;
			half _ColorsMaskMinValue;
			half _LayerColorsValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			half _GlobalEmissive;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _NoiseMaxValue;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _MainLightScatteringValue;
			half _MainLightAngleValue;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _LayerReactValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerExtrasValue;
			half _InteractionAmplitude;
			half _MotionAmplitude_10;
			half _MotionVariation_10;
			half _RenderCull;
			half _LayersSpace;
			half _FadeSpace;
			half _TranslucencyHDMessage;
			half _SubsurfaceCat;
			half _VertexMasksMode;
			half _NoiseCat;
			half _SizeFadeCat;
			half _VariationMotionMessage;
			half _RenderNormals;
			half _TranslucencyIntensityValue;
			half _IsTVEShader;
			half _DetailMode;
			half _DetailCat;
			half _EmissiveFlagMode;
			half _MotionSpace;
			half _EmissiveCat;
			half _Cutoff;
			half _GradientCat;
			half _OcclusionCat;
			half _render_dst;
			half _IsStandardShader;
			half _IsGrassShader;
			half _render_src;
			half _render_cull;
			half _TranslucencyAmbientValue;
			float _MotionScale_10;
			half _VariationGlobalsMessage;
			half _RenderClip;
			float _MotionSpeed_10;
			half _LayerMotionValue;
			half _vertex_pivot_mode;
			half _AlphaVariationValue;
			half _VertexPivotMode;
			half _TranslucencyScatteringValue;
			half _TranslucencyDirectValue;
			half _IsVersion;
			half _DetailTypeMode;
			half _RenderSSR;
			half _DetailBlendMode;
			half _ReceiveSpace;
			half _SizeFadeMessage;
			half _RenderingCat;
			half _PerspectiveCat;
			half _TranslucencyShadowValue;
			half _RenderZWrite;
			half _RenderPriority;
			half _GlobalCat;
			half _MotionCat;
			half _MainCat;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _VertexVariationMode;
			half _RenderMode;
			half _TranslucencyNormalValue;
			half _GlobalAlpha;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			float4 TVE_MotionTweaks;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoord;
			SAMPLER(samplerTVE_MotionTex);
			float TVE_MotionUsage[9];
			TEXTURE2D(TVE_NoiseTex);
			half4 TVE_NoiseParams;
			SAMPLER(samplerTVE_NoiseTex);
			half4 TVE_ReactParams;
			TEXTURE2D_ARRAY(TVE_ReactTex);
			half4 TVE_ReactCoord;
			SAMPLER(samplerTVE_ReactTex);
			float TVE_ReactUsage[9];
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_DistanceFadeBias;
			TEXTURE3D(TVE_WorldTex3D);
			SAMPLER(samplerTVE_WorldTex3D);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoord;
			SAMPLER(samplerTVE_ColorsTex);
			float TVE_ColorsUsage[9];
			half4 TVE_MainLightParams;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			float TVE_ExtrasUsage[9];
			TEXTURE2D(_EmissiveTex);
			SAMPLER(sampler_EmissiveTex);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g55655 = v.vertex.xyz;
				float3 appendResult60_g55709 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g55655 = ( appendResult60_g55709 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g55655 = Mesh_PivotsData2831_g55655;
				float3 temp_output_2283_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				half3 VertexPos40_g55681 = temp_output_2283_0_g55655;
				float3 appendResult74_g55681 = (float3(VertexPos40_g55681.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g55681 = appendResult74_g55681;
				float3 break84_g55681 = VertexPos40_g55681;
				float3 appendResult81_g55681 = (float3(0.0 , break84_g55681.y , break84_g55681.z));
				half3 VertexPosOtherAxis82_g55681 = appendResult81_g55681;
				half ObjectData20_g55710 = 3.14;
				float Bounds_Height374_g55655 = _MaxBoundsInfo.y;
				half WorldData19_g55710 = ( Bounds_Height374_g55655 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55710 = WorldData19_g55710;
				#else
				float staticSwitch14_g55710 = ObjectData20_g55710;
				#endif
				float Motion_Max_Bending1133_g55655 = staticSwitch14_g55710;
				float4x4 break19_g55661 = GetObjectToWorldMatrix();
				float3 appendResult20_g55661 = (float3(break19_g55661[ 0 ][ 3 ] , break19_g55661[ 1 ][ 3 ] , break19_g55661[ 2 ][ 3 ]));
				float3 appendResult60_g55663 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float3 temp_output_91_0_g55661 = ( appendResult60_g55663 * _vertex_pivot_mode );
				float3 PivotsOnly105_g55661 = (mul( GetObjectToWorldMatrix(), float4( temp_output_91_0_g55661 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g55662 = ( appendResult20_g55661 + PivotsOnly105_g55661 );
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g55662 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55662 = WorldData19_g55662;
				#else
				float3 staticSwitch14_g55662 = ObjectData20_g55662;
				#endif
				float3 temp_output_114_0_g55661 = staticSwitch14_g55662;
				float3 vertexToFrag4224_g55655 = temp_output_114_0_g55661;
				half3 ObjectData20_g55705 = vertexToFrag4224_g55655;
				float3 vertexToFrag3890_g55655 = ase_worldPos;
				half3 WorldData19_g55705 = vertexToFrag3890_g55655;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55705 = WorldData19_g55705;
				#else
				float3 staticSwitch14_g55705 = ObjectData20_g55705;
				#endif
				float3 ObjectPosition4223_g55655 = staticSwitch14_g55705;
				float3 Position83_g55714 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55714 = _LayerMotionValue;
				float4 lerpResult87_g55714 = lerp( TVE_MotionParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_MotionCoord).zw + ( (TVE_MotionCoord).xy * (Position83_g55714).xz ) ),temp_output_84_0_g55714, 0.0 ) , TVE_MotionUsage[(int)temp_output_84_0_g55714]);
				half4 Global_Motion_Params3909_g55655 = lerpResult87_g55714;
				float4 break322_g55720 = Global_Motion_Params3909_g55655;
				half Wind_Power369_g55720 = break322_g55720.z;
				float lerpResult376_g55720 = lerp( TVE_MotionTweaks.x , 1.0 , Wind_Power369_g55720);
				half Wind_Power_103106_g55655 = lerpResult376_g55720;
				float2 panner73_g55658 = ( _TimeParameters.x * (TVE_NoiseParams).xy + ( (ObjectPosition4223_g55655).xz * TVE_NoiseParams.z ));
				float4 tex2DNode75_g55658 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g55658, 0.0 );
				float4 saferPower77_g55658 = max( abs( tex2DNode75_g55658 ) , 0.0001 );
				half Wind_Power2223_g55655 = Wind_Power369_g55720;
				float temp_output_167_0_g55658 = Wind_Power2223_g55655;
				float lerpResult168_g55658 = lerp( 1.4 , 0.2 , temp_output_167_0_g55658);
				float4 temp_cast_5 = (lerpResult168_g55658).xxxx;
				float4 break174_g55658 = pow( saferPower77_g55658 , temp_cast_5 );
				half Global_NoiseTex_R34_g55655 = break174_g55658.r;
				float3 appendResult397_g55720 = (float3(break322_g55720.x , 0.0 , break322_g55720.y));
				float3 temp_output_398_0_g55720 = (appendResult397_g55720*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g55720 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55720 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g55655 = (temp_output_339_0_g55720).xz;
				half Input_Speed62_g55680 = _MotionSpeed_10;
				float mulTime373_g55680 = _TimeParameters.x * Input_Speed62_g55680;
				float3 break111_g55703 = ObjectPosition4223_g55655;
				half Variation_Complex102_g55703 = frac( ( v.ase_color.r + ( break111_g55703.x + break111_g55703.z ) ) );
				half ObjectData20_g55704 = Variation_Complex102_g55703;
				half Variation_Simple105_g55703 = v.ase_color.r;
				half WorldData19_g55704 = Variation_Simple105_g55703;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55704 = WorldData19_g55704;
				#else
				float staticSwitch14_g55704 = ObjectData20_g55704;
				#endif
				half Motion_Variation3073_g55655 = staticSwitch14_g55704;
				half Motion_Variation284_g55680 = ( _MotionVariation_10 * Motion_Variation3073_g55655 );
				float Motion_Scale287_g55680 = ( _MotionScale_10 * ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) );
				half Sine_MinusOneToOne281_g55680 = sin( ( mulTime373_g55680 + Motion_Variation284_g55680 + Motion_Scale287_g55680 ) );
				half Wind_Squash4479_g55655 = TVE_MotionTweaks.w;
				half Input_WindSquash419_g55680 = Wind_Squash4479_g55655;
				half Input_WindPower327_g55680 = Wind_Power_103106_g55655;
				float lerpResult321_g55680 = lerp( Sine_MinusOneToOne281_g55680 , (Sine_MinusOneToOne281_g55680*Input_WindSquash419_g55680 + 1.0) , Input_WindPower327_g55680);
				half Mesh_Motion_1082_g55655 = v.ase_texcoord3.x;
				half2 Motion_10_Bending2258_g55655 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g55655 ) * Wind_Power_103106_g55655 * Global_NoiseTex_R34_g55655 * Wind_DirectionOS39_g55655 * lerpResult321_g55680 * Mesh_Motion_1082_g55655 );
				half Interaction_Amplitude4137_g55655 = _InteractionAmplitude;
				float3 Position83_g55679 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55679 = _LayerReactValue;
				float4 lerpResult87_g55679 = lerp( TVE_ReactParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ReactTex, samplerTVE_ReactTex, ( (TVE_ReactCoord).zw + ( (TVE_ReactCoord).xy * (Position83_g55679).xz ) ),temp_output_84_0_g55679, 0.0 ) , TVE_ReactUsage[(int)temp_output_84_0_g55679]);
				half4 Global_React_Params4173_g55655 = lerpResult87_g55679;
				float4 break322_g55659 = Global_React_Params4173_g55655;
				half Interaction_Mask66_g55655 = break322_g55659.z;
				float3 appendResult397_g55659 = (float3(break322_g55659.x , 0.0 , break322_g55659.y));
				float3 temp_output_398_0_g55659 = (appendResult397_g55659*2.0 + -1.0);
				float3 temp_output_339_0_g55659 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55659 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Interaction_DirectionOS4158_g55655 = (temp_output_339_0_g55659).xz;
				float lerpResult4494_g55655 = lerp( 1.0 , Mesh_Motion_1082_g55655 , _InteractionMaskValue);
				half2 Motion_10_Interaction53_g55655 = ( Interaction_Amplitude4137_g55655 * Motion_Max_Bending1133_g55655 * Interaction_Mask66_g55655 * Interaction_Mask66_g55655 * Interaction_DirectionOS4158_g55655 * lerpResult4494_g55655 );
				float2 lerpResult109_g55655 = lerp( Motion_10_Bending2258_g55655 , Motion_10_Interaction53_g55655 , ( Interaction_Mask66_g55655 * saturate( Interaction_Amplitude4137_g55655 ) ));
				float2 break143_g55655 = lerpResult109_g55655;
				half Motion_10_ZAxis190_g55655 = break143_g55655.y;
				half Angle44_g55681 = Motion_10_ZAxis190_g55655;
				half3 VertexPos40_g55690 = ( VertexPosRotationAxis50_g55681 + ( VertexPosOtherAxis82_g55681 * cos( Angle44_g55681 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g55681 ) * sin( Angle44_g55681 ) ) );
				float3 appendResult74_g55690 = (float3(0.0 , 0.0 , VertexPos40_g55690.z));
				half3 VertexPosRotationAxis50_g55690 = appendResult74_g55690;
				float3 break84_g55690 = VertexPos40_g55690;
				float3 appendResult81_g55690 = (float3(break84_g55690.x , break84_g55690.y , 0.0));
				half3 VertexPosOtherAxis82_g55690 = appendResult81_g55690;
				half Motion_10_XAxis216_g55655 = break143_g55655.x;
				half Angle44_g55690 = -Motion_10_XAxis216_g55655;
				half Motion_Scale321_g55708 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g55708 = _MotionSpeed_32;
				float mulTime349_g55708 = _TimeParameters.x * Input_Speed62_g55708;
				float Motion_Variation330_g55708 = ( _MotionVariation_32 * Motion_Variation3073_g55655 );
				float Bounds_Radius121_g55655 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g55708 = ( _MotionAmplitude_32 * Bounds_Radius121_g55655 * 0.1 );
				float3 temp_output_299_0_g55708 = ( sin( ( ( ase_worldPos * Motion_Scale321_g55708 ) + mulTime349_g55708 + Motion_Variation330_g55708 ) ) * Input_Amplitude58_g55708 );
				half Mesh_Motion_30144_g55655 = v.ase_texcoord3.z;
				float lerpResult378_g55720 = lerp( TVE_MotionTweaks.z , 1.0 , Wind_Power369_g55720);
				half Wind_Power_303115_g55655 = lerpResult378_g55720;
				float temp_output_7_0_g55697 = TVE_MotionFadeEnd;
				half Wind_FadeOut4005_g55655 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g55697 ) / ( TVE_MotionFadeStart - temp_output_7_0_g55697 ) ) );
				half Motion_Selective4260_g55655 = 1.0;
				half3 Motion_30_Details263_g55655 = ( temp_output_299_0_g55708 * ( Global_NoiseTex_R34_g55655 * Mesh_Motion_30144_g55655 * Wind_Power_303115_g55655 * Wind_FadeOut4005_g55655 * Motion_Selective4260_g55655 ) );
				float3 Vertex_Motion_Object833_g55655 = ( ( VertexPosRotationAxis50_g55690 + ( VertexPosOtherAxis82_g55690 * cos( Angle44_g55690 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g55690 ) * sin( Angle44_g55690 ) ) ) + Motion_30_Details263_g55655 );
				float3 temp_output_3474_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				float3 appendResult2043_g55655 = (float3(Motion_10_XAxis216_g55655 , 0.0 , Motion_10_ZAxis190_g55655));
				float3 Vertex_Motion_World1118_g55655 = ( ( temp_output_3474_0_g55655 + appendResult2043_g55655 ) + Motion_30_Details263_g55655 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch3312_g55655 = Vertex_Motion_World1118_g55655;
				#else
				float3 staticSwitch3312_g55655 = ( Vertex_Motion_Object833_g55655 + ( 0.0 * _VertexDataMode ) );
				#endif
				half Global_Vertex_Size174_g55655 = break322_g55659.w;
				float lerpResult346_g55655 = lerp( 1.0 , Global_Vertex_Size174_g55655 , _GlobalSize);
				float3 appendResult3480_g55655 = (float3(lerpResult346_g55655 , lerpResult346_g55655 , lerpResult346_g55655));
				half3 ObjectData20_g55719 = appendResult3480_g55655;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g55719 = _Vector11;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55719 = WorldData19_g55719;
				#else
				float3 staticSwitch14_g55719 = ObjectData20_g55719;
				#endif
				half3 Vertex_Size1741_g55655 = staticSwitch14_g55719;
				half3 _Vector5 = half3(1,1,1);
				float temp_output_7_0_g55715 = _SizeFadeEndValue;
				float temp_output_335_0_g55655 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g55655 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g55715 ) / ( _SizeFadeStartValue - temp_output_7_0_g55715 ) ) );
				float3 appendResult3482_g55655 = (float3(temp_output_335_0_g55655 , temp_output_335_0_g55655 , temp_output_335_0_g55655));
				float3 lerpResult3556_g55655 = lerp( _Vector5 , appendResult3482_g55655 , _SizeFadeMode);
				half3 ObjectData20_g55722 = lerpResult3556_g55655;
				half3 WorldData19_g55722 = _Vector5;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55722 = WorldData19_g55722;
				#else
				float3 staticSwitch14_g55722 = ObjectData20_g55722;
				#endif
				float3 Vertex_SizeFade1740_g55655 = staticSwitch14_g55722;
				float3 normalizeResult2696_g55655 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g55655 = cross( normalizeResult2696_g55655 , half3(0,1,0) );
				float3 appendResult2710_g55655 = (float3(-break2709_g55655.z , 0.0 , break2709_g55655.x));
				float3 appendResult2667_g55655 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g55655 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult2212_g55655 = dot( ViewDir_Normalized3963_g55655 , float3(0,1,0) );
				half Mask_HView2656_g55655 = dotResult2212_g55655;
				float saferPower2652_g55655 = max( Mask_HView2656_g55655 , 0.0001 );
				half3 Grass_Coverage2661_g55655 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g55655 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g55655*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g55655 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g55655 = ( ( staticSwitch3312_g55655 * Vertex_Size1741_g55655 * Vertex_SizeFade1740_g55655 ) + Mesh_PivotsOS2291_g55655 + Grass_Coverage2661_g55655 );
				
				float temp_output_7_0_g55684 = _GradientMinValue;
				float4 lerpResult2779_g55655 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( v.ase_color.a - temp_output_7_0_g55684 ) / ( _GradientMaxValue - temp_output_7_0_g55684 ) ) ));
				half3 Gradient_Tint2784_g55655 = (lerpResult2779_g55655).rgb;
				float3 vertexToFrag11_g55667 = Gradient_Tint2784_g55655;
				o.ase_texcoord2.xyz = vertexToFrag11_g55667;
				float3 temp_cast_15 = (_NoiseScaleValue).xxx;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float temp_output_7_0_g55693 = _NoiseMinValue;
				half Noise_Mask3162_g55655 = saturate( ( ( SAMPLE_TEXTURE3D_LOD( TVE_WorldTex3D, samplerTVE_WorldTex3D, ( temp_cast_15 * WorldPosition3905_g55655 * 0.1 ), 0.0 ).r - temp_output_7_0_g55693 ) / ( _NoiseMaxValue - temp_output_7_0_g55693 ) ) );
				float4 lerpResult2800_g55655 = lerp( _NoiseColorTwo , _NoiseColorOne , Noise_Mask3162_g55655);
				half3 Noise_Tint2802_g55655 = (lerpResult2800_g55655).rgb;
				float3 vertexToFrag11_g55669 = Noise_Tint2802_g55655;
				o.ase_texcoord3.xyz = vertexToFrag11_g55669;
				float lerpResult169_g55658 = lerp( 4.0 , 2.0 , temp_output_167_0_g55658);
				half Global_NoiseTex_H2869_g55655 = pow( abs( tex2DNode75_g55658.a ) , lerpResult169_g55658 );
				half3 Highlight_Tint3231_g55655 = ( ( (_MotionHighlightColor).rgb * Global_NoiseTex_H2869_g55655 * Wind_Power_103106_g55655 * Wind_FadeOut4005_g55655 * v.ase_color.a ) + float3( 1,1,1 ) );
				float3 vertexToFrag11_g55698 = Highlight_Tint3231_g55655;
				o.ase_texcoord4.xyz = vertexToFrag11_g55698;
				float2 vertexToFrag11_g55666 = ( ( v.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord5.xy = vertexToFrag11_g55666;
				float3 Position58_g55656 = WorldPosition3905_g55655;
				float temp_output_82_0_g55656 = _LayerColorsValue;
				float4 lerpResult88_g55656 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_ColorsCoord).zw + ( (TVE_ColorsCoord).xy * (Position58_g55656).xz ) ),temp_output_82_0_g55656, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g55656]);
				half Global_ColorsTex_A1701_g55655 = (lerpResult88_g55656).a;
				float vertexToFrag11_g55671 = Global_ColorsTex_A1701_g55655;
				o.ase_texcoord2.w = vertexToFrag11_g55671;
				o.ase_texcoord6.xyz = vertexToFrag3890_g55655;
				float3 temp_cast_18 = (1.0).xxx;
				float Mesh_Occlusion318_g55655 = v.ase_color.g;
				float temp_output_7_0_g55706 = _VertexOcclusionMinValue;
				float3 lerpResult2945_g55655 = lerp( (_VertexOcclusionColor).rgb , temp_cast_18 , saturate( ( ( Mesh_Occlusion318_g55655 - temp_output_7_0_g55706 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g55706 ) ) ));
				float3 vertexToFrag11_g55665 = lerpResult2945_g55655;
				o.ase_texcoord7.xyz = vertexToFrag11_g55665;
				
				float2 vertexToFrag11_g55707 = ( ( v.ase_texcoord.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				o.ase_texcoord5.zw = vertexToFrag11_g55707;
				
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g55655;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 vertexToFrag11_g55667 = IN.ase_texcoord2.xyz;
				float3 vertexToFrag11_g55669 = IN.ase_texcoord3.xyz;
				float3 vertexToFrag11_g55698 = IN.ase_texcoord4.xyz;
				float2 vertexToFrag11_g55666 = IN.ase_texcoord5.xy;
				half2 Main_UVs15_g55655 = vertexToFrag11_g55666;
				float4 tex2DNode29_g55655 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g55655 );
				float3 temp_output_51_0_g55655 = ( (_MainColor).rgb * (tex2DNode29_g55655).rgb );
				half3 Main_Albedo99_g55655 = temp_output_51_0_g55655;
				half3 Blend_Albedo265_g55655 = Main_Albedo99_g55655;
				half3 Blend_AlbedoTinted2808_g55655 = ( vertexToFrag11_g55667 * vertexToFrag11_g55669 * vertexToFrag11_g55698 * Blend_Albedo265_g55655 );
				float dotResult3616_g55655 = dot( Blend_AlbedoTinted2808_g55655 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_0 = (dotResult3616_g55655).xxx;
				float vertexToFrag11_g55671 = IN.ase_texcoord2.w;
				half Global_Colors_Influence3668_g55655 = vertexToFrag11_g55671;
				float3 lerpResult3618_g55655 = lerp( Blend_AlbedoTinted2808_g55655 , temp_cast_0 , Global_Colors_Influence3668_g55655);
				float3 vertexToFrag3890_g55655 = IN.ase_texcoord6.xyz;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float3 Position58_g55656 = WorldPosition3905_g55655;
				float temp_output_82_0_g55656 = _LayerColorsValue;
				float4 lerpResult88_g55656 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_ColorsCoord).zw + ( (TVE_ColorsCoord).xy * (Position58_g55656).xz ) ),temp_output_82_0_g55656 ) , TVE_ColorsUsage[(int)temp_output_82_0_g55656]);
				half3 Global_ColorsTex_RGB1700_g55655 = (lerpResult88_g55656).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g55701 = 2.0;
				#else
				float staticSwitch1_g55701 = 4.594794;
				#endif
				half3 Global_Colors1954_g55655 = ( Global_ColorsTex_RGB1700_g55655 * staticSwitch1_g55701 );
				float lerpResult3870_g55655 = lerp( 1.0 , IN.ase_color.r , _ColorsVariationValue);
				half Global_Colors_Value3650_g55655 = ( _GlobalColors * lerpResult3870_g55655 );
				float temp_output_7_0_g55702 = _ColorsMaskMinValue;
				half Global_Colors_Mask3692_g55655 = saturate( ( ( ( 1.0 - IN.ase_color.a ) - temp_output_7_0_g55702 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g55702 ) ) );
				float3 lerpResult3628_g55655 = lerp( Blend_AlbedoTinted2808_g55655 , ( lerpResult3618_g55655 * Global_Colors1954_g55655 ) , ( Global_Colors_Value3650_g55655 * Global_Colors_Mask3692_g55655 ));
				half3 Blend_AlbedoColored863_g55655 = lerpResult3628_g55655;
				float3 temp_output_799_0_g55655 = (_SubsurfaceColor).rgb;
				float dotResult3930_g55655 = dot( temp_output_799_0_g55655 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult3930_g55655).xxx;
				float3 lerpResult3932_g55655 = lerp( temp_output_799_0_g55655 , temp_cast_3 , Global_Colors_Influence3668_g55655);
				float3 lerpResult3942_g55655 = lerp( temp_output_799_0_g55655 , ( lerpResult3932_g55655 * Global_Colors1954_g55655 ) , ( Global_Colors_Value3650_g55655 * Global_Colors_Mask3692_g55655 ));
				half3 Subsurface_Color1722_g55655 = lerpResult3942_g55655;
				half MainLight_Subsurface4041_g55655 = TVE_MainLightParams.a;
				half Subsurface_Intensity1752_g55655 = ( _SubsurfaceValue * MainLight_Subsurface4041_g55655 );
				float temp_output_7_0_g55689 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask1557_g55655 = saturate( ( ( IN.ase_color.a - temp_output_7_0_g55689 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g55689 ) ) );
				half3 Subsurface_Transmission884_g55655 = ( Subsurface_Color1722_g55655 * Subsurface_Intensity1752_g55655 * Subsurface_Mask1557_g55655 );
				half3 MainLight_Direction3926_g55655 = TVE_MainLightDirection;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g55655 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult785_g55655 = dot( -MainLight_Direction3926_g55655 , ViewDir_Normalized3963_g55655 );
				float saferPower1624_g55655 = max( (dotResult785_g55655*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g55655 = 0.0;
				#else
				float staticSwitch1602_g55655 = ( pow( saferPower1624_g55655 , _MainLightAngleValue ) * _MainLightScatteringValue );
				#endif
				half Mask_Subsurface_View782_g55655 = staticSwitch1602_g55655;
				half3 Subsurface_Scattering1693_g55655 = ( Subsurface_Transmission884_g55655 * Blend_AlbedoColored863_g55655 * Mask_Subsurface_View782_g55655 );
				half3 Blend_AlbedoAndSubsurface149_g55655 = ( Blend_AlbedoColored863_g55655 + Subsurface_Scattering1693_g55655 );
				half3 Global_OverlayColor1758_g55655 = (TVE_OverlayColor).rgb;
				half Main_AlbedoTex_G3526_g55655 = tex2DNode29_g55655.g;
				float3 Position82_g55713 = WorldPosition3905_g55655;
				float temp_output_84_0_g55713 = _LayerExtrasValue;
				float4 lerpResult88_g55713 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_ExtrasCoord).zw + ( (TVE_ExtrasCoord).xy * (Position82_g55713).xz ) ),temp_output_84_0_g55713 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g55713]);
				float4 break89_g55713 = lerpResult88_g55713;
				half Global_Extras_Overlay156_g55655 = break89_g55713.b;
				float temp_output_1025_0_g55655 = ( _GlobalOverlay * Global_Extras_Overlay156_g55655 );
				float lerpResult1065_g55655 = lerp( 1.0 , IN.ase_color.r , _OverlayVariationValue);
				half Overlay_Commons1365_g55655 = ( temp_output_1025_0_g55655 * lerpResult1065_g55655 );
				float temp_output_7_0_g55673 = _OverlayMaskMinValue;
				half Overlay_Mask269_g55655 = saturate( ( ( ( ( ( IN.ase_color.a * 0.5 ) + Main_AlbedoTex_G3526_g55655 ) * Overlay_Commons1365_g55655 ) - temp_output_7_0_g55673 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g55673 ) ) );
				float3 lerpResult336_g55655 = lerp( Blend_AlbedoAndSubsurface149_g55655 , Global_OverlayColor1758_g55655 , Overlay_Mask269_g55655);
				half3 Final_Albedo359_g55655 = lerpResult336_g55655;
				float3 vertexToFrag11_g55665 = IN.ase_texcoord7.xyz;
				float3 Vertex_Occlusion648_g55655 = saturate( vertexToFrag11_g55665 );
				
				float4 temp_output_4214_0_g55655 = ( _EmissiveColor * _EmissiveIntensityParams.x );
				float2 vertexToFrag11_g55707 = IN.ase_texcoord5.zw;
				half2 Emissive_UVs2468_g55655 = vertexToFrag11_g55707;
				half Global_Extras_Emissive4203_g55655 = break89_g55713.r;
				float lerpResult4206_g55655 = lerp( 1.0 , Global_Extras_Emissive4203_g55655 , _GlobalEmissive);
				half3 Final_Emissive2476_g55655 = ( (( temp_output_4214_0_g55655 * SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs2468_g55655 ) )).rgb * lerpResult4206_g55655 );
				
				float localCustomAlphaClip3735_g55655 = ( 0.0 );
				half Final_AlphaFade3727_g55655 = 1.0;
				float Main_Alpha316_g55655 = ( _MainColor.a * tex2DNode29_g55655.a );
				float Mesh_Variation16_g55655 = IN.ase_color.r;
				float lerpResult4033_g55655 = lerp( 0.9 , (Mesh_Variation16_g55655*0.5 + 0.5) , _AlphaVariationValue);
				half Global_Extras_Alpha1033_g55655 = break89_g55713.a;
				float temp_output_4022_0_g55655 = ( lerpResult4033_g55655 - ( 1.0 - Global_Extras_Alpha1033_g55655 ) );
				half AlphaTreshold2132_g55655 = _Cutoff;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch4017_g55655 = ( temp_output_4022_0_g55655 + AlphaTreshold2132_g55655 );
				#else
				float staticSwitch4017_g55655 = temp_output_4022_0_g55655;
				#endif
				float lerpResult4011_g55655 = lerp( 1.0 , staticSwitch4017_g55655 , _GlobalAlpha);
				half Global_Alpha315_g55655 = saturate( lerpResult4011_g55655 );
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch3792_g55655 = ( ( Main_Alpha316_g55655 * Global_Alpha315_g55655 ) - ( AlphaTreshold2132_g55655 - 0.5 ) );
				#else
				float staticSwitch3792_g55655 = ( Main_Alpha316_g55655 * Global_Alpha315_g55655 );
				#endif
				half Final_Alpha3754_g55655 = staticSwitch3792_g55655;
				float temp_output_661_0_g55655 = ( Final_AlphaFade3727_g55655 * Final_Alpha3754_g55655 );
				float Alpha3735_g55655 = temp_output_661_0_g55655;
				float Treshold3735_g55655 = 0.5;
				{
				#if TVE_ALPHA_CLIP
				clip(Alpha3735_g55655 - Treshold3735_g55655);
				#endif
				}
				half Final_Clip914_g55655 = saturate( Alpha3735_g55655 );
				
				
				float3 Albedo = ( Final_Albedo359_g55655 * Vertex_Occlusion648_g55655 );
				float3 Emission = Final_Emissive2476_g55655;
				float Alpha = Final_Clip914_g55655;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite [_render_zw]
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA

			HLSLPROGRAM
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70403
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_VERTEX_DATA_BATCHED
			//TVE Shader Type Defines
			#define TVE_IS_GRASS_SHADER
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
           //Nature Renderer (Procedural Instancing)
           #include "Assets/Visual Design Cafe/Nature Shaders/Common/Nodes/Integrations/Nature Renderer.cginc"
           #pragma instancing_options procedural:SetupNatureRenderer
			//SHADER INJECTION POINT END


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			half4 _GradientColorTwo;
			half4 _OverlayMaskRemap;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _MotionHighlightColor;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			float4 _NoiseMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _NoiseColorTwo;
			half4 _EmissiveColor;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveUVs;
			half4 _NoiseColorOne;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _MainColor;
			half3 _render_normals_options;
			half _NoiseScaleValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _render_zw;
			half _PerspectiveNoiseValue;
			half _PerspectivePushValue;
			half _SizeFadeMode;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _GlobalSize;
			half _VertexDataMode;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionMaskValue;
			half _PerspectiveAngleValue;
			half _NoiseMinValue;
			half _ColorsMaskMinValue;
			half _LayerColorsValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _RenderSpecular;
			half _GlobalEmissive;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _NoiseMaxValue;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _MainLightScatteringValue;
			half _MainLightAngleValue;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _LayerReactValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerExtrasValue;
			half _InteractionAmplitude;
			half _MotionAmplitude_10;
			half _MotionVariation_10;
			half _RenderCull;
			half _LayersSpace;
			half _FadeSpace;
			half _TranslucencyHDMessage;
			half _SubsurfaceCat;
			half _VertexMasksMode;
			half _NoiseCat;
			half _SizeFadeCat;
			half _VariationMotionMessage;
			half _RenderNormals;
			half _TranslucencyIntensityValue;
			half _IsTVEShader;
			half _DetailMode;
			half _DetailCat;
			half _EmissiveFlagMode;
			half _MotionSpace;
			half _EmissiveCat;
			half _Cutoff;
			half _GradientCat;
			half _OcclusionCat;
			half _render_dst;
			half _IsStandardShader;
			half _IsGrassShader;
			half _render_src;
			half _render_cull;
			half _TranslucencyAmbientValue;
			float _MotionScale_10;
			half _VariationGlobalsMessage;
			half _RenderClip;
			float _MotionSpeed_10;
			half _LayerMotionValue;
			half _vertex_pivot_mode;
			half _AlphaVariationValue;
			half _VertexPivotMode;
			half _TranslucencyScatteringValue;
			half _TranslucencyDirectValue;
			half _IsVersion;
			half _DetailTypeMode;
			half _RenderSSR;
			half _DetailBlendMode;
			half _ReceiveSpace;
			half _SizeFadeMessage;
			half _RenderingCat;
			half _PerspectiveCat;
			half _TranslucencyShadowValue;
			half _RenderZWrite;
			half _RenderPriority;
			half _GlobalCat;
			half _MotionCat;
			half _MainCat;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _VertexVariationMode;
			half _RenderMode;
			half _TranslucencyNormalValue;
			half _GlobalAlpha;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			float4 TVE_MotionTweaks;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoord;
			SAMPLER(samplerTVE_MotionTex);
			float TVE_MotionUsage[9];
			TEXTURE2D(TVE_NoiseTex);
			half4 TVE_NoiseParams;
			SAMPLER(samplerTVE_NoiseTex);
			half4 TVE_ReactParams;
			TEXTURE2D_ARRAY(TVE_ReactTex);
			half4 TVE_ReactCoord;
			SAMPLER(samplerTVE_ReactTex);
			float TVE_ReactUsage[9];
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_DistanceFadeBias;
			TEXTURE3D(TVE_WorldTex3D);
			SAMPLER(samplerTVE_WorldTex3D);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoord;
			SAMPLER(samplerTVE_ColorsTex);
			float TVE_ColorsUsage[9];
			half4 TVE_MainLightParams;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			float TVE_ExtrasUsage[9];


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g55655 = v.vertex.xyz;
				float3 appendResult60_g55709 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g55655 = ( appendResult60_g55709 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g55655 = Mesh_PivotsData2831_g55655;
				float3 temp_output_2283_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				half3 VertexPos40_g55681 = temp_output_2283_0_g55655;
				float3 appendResult74_g55681 = (float3(VertexPos40_g55681.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g55681 = appendResult74_g55681;
				float3 break84_g55681 = VertexPos40_g55681;
				float3 appendResult81_g55681 = (float3(0.0 , break84_g55681.y , break84_g55681.z));
				half3 VertexPosOtherAxis82_g55681 = appendResult81_g55681;
				half ObjectData20_g55710 = 3.14;
				float Bounds_Height374_g55655 = _MaxBoundsInfo.y;
				half WorldData19_g55710 = ( Bounds_Height374_g55655 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55710 = WorldData19_g55710;
				#else
				float staticSwitch14_g55710 = ObjectData20_g55710;
				#endif
				float Motion_Max_Bending1133_g55655 = staticSwitch14_g55710;
				float4x4 break19_g55661 = GetObjectToWorldMatrix();
				float3 appendResult20_g55661 = (float3(break19_g55661[ 0 ][ 3 ] , break19_g55661[ 1 ][ 3 ] , break19_g55661[ 2 ][ 3 ]));
				float3 appendResult60_g55663 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float3 temp_output_91_0_g55661 = ( appendResult60_g55663 * _vertex_pivot_mode );
				float3 PivotsOnly105_g55661 = (mul( GetObjectToWorldMatrix(), float4( temp_output_91_0_g55661 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g55662 = ( appendResult20_g55661 + PivotsOnly105_g55661 );
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g55662 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55662 = WorldData19_g55662;
				#else
				float3 staticSwitch14_g55662 = ObjectData20_g55662;
				#endif
				float3 temp_output_114_0_g55661 = staticSwitch14_g55662;
				float3 vertexToFrag4224_g55655 = temp_output_114_0_g55661;
				half3 ObjectData20_g55705 = vertexToFrag4224_g55655;
				float3 vertexToFrag3890_g55655 = ase_worldPos;
				half3 WorldData19_g55705 = vertexToFrag3890_g55655;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55705 = WorldData19_g55705;
				#else
				float3 staticSwitch14_g55705 = ObjectData20_g55705;
				#endif
				float3 ObjectPosition4223_g55655 = staticSwitch14_g55705;
				float3 Position83_g55714 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55714 = _LayerMotionValue;
				float4 lerpResult87_g55714 = lerp( TVE_MotionParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_MotionCoord).zw + ( (TVE_MotionCoord).xy * (Position83_g55714).xz ) ),temp_output_84_0_g55714, 0.0 ) , TVE_MotionUsage[(int)temp_output_84_0_g55714]);
				half4 Global_Motion_Params3909_g55655 = lerpResult87_g55714;
				float4 break322_g55720 = Global_Motion_Params3909_g55655;
				half Wind_Power369_g55720 = break322_g55720.z;
				float lerpResult376_g55720 = lerp( TVE_MotionTweaks.x , 1.0 , Wind_Power369_g55720);
				half Wind_Power_103106_g55655 = lerpResult376_g55720;
				float2 panner73_g55658 = ( _TimeParameters.x * (TVE_NoiseParams).xy + ( (ObjectPosition4223_g55655).xz * TVE_NoiseParams.z ));
				float4 tex2DNode75_g55658 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g55658, 0.0 );
				float4 saferPower77_g55658 = max( abs( tex2DNode75_g55658 ) , 0.0001 );
				half Wind_Power2223_g55655 = Wind_Power369_g55720;
				float temp_output_167_0_g55658 = Wind_Power2223_g55655;
				float lerpResult168_g55658 = lerp( 1.4 , 0.2 , temp_output_167_0_g55658);
				float4 temp_cast_5 = (lerpResult168_g55658).xxxx;
				float4 break174_g55658 = pow( saferPower77_g55658 , temp_cast_5 );
				half Global_NoiseTex_R34_g55655 = break174_g55658.r;
				float3 appendResult397_g55720 = (float3(break322_g55720.x , 0.0 , break322_g55720.y));
				float3 temp_output_398_0_g55720 = (appendResult397_g55720*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g55720 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55720 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g55655 = (temp_output_339_0_g55720).xz;
				half Input_Speed62_g55680 = _MotionSpeed_10;
				float mulTime373_g55680 = _TimeParameters.x * Input_Speed62_g55680;
				float3 break111_g55703 = ObjectPosition4223_g55655;
				half Variation_Complex102_g55703 = frac( ( v.ase_color.r + ( break111_g55703.x + break111_g55703.z ) ) );
				half ObjectData20_g55704 = Variation_Complex102_g55703;
				half Variation_Simple105_g55703 = v.ase_color.r;
				half WorldData19_g55704 = Variation_Simple105_g55703;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g55704 = WorldData19_g55704;
				#else
				float staticSwitch14_g55704 = ObjectData20_g55704;
				#endif
				half Motion_Variation3073_g55655 = staticSwitch14_g55704;
				half Motion_Variation284_g55680 = ( _MotionVariation_10 * Motion_Variation3073_g55655 );
				float Motion_Scale287_g55680 = ( _MotionScale_10 * ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) );
				half Sine_MinusOneToOne281_g55680 = sin( ( mulTime373_g55680 + Motion_Variation284_g55680 + Motion_Scale287_g55680 ) );
				half Wind_Squash4479_g55655 = TVE_MotionTweaks.w;
				half Input_WindSquash419_g55680 = Wind_Squash4479_g55655;
				half Input_WindPower327_g55680 = Wind_Power_103106_g55655;
				float lerpResult321_g55680 = lerp( Sine_MinusOneToOne281_g55680 , (Sine_MinusOneToOne281_g55680*Input_WindSquash419_g55680 + 1.0) , Input_WindPower327_g55680);
				half Mesh_Motion_1082_g55655 = v.ase_texcoord3.x;
				half2 Motion_10_Bending2258_g55655 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g55655 ) * Wind_Power_103106_g55655 * Global_NoiseTex_R34_g55655 * Wind_DirectionOS39_g55655 * lerpResult321_g55680 * Mesh_Motion_1082_g55655 );
				half Interaction_Amplitude4137_g55655 = _InteractionAmplitude;
				float3 Position83_g55679 = ObjectPosition4223_g55655;
				float temp_output_84_0_g55679 = _LayerReactValue;
				float4 lerpResult87_g55679 = lerp( TVE_ReactParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ReactTex, samplerTVE_ReactTex, ( (TVE_ReactCoord).zw + ( (TVE_ReactCoord).xy * (Position83_g55679).xz ) ),temp_output_84_0_g55679, 0.0 ) , TVE_ReactUsage[(int)temp_output_84_0_g55679]);
				half4 Global_React_Params4173_g55655 = lerpResult87_g55679;
				float4 break322_g55659 = Global_React_Params4173_g55655;
				half Interaction_Mask66_g55655 = break322_g55659.z;
				float3 appendResult397_g55659 = (float3(break322_g55659.x , 0.0 , break322_g55659.y));
				float3 temp_output_398_0_g55659 = (appendResult397_g55659*2.0 + -1.0);
				float3 temp_output_339_0_g55659 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g55659 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Interaction_DirectionOS4158_g55655 = (temp_output_339_0_g55659).xz;
				float lerpResult4494_g55655 = lerp( 1.0 , Mesh_Motion_1082_g55655 , _InteractionMaskValue);
				half2 Motion_10_Interaction53_g55655 = ( Interaction_Amplitude4137_g55655 * Motion_Max_Bending1133_g55655 * Interaction_Mask66_g55655 * Interaction_Mask66_g55655 * Interaction_DirectionOS4158_g55655 * lerpResult4494_g55655 );
				float2 lerpResult109_g55655 = lerp( Motion_10_Bending2258_g55655 , Motion_10_Interaction53_g55655 , ( Interaction_Mask66_g55655 * saturate( Interaction_Amplitude4137_g55655 ) ));
				float2 break143_g55655 = lerpResult109_g55655;
				half Motion_10_ZAxis190_g55655 = break143_g55655.y;
				half Angle44_g55681 = Motion_10_ZAxis190_g55655;
				half3 VertexPos40_g55690 = ( VertexPosRotationAxis50_g55681 + ( VertexPosOtherAxis82_g55681 * cos( Angle44_g55681 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g55681 ) * sin( Angle44_g55681 ) ) );
				float3 appendResult74_g55690 = (float3(0.0 , 0.0 , VertexPos40_g55690.z));
				half3 VertexPosRotationAxis50_g55690 = appendResult74_g55690;
				float3 break84_g55690 = VertexPos40_g55690;
				float3 appendResult81_g55690 = (float3(break84_g55690.x , break84_g55690.y , 0.0));
				half3 VertexPosOtherAxis82_g55690 = appendResult81_g55690;
				half Motion_10_XAxis216_g55655 = break143_g55655.x;
				half Angle44_g55690 = -Motion_10_XAxis216_g55655;
				half Motion_Scale321_g55708 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g55708 = _MotionSpeed_32;
				float mulTime349_g55708 = _TimeParameters.x * Input_Speed62_g55708;
				float Motion_Variation330_g55708 = ( _MotionVariation_32 * Motion_Variation3073_g55655 );
				float Bounds_Radius121_g55655 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g55708 = ( _MotionAmplitude_32 * Bounds_Radius121_g55655 * 0.1 );
				float3 temp_output_299_0_g55708 = ( sin( ( ( ase_worldPos * Motion_Scale321_g55708 ) + mulTime349_g55708 + Motion_Variation330_g55708 ) ) * Input_Amplitude58_g55708 );
				half Mesh_Motion_30144_g55655 = v.ase_texcoord3.z;
				float lerpResult378_g55720 = lerp( TVE_MotionTweaks.z , 1.0 , Wind_Power369_g55720);
				half Wind_Power_303115_g55655 = lerpResult378_g55720;
				float temp_output_7_0_g55697 = TVE_MotionFadeEnd;
				half Wind_FadeOut4005_g55655 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g55697 ) / ( TVE_MotionFadeStart - temp_output_7_0_g55697 ) ) );
				half Motion_Selective4260_g55655 = 1.0;
				half3 Motion_30_Details263_g55655 = ( temp_output_299_0_g55708 * ( Global_NoiseTex_R34_g55655 * Mesh_Motion_30144_g55655 * Wind_Power_303115_g55655 * Wind_FadeOut4005_g55655 * Motion_Selective4260_g55655 ) );
				float3 Vertex_Motion_Object833_g55655 = ( ( VertexPosRotationAxis50_g55690 + ( VertexPosOtherAxis82_g55690 * cos( Angle44_g55690 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g55690 ) * sin( Angle44_g55690 ) ) ) + Motion_30_Details263_g55655 );
				float3 temp_output_3474_0_g55655 = ( VertexPosition3588_g55655 - Mesh_PivotsOS2291_g55655 );
				float3 appendResult2043_g55655 = (float3(Motion_10_XAxis216_g55655 , 0.0 , Motion_10_ZAxis190_g55655));
				float3 Vertex_Motion_World1118_g55655 = ( ( temp_output_3474_0_g55655 + appendResult2043_g55655 ) + Motion_30_Details263_g55655 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch3312_g55655 = Vertex_Motion_World1118_g55655;
				#else
				float3 staticSwitch3312_g55655 = ( Vertex_Motion_Object833_g55655 + ( 0.0 * _VertexDataMode ) );
				#endif
				half Global_Vertex_Size174_g55655 = break322_g55659.w;
				float lerpResult346_g55655 = lerp( 1.0 , Global_Vertex_Size174_g55655 , _GlobalSize);
				float3 appendResult3480_g55655 = (float3(lerpResult346_g55655 , lerpResult346_g55655 , lerpResult346_g55655));
				half3 ObjectData20_g55719 = appendResult3480_g55655;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g55719 = _Vector11;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55719 = WorldData19_g55719;
				#else
				float3 staticSwitch14_g55719 = ObjectData20_g55719;
				#endif
				half3 Vertex_Size1741_g55655 = staticSwitch14_g55719;
				half3 _Vector5 = half3(1,1,1);
				float temp_output_7_0_g55715 = _SizeFadeEndValue;
				float temp_output_335_0_g55655 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g55655 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g55715 ) / ( _SizeFadeStartValue - temp_output_7_0_g55715 ) ) );
				float3 appendResult3482_g55655 = (float3(temp_output_335_0_g55655 , temp_output_335_0_g55655 , temp_output_335_0_g55655));
				float3 lerpResult3556_g55655 = lerp( _Vector5 , appendResult3482_g55655 , _SizeFadeMode);
				half3 ObjectData20_g55722 = lerpResult3556_g55655;
				half3 WorldData19_g55722 = _Vector5;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g55722 = WorldData19_g55722;
				#else
				float3 staticSwitch14_g55722 = ObjectData20_g55722;
				#endif
				float3 Vertex_SizeFade1740_g55655 = staticSwitch14_g55722;
				float3 normalizeResult2696_g55655 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g55655 = cross( normalizeResult2696_g55655 , half3(0,1,0) );
				float3 appendResult2710_g55655 = (float3(-break2709_g55655.z , 0.0 , break2709_g55655.x));
				float3 appendResult2667_g55655 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g55655 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult2212_g55655 = dot( ViewDir_Normalized3963_g55655 , float3(0,1,0) );
				half Mask_HView2656_g55655 = dotResult2212_g55655;
				float saferPower2652_g55655 = max( Mask_HView2656_g55655 , 0.0001 );
				half3 Grass_Coverage2661_g55655 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g55655 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g55655*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g55655 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g55655 = ( ( staticSwitch3312_g55655 * Vertex_Size1741_g55655 * Vertex_SizeFade1740_g55655 ) + Mesh_PivotsOS2291_g55655 + Grass_Coverage2661_g55655 );
				
				float temp_output_7_0_g55684 = _GradientMinValue;
				float4 lerpResult2779_g55655 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( v.ase_color.a - temp_output_7_0_g55684 ) / ( _GradientMaxValue - temp_output_7_0_g55684 ) ) ));
				half3 Gradient_Tint2784_g55655 = (lerpResult2779_g55655).rgb;
				float3 vertexToFrag11_g55667 = Gradient_Tint2784_g55655;
				o.ase_texcoord2.xyz = vertexToFrag11_g55667;
				float3 temp_cast_15 = (_NoiseScaleValue).xxx;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float temp_output_7_0_g55693 = _NoiseMinValue;
				half Noise_Mask3162_g55655 = saturate( ( ( SAMPLE_TEXTURE3D_LOD( TVE_WorldTex3D, samplerTVE_WorldTex3D, ( temp_cast_15 * WorldPosition3905_g55655 * 0.1 ), 0.0 ).r - temp_output_7_0_g55693 ) / ( _NoiseMaxValue - temp_output_7_0_g55693 ) ) );
				float4 lerpResult2800_g55655 = lerp( _NoiseColorTwo , _NoiseColorOne , Noise_Mask3162_g55655);
				half3 Noise_Tint2802_g55655 = (lerpResult2800_g55655).rgb;
				float3 vertexToFrag11_g55669 = Noise_Tint2802_g55655;
				o.ase_texcoord3.xyz = vertexToFrag11_g55669;
				float lerpResult169_g55658 = lerp( 4.0 , 2.0 , temp_output_167_0_g55658);
				half Global_NoiseTex_H2869_g55655 = pow( abs( tex2DNode75_g55658.a ) , lerpResult169_g55658 );
				half3 Highlight_Tint3231_g55655 = ( ( (_MotionHighlightColor).rgb * Global_NoiseTex_H2869_g55655 * Wind_Power_103106_g55655 * Wind_FadeOut4005_g55655 * v.ase_color.a ) + float3( 1,1,1 ) );
				float3 vertexToFrag11_g55698 = Highlight_Tint3231_g55655;
				o.ase_texcoord4.xyz = vertexToFrag11_g55698;
				float2 vertexToFrag11_g55666 = ( ( v.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord5.xy = vertexToFrag11_g55666;
				float3 Position58_g55656 = WorldPosition3905_g55655;
				float temp_output_82_0_g55656 = _LayerColorsValue;
				float4 lerpResult88_g55656 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_ColorsCoord).zw + ( (TVE_ColorsCoord).xy * (Position58_g55656).xz ) ),temp_output_82_0_g55656, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g55656]);
				half Global_ColorsTex_A1701_g55655 = (lerpResult88_g55656).a;
				float vertexToFrag11_g55671 = Global_ColorsTex_A1701_g55655;
				o.ase_texcoord2.w = vertexToFrag11_g55671;
				o.ase_texcoord6.xyz = vertexToFrag3890_g55655;
				float3 temp_cast_18 = (1.0).xxx;
				float Mesh_Occlusion318_g55655 = v.ase_color.g;
				float temp_output_7_0_g55706 = _VertexOcclusionMinValue;
				float3 lerpResult2945_g55655 = lerp( (_VertexOcclusionColor).rgb , temp_cast_18 , saturate( ( ( Mesh_Occlusion318_g55655 - temp_output_7_0_g55706 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g55706 ) ) ));
				float3 vertexToFrag11_g55665 = lerpResult2945_g55655;
				o.ase_texcoord7.xyz = vertexToFrag11_g55665;
				
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.zw = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g55655;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 vertexToFrag11_g55667 = IN.ase_texcoord2.xyz;
				float3 vertexToFrag11_g55669 = IN.ase_texcoord3.xyz;
				float3 vertexToFrag11_g55698 = IN.ase_texcoord4.xyz;
				float2 vertexToFrag11_g55666 = IN.ase_texcoord5.xy;
				half2 Main_UVs15_g55655 = vertexToFrag11_g55666;
				float4 tex2DNode29_g55655 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g55655 );
				float3 temp_output_51_0_g55655 = ( (_MainColor).rgb * (tex2DNode29_g55655).rgb );
				half3 Main_Albedo99_g55655 = temp_output_51_0_g55655;
				half3 Blend_Albedo265_g55655 = Main_Albedo99_g55655;
				half3 Blend_AlbedoTinted2808_g55655 = ( vertexToFrag11_g55667 * vertexToFrag11_g55669 * vertexToFrag11_g55698 * Blend_Albedo265_g55655 );
				float dotResult3616_g55655 = dot( Blend_AlbedoTinted2808_g55655 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_0 = (dotResult3616_g55655).xxx;
				float vertexToFrag11_g55671 = IN.ase_texcoord2.w;
				half Global_Colors_Influence3668_g55655 = vertexToFrag11_g55671;
				float3 lerpResult3618_g55655 = lerp( Blend_AlbedoTinted2808_g55655 , temp_cast_0 , Global_Colors_Influence3668_g55655);
				float3 vertexToFrag3890_g55655 = IN.ase_texcoord6.xyz;
				float3 WorldPosition3905_g55655 = vertexToFrag3890_g55655;
				float3 Position58_g55656 = WorldPosition3905_g55655;
				float temp_output_82_0_g55656 = _LayerColorsValue;
				float4 lerpResult88_g55656 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_ColorsCoord).zw + ( (TVE_ColorsCoord).xy * (Position58_g55656).xz ) ),temp_output_82_0_g55656 ) , TVE_ColorsUsage[(int)temp_output_82_0_g55656]);
				half3 Global_ColorsTex_RGB1700_g55655 = (lerpResult88_g55656).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g55701 = 2.0;
				#else
				float staticSwitch1_g55701 = 4.594794;
				#endif
				half3 Global_Colors1954_g55655 = ( Global_ColorsTex_RGB1700_g55655 * staticSwitch1_g55701 );
				float lerpResult3870_g55655 = lerp( 1.0 , IN.ase_color.r , _ColorsVariationValue);
				half Global_Colors_Value3650_g55655 = ( _GlobalColors * lerpResult3870_g55655 );
				float temp_output_7_0_g55702 = _ColorsMaskMinValue;
				half Global_Colors_Mask3692_g55655 = saturate( ( ( ( 1.0 - IN.ase_color.a ) - temp_output_7_0_g55702 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g55702 ) ) );
				float3 lerpResult3628_g55655 = lerp( Blend_AlbedoTinted2808_g55655 , ( lerpResult3618_g55655 * Global_Colors1954_g55655 ) , ( Global_Colors_Value3650_g55655 * Global_Colors_Mask3692_g55655 ));
				half3 Blend_AlbedoColored863_g55655 = lerpResult3628_g55655;
				float3 temp_output_799_0_g55655 = (_SubsurfaceColor).rgb;
				float dotResult3930_g55655 = dot( temp_output_799_0_g55655 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult3930_g55655).xxx;
				float3 lerpResult3932_g55655 = lerp( temp_output_799_0_g55655 , temp_cast_3 , Global_Colors_Influence3668_g55655);
				float3 lerpResult3942_g55655 = lerp( temp_output_799_0_g55655 , ( lerpResult3932_g55655 * Global_Colors1954_g55655 ) , ( Global_Colors_Value3650_g55655 * Global_Colors_Mask3692_g55655 ));
				half3 Subsurface_Color1722_g55655 = lerpResult3942_g55655;
				half MainLight_Subsurface4041_g55655 = TVE_MainLightParams.a;
				half Subsurface_Intensity1752_g55655 = ( _SubsurfaceValue * MainLight_Subsurface4041_g55655 );
				float temp_output_7_0_g55689 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask1557_g55655 = saturate( ( ( IN.ase_color.a - temp_output_7_0_g55689 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g55689 ) ) );
				half3 Subsurface_Transmission884_g55655 = ( Subsurface_Color1722_g55655 * Subsurface_Intensity1752_g55655 * Subsurface_Mask1557_g55655 );
				half3 MainLight_Direction3926_g55655 = TVE_MainLightDirection;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g55655 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g55655 = normalizeResult2169_g55655;
				float dotResult785_g55655 = dot( -MainLight_Direction3926_g55655 , ViewDir_Normalized3963_g55655 );
				float saferPower1624_g55655 = max( (dotResult785_g55655*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g55655 = 0.0;
				#else
				float staticSwitch1602_g55655 = ( pow( saferPower1624_g55655 , _MainLightAngleValue ) * _MainLightScatteringValue );
				#endif
				half Mask_Subsurface_View782_g55655 = staticSwitch1602_g55655;
				half3 Subsurface_Scattering1693_g55655 = ( Subsurface_Transmission884_g55655 * Blend_AlbedoColored863_g55655 * Mask_Subsurface_View782_g55655 );
				half3 Blend_AlbedoAndSubsurface149_g55655 = ( Blend_AlbedoColored863_g55655 + Subsurface_Scattering1693_g55655 );
				half3 Global_OverlayColor1758_g55655 = (TVE_OverlayColor).rgb;
				half Main_AlbedoTex_G3526_g55655 = tex2DNode29_g55655.g;
				float3 Position82_g55713 = WorldPosition3905_g55655;
				float temp_output_84_0_g55713 = _LayerExtrasValue;
				float4 lerpResult88_g55713 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_ExtrasCoord).zw + ( (TVE_ExtrasCoord).xy * (Position82_g55713).xz ) ),temp_output_84_0_g55713 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g55713]);
				float4 break89_g55713 = lerpResult88_g55713;
				half Global_Extras_Overlay156_g55655 = break89_g55713.b;
				float temp_output_1025_0_g55655 = ( _GlobalOverlay * Global_Extras_Overlay156_g55655 );
				float lerpResult1065_g55655 = lerp( 1.0 , IN.ase_color.r , _OverlayVariationValue);
				half Overlay_Commons1365_g55655 = ( temp_output_1025_0_g55655 * lerpResult1065_g55655 );
				float temp_output_7_0_g55673 = _OverlayMaskMinValue;
				half Overlay_Mask269_g55655 = saturate( ( ( ( ( ( IN.ase_color.a * 0.5 ) + Main_AlbedoTex_G3526_g55655 ) * Overlay_Commons1365_g55655 ) - temp_output_7_0_g55673 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g55673 ) ) );
				float3 lerpResult336_g55655 = lerp( Blend_AlbedoAndSubsurface149_g55655 , Global_OverlayColor1758_g55655 , Overlay_Mask269_g55655);
				half3 Final_Albedo359_g55655 = lerpResult336_g55655;
				float3 vertexToFrag11_g55665 = IN.ase_texcoord7.xyz;
				float3 Vertex_Occlusion648_g55655 = saturate( vertexToFrag11_g55665 );
				
				float localCustomAlphaClip3735_g55655 = ( 0.0 );
				half Final_AlphaFade3727_g55655 = 1.0;
				float Main_Alpha316_g55655 = ( _MainColor.a * tex2DNode29_g55655.a );
				float Mesh_Variation16_g55655 = IN.ase_color.r;
				float lerpResult4033_g55655 = lerp( 0.9 , (Mesh_Variation16_g55655*0.5 + 0.5) , _AlphaVariationValue);
				half Global_Extras_Alpha1033_g55655 = break89_g55713.a;
				float temp_output_4022_0_g55655 = ( lerpResult4033_g55655 - ( 1.0 - Global_Extras_Alpha1033_g55655 ) );
				half AlphaTreshold2132_g55655 = _Cutoff;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch4017_g55655 = ( temp_output_4022_0_g55655 + AlphaTreshold2132_g55655 );
				#else
				float staticSwitch4017_g55655 = temp_output_4022_0_g55655;
				#endif
				float lerpResult4011_g55655 = lerp( 1.0 , staticSwitch4017_g55655 , _GlobalAlpha);
				half Global_Alpha315_g55655 = saturate( lerpResult4011_g55655 );
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch3792_g55655 = ( ( Main_Alpha316_g55655 * Global_Alpha315_g55655 ) - ( AlphaTreshold2132_g55655 - 0.5 ) );
				#else
				float staticSwitch3792_g55655 = ( Main_Alpha316_g55655 * Global_Alpha315_g55655 );
				#endif
				half Final_Alpha3754_g55655 = staticSwitch3792_g55655;
				float temp_output_661_0_g55655 = ( Final_AlphaFade3727_g55655 * Final_Alpha3754_g55655 );
				float Alpha3735_g55655 = temp_output_661_0_g55655;
				float Treshold3735_g55655 = 0.5;
				{
				#if TVE_ALPHA_CLIP
				clip(Alpha3735_g55655 - Treshold3735_g55655);
				#endif
				}
				half Final_Clip914_g55655 = saturate( Alpha3735_g55655 );
				
				
				float3 Albedo = ( Final_Albedo359_g55655 * Vertex_Occlusion648_g55655 );
				float Alpha = Final_Clip914_g55655;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	/*ase_lod*/
	CustomEditor "TVEShaderCoreGUI"
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
	
}
/*ASEBEGIN
Version=18910
1920;0;1920;1029;2815.485;543.84;1;True;False
Node;AmplifyShaderEditor.FunctionNode;597;-1536,-896;Inherit;False;Compile Core;-1;;52221;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;569;-2176,-384;Inherit;False;Base Shader;0;;55655;856f7164d1c579d43a5cf4968a75ca43;80,3880,1,3882,1,3957,0,4028,1,4029,1,3900,1,3904,1,3903,1,4204,1,3908,1,4172,1,1300,1,1298,1,4179,1,3586,0,3658,1,1708,1,3509,1,1712,0,3873,1,1717,1,1718,1,1715,1,1714,1,916,0,1762,0,1763,0,3568,1,1949,1,1776,1,3475,1,4210,1,893,1,1745,1,3479,0,3501,1,3221,1,1646,1,1757,0,1271,1,3889,0,2807,1,3886,0,2953,1,3887,0,3243,1,3888,0,3728,0,3949,0,2172,0,3883,0,2658,1,1742,1,3484,0,3575,0,1735,0,1734,0,1733,0,1737,0,1736,0,878,0,1550,0,4069,0,4072,0,4068,0,4070,0,4067,0,860,1,3544,1,2261,1,2260,1,2054,0,2032,0,2039,1,2062,1,4177,0,4217,1,3592,1,2750,1,4242,1;0;19;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4135;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4127;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;629;FLOAT3;534
Node;AmplifyShaderEditor.RangedFloatNode;81;-1968,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;197;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-2176,-896;Half;False;Property;_IsGrassShader;_IsGrassShader;196;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;596;-1344,-896;Inherit;False;Compile All Shaders;-1;;55654;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;200;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;199;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;198;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;201;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;535;-2176,384;Inherit;False;Define SHADER GRASS;-1;;55652;921559c53826c0142ba6e27dd03eaef2;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;595;-1888,384;Inherit;False;Define FEATURES UNIVERSAL;-1;;55653;71dc7add32e5f6247b1fb74ecceddd3e;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;592;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;True;17;True;0;False;-1;True;False;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;589;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;588;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;14;BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Standard Lit;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;2;True;10;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;4;0;True;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;17;True;0;False;-1;True;False;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;0;0;Standard;38;Workflow;0;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,True,1013;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Write Depth;0;  Early Z;0;Vertex Position,InvertActionOnDeselection;0;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;591;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;590;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;587;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,256;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
WireConnection;588;0;569;0
WireConnection;588;1;569;528
WireConnection;588;2;569;2489
WireConnection;588;9;569;3678
WireConnection;588;4;569;530
WireConnection;588;5;569;531
WireConnection;588;6;569;532
WireConnection;588;8;569;534
ASEEND*/
//CHKSM=FCECE2C459270DCF32B2B8DED75D86975A1C81F7
