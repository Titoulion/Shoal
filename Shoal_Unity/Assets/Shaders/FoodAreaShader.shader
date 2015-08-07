// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:42210,y:31561,varname:node_3138,prsc:2|emission-8465-OUT,alpha-1718-OUT,clip-6502-OUT;n:type:ShaderForge.SFN_TexCoord,id:2864,x:34425,y:31538,varname:node_2864,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:2565,x:34609,y:31654,varname:node_2565,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:4021,x:34610,y:31523,varname:node_4021,prsc:2|A-2864-UVOUT,B-2565-OUT;n:type:ShaderForge.SFN_Multiply,id:5097,x:34843,y:31492,varname:node_5097,prsc:2|A-4021-OUT,B-2032-OUT;n:type:ShaderForge.SFN_Vector1,id:2032,x:34720,y:31734,varname:node_2032,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:6372,x:37715,y:30672,varname:node_6372,prsc:2|A-5097-OUT,B-4232-OUT,GT-6974-OUT,EQ-6974-OUT,LT-7484-OUT;n:type:ShaderForge.SFN_OneMinus,id:4232,x:35299,y:31683,varname:node_4232,prsc:2|IN-2528-OUT;n:type:ShaderForge.SFN_Relay,id:6974,x:38015,y:30905,varname:node_6974,prsc:2|IN-4033-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3623,x:36328,y:31736,varname:node_3623,prsc:2|IN-1719-OUT,IMIN-5235-OUT,IMAX-9757-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Vector1,id:9757,x:36042,y:31835,varname:node_9757,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6011,x:36183,y:32105,varname:node_6011,prsc:2,v1:0;n:type:ShaderForge.SFN_Posterize,id:3946,x:37483,y:31917,varname:node_3946,prsc:2|IN-3413-R,STPS-8099-OUT;n:type:ShaderForge.SFN_Tex2d,id:3413,x:37235,y:31844,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_3413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7372-OUT;n:type:ShaderForge.SFN_Lerp,id:7484,x:37122,y:31505,varname:node_7484,prsc:2|A-5656-OUT,B-6553-OUT,T-8126-OUT;n:type:ShaderForge.SFN_Lerp,id:8881,x:37769,y:31198,varname:node_8881,prsc:2|A-6822-OUT,B-6553-OUT,T-6287-OUT;n:type:ShaderForge.SFN_If,id:4033,x:38230,y:31139,varname:node_4033,prsc:2|A-1719-OUT,B-5235-OUT,GT-8881-OUT,EQ-6822-OUT,LT-6822-OUT;n:type:ShaderForge.SFN_Multiply,id:9056,x:35339,y:32209,varname:node_9056,prsc:2|A-2528-OUT,B-6193-OUT;n:type:ShaderForge.SFN_Vector1,id:6193,x:35938,y:31721,varname:node_6193,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:5235,x:35401,y:31917,cmnt:MiddleEdge,varname:node_5235,prsc:2|IN-9056-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5083,x:36514,y:32015,varname:node_5083,prsc:2|IN-1719-OUT,IMIN-4232-OUT,IMAX-5235-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Lerp,id:6822,x:37420,y:31118,cmnt:HalfInside,varname:node_6822,prsc:2|A-7484-OUT,B-7484-OUT,T-9044-OUT;n:type:ShaderForge.SFN_Clamp01,id:1719,x:35026,y:31637,varname:node_1719,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:6389,x:37940,y:31696,varname:node_6389,prsc:2|A-3623-OUT,B-3339-OUT,C-4512-OUT;n:type:ShaderForge.SFN_Pi,id:3339,x:38211,y:31807,varname:node_3339,prsc:2;n:type:ShaderForge.SFN_Vector1,id:4512,x:37940,y:31869,varname:node_4512,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:832,x:38182,y:31617,varname:node_832,prsc:2|IN-6389-OUT;n:type:ShaderForge.SFN_Relay,id:9802,x:37381,y:31286,varname:node_9802,prsc:2|IN-564-OUT;n:type:ShaderForge.SFN_Relay,id:9044,x:36869,y:32065,varname:node_9044,prsc:2|IN-7727-OUT;n:type:ShaderForge.SFN_Multiply,id:2264,x:36684,y:32200,varname:node_2264,prsc:2|A-5083-OUT,B-5034-OUT,C-3198-OUT;n:type:ShaderForge.SFN_Pi,id:5034,x:36494,y:32268,varname:node_5034,prsc:2;n:type:ShaderForge.SFN_Vector1,id:3198,x:39128,y:32939,varname:node_3198,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:3739,x:36894,y:32164,varname:node_3739,prsc:2|IN-2264-OUT;n:type:ShaderForge.SFN_OneMinus,id:7727,x:37150,y:32164,varname:node_7727,prsc:2|IN-3739-OUT;n:type:ShaderForge.SFN_OneMinus,id:564,x:38394,y:31604,varname:node_564,prsc:2|IN-832-OUT;n:type:ShaderForge.SFN_Slider,id:8099,x:37078,y:32032,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_8099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:255;n:type:ShaderForge.SFN_Relay,id:6553,x:36977,y:31531,varname:node_6553,prsc:2|IN-2285-OUT;n:type:ShaderForge.SFN_Clamp01,id:6287,x:37576,y:31269,varname:node_6287,prsc:2|IN-9802-OUT;n:type:ShaderForge.SFN_Color,id:258,x:37382,y:30281,ptovrint:False,ptlb:ColorShapeA,ptin:_ColorShapeA,varname:node_258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Clamp01,id:8126,x:37674,y:31803,varname:node_8126,prsc:2|IN-3946-OUT;n:type:ShaderForge.SFN_Relay,id:5656,x:37058,y:31000,varname:node_5656,prsc:2|IN-7014-OUT;n:type:ShaderForge.SFN_Vector3,id:2285,x:36509,y:31041,varname:node_2285,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:7014,x:36796,y:30955,varname:node_7014,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Lerp,id:8465,x:38532,y:30356,varname:node_8465,prsc:2|A-5112-OUT,B-2354-OUT,T-2414-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3544,x:37956,y:30645,varname:node_3544,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6372-OUT;n:type:ShaderForge.SFN_Clamp01,id:2414,x:38879,y:30738,varname:node_2414,prsc:2|IN-3544-OUT;n:type:ShaderForge.SFN_Color,id:659,x:37491,y:30064,ptovrint:False,ptlb:Color2,ptin:_Color2,varname:node_659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:2354,x:38246,y:30443,varname:node_2354,prsc:2|A-659-RGB,B-5112-OUT,T-3413-R;n:type:ShaderForge.SFN_Tex2d,id:6902,x:35203,y:29964,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_6902,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9907-OUT;n:type:ShaderForge.SFN_TexCoord,id:6170,x:36563,y:29988,varname:node_6170,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7372,x:37096,y:30153,varname:node_7372,prsc:2|A-6170-UVOUT,B-6323-OUT;n:type:ShaderForge.SFN_Append,id:6323,x:36851,y:30233,varname:node_6323,prsc:2|A-5402-OUT,B-1416-OUT;n:type:ShaderForge.SFN_Multiply,id:1651,x:35789,y:30167,varname:node_1651,prsc:2|A-1548-OUT,B-7525-OUT;n:type:ShaderForge.SFN_Tau,id:7525,x:35656,y:30221,varname:node_7525,prsc:2;n:type:ShaderForge.SFN_Cos,id:9792,x:35984,y:30117,varname:node_9792,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Sin,id:6812,x:35984,y:30361,varname:node_6812,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Multiply,id:8494,x:36459,y:30161,varname:node_8494,prsc:2|A-9792-OUT,B-3180-OUT;n:type:ShaderForge.SFN_Multiply,id:1416,x:36459,y:30412,varname:node_1416,prsc:2|A-6812-OUT,B-3180-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3180,x:35683,y:30402,ptovrint:False,ptlb:Distort,ptin:_Distort,varname:node_3180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1548,x:35584,y:30022,varname:node_1548,prsc:2|A-6902-R,B-8094-OUT;n:type:ShaderForge.SFN_If,id:2866,x:37720,y:32855,varname:node_2866,prsc:2|A-5097-OUT,B-5442-OUT,GT-4484-OUT,EQ-4484-OUT,LT-4508-OUT;n:type:ShaderForge.SFN_Vector1,id:5442,x:37360,y:32927,varname:node_5442,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4484,x:37433,y:32991,varname:node_4484,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:4508,x:37401,y:33072,varname:node_4508,prsc:2,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:6502,x:39667,y:33096,ptovrint:False,ptlb:DiskShape,ptin:_DiskShape,varname:node_6502,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4982-OUT,B-2866-OUT;n:type:ShaderForge.SFN_Vector1,id:4982,x:38921,y:33225,varname:node_4982,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:6204,x:40081,y:31726,varname:node_6204,prsc:2|A-7536-OUT,B-9422-OUT,T-2759-OUT;n:type:ShaderForge.SFN_Lerp,id:4812,x:39943,y:32297,varname:node_4812,prsc:2|A-9422-OUT,B-1255-OUT,T-1302-OUT;n:type:ShaderForge.SFN_Relay,id:9422,x:39174,y:31493,varname:node_9422,prsc:2|IN-8126-OUT;n:type:ShaderForge.SFN_Vector1,id:1255,x:39449,y:32360,varname:node_1255,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:7536,x:38843,y:31880,varname:node_7536,prsc:2,v1:1;n:type:ShaderForge.SFN_Code,id:7108,x:38258,y:32191,varname:node_7108,prsc:2,code:aQBmACgAdABoAGUARABpAHMAdABhAG4AYwBlADwAcwB0AGEAcgB0AEYAYQBkAGUAKQAKAHsACgByAGUAdAB1AHIAbgAoAGEAbABwAGgAYQBDAGUAbgB0AGUAcgApADsACgB9AAoAZQBsAHMAZQAgAGkAZgAoAHQAaABlAEQAaQBzAHQAYQBuAGMAZQA8AG0AaQBkAGQAbABlAEYAYQBkAGUAKQAKAHsACgByAGUAdAB1AHIAbgAoAGEAbABwAGgAYQBUAHIAYQBuAHMAaQB0AGkAbwBuADEAKQA7AAoAfQAKAGUAbABzAGUAIABpAGYAKAB0AGgAZQBEAGkAcwB0AGEAbgBjAGUAPAAxAC4AMAApAAoAewAKAHIAZQB0AHUAcgBuACgAYQBsAHAAaABhAFQAcgBhAG4AcwBpAHQAaQBvAG4AMgApADsACgB9AAoAZQBsAHMAZQAKAHsACgByAGUAdAB1AHIAbgAoAGEAbABwAGgAYQBFAG4AZAApADsACgB9AAoA,output:0,fname:TheAlpha,width:791,height:361,input:0,input:0,input:0,input:0,input:0,input:0,input:0,input_1_label:theDistance,input_2_label:alphaCenter,input_3_label:alphaTransition1,input_4_label:alphaTransition2,input_5_label:alphaEnd,input_6_label:startFade,input_7_label:middleFade|A-5097-OUT,B-7536-OUT,C-6204-OUT,D-4812-OUT,E-1255-OUT,F-2400-OUT,G-3957-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9581,x:38602,y:31381,varname:node_9581,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6822-OUT;n:type:ShaderForge.SFN_Relay,id:1888,x:38707,y:32492,varname:node_1888,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:5069,x:39646,y:32543,varname:node_5069,prsc:2|A-2987-OUT,B-4777-OUT,C-6765-OUT;n:type:ShaderForge.SFN_Pi,id:4777,x:39449,y:32569,varname:node_4777,prsc:2;n:type:ShaderForge.SFN_Vector1,id:6765,x:39567,y:32676,varname:node_6765,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Sin,id:1302,x:39894,y:32540,varname:node_1302,prsc:2|IN-5069-OUT;n:type:ShaderForge.SFN_Pi,id:7010,x:39644,y:32135,varname:node_7010,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2879,x:39842,y:32091,varname:node_2879,prsc:2|A-3746-OUT,B-7010-OUT,C-9922-OUT;n:type:ShaderForge.SFN_Vector1,id:9922,x:39681,y:32223,varname:node_9922,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:4600,x:40012,y:32105,varname:node_4600,prsc:2|IN-2879-OUT;n:type:ShaderForge.SFN_OneMinus,id:2759,x:40144,y:32105,varname:node_2759,prsc:2|IN-4600-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3746,x:39393,y:32114,varname:node_3746,prsc:2|IN-1888-OUT,IMIN-2400-OUT,IMAX-3957-OUT,OMIN-1436-OUT,OMAX-2390-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2400,x:39753,y:32785,ptovrint:False,ptlb:StartFadeValue,ptin:_StartFadeValue,varname:node_2400,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:1436,x:39606,y:32897,varname:node_1436,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:2390,x:39491,y:32921,varname:node_2390,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2987,x:40031,y:32663,varname:node_2987,prsc:2|IN-1888-OUT,IMIN-3957-OUT,IMAX-2390-OUT,OMIN-1436-OUT,OMAX-2390-OUT;n:type:ShaderForge.SFN_OneMinus,id:8133,x:40050,y:32920,varname:node_8133,prsc:2|IN-2400-OUT;n:type:ShaderForge.SFN_Multiply,id:8493,x:40207,y:32920,varname:node_8493,prsc:2|A-8133-OUT,B-3198-OUT;n:type:ShaderForge.SFN_Add,id:3957,x:40383,y:32941,varname:node_3957,prsc:2|A-2400-OUT,B-8493-OUT;n:type:ShaderForge.SFN_OneMinus,id:1693,x:39086,y:31305,varname:node_1693,prsc:2|IN-8126-OUT;n:type:ShaderForge.SFN_Tex2d,id:5721,x:41177,y:31715,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_5721,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1408-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1718,x:41411,y:31672,varname:node_1718,prsc:2|A-7108-OUT,B-5721-R;n:type:ShaderForge.SFN_Rotator,id:1408,x:41041,y:31863,varname:node_1408,prsc:2|UVIN-5081-UVOUT,ANG-2015-OUT;n:type:ShaderForge.SFN_TexCoord,id:5081,x:40832,y:31882,varname:node_5081,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:2015,x:41147,y:31949,ptovrint:False,ptlb:ROTA,ptin:_ROTA,varname:node_2015,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:2528,x:34921,y:32083,varname:node_2528,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:9332,x:34272,y:29817,varname:node_9332,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:5966,x:34561,y:29815,varname:node_5966,prsc:2|A-9332-UVOUT,B-9500-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:9500,x:34561,y:30041,varname:node_9500,prsc:2|IN-3822-OUT,IMIN-3469-OUT,IMAX-2842-OUT,OMIN-6225-OUT,OMAX-7063-OUT;n:type:ShaderForge.SFN_Slider,id:3822,x:34128,y:30071,ptovrint:False,ptlb:ProgressTouch,ptin:_ProgressTouch,varname:node_3822,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Vector1,id:3469,x:34332,y:30144,varname:node_3469,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:2842,x:34332,y:30206,varname:node_2842,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6225,x:34481,y:30201,varname:node_6225,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Vector1,id:7063,x:34543,y:30286,varname:node_7063,prsc:2,v1:2.5;n:type:ShaderForge.SFN_Add,id:9907,x:34915,y:29748,varname:node_9907,prsc:2|A-5966-OUT,B-914-OUT;n:type:ShaderForge.SFN_OneMinus,id:9134,x:34694,y:29547,varname:node_9134,prsc:2|IN-9500-OUT;n:type:ShaderForge.SFN_Multiply,id:914,x:34911,y:29555,varname:node_914,prsc:2|A-9134-OUT,B-913-OUT;n:type:ShaderForge.SFN_Vector1,id:913,x:35220,y:29634,varname:node_913,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Relay,id:5112,x:37787,y:30363,varname:node_5112,prsc:2|IN-8287-OUT;n:type:ShaderForge.SFN_Color,id:11,x:37382,y:30445,ptovrint:False,ptlb:ColorShapeB,ptin:_ColorShapeB,varname:node_11,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:8287,x:37641,y:30421,varname:node_8287,prsc:2|A-258-RGB,B-11-RGB,T-3822-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8094,x:35104,y:30543,ptovrint:False,ptlb:valueDistort,ptin:_valueDistort,varname:node_8094,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:5402,x:36632,y:30458,varname:node_5402,prsc:2|A-8494-OUT,B-7030-OUT;n:type:ShaderForge.SFN_Multiply,id:7030,x:35249,y:30574,varname:node_7030,prsc:2|A-8094-OUT,B-1199-OUT;n:type:ShaderForge.SFN_Vector1,id:1199,x:35420,y:30643,varname:node_1199,prsc:2,v1:0.45;proporder:3413-8099-258-659-6902-3180-6502-2400-5721-2015-3822-11-8094;pass:END;sub:END;*/

Shader "Shader Forge/FoodArea" {
    Properties {
        _Perlin ("Perlin", 2D) = "white" {}
        _PosterizeStrength ("PosterizeStrength", Range(0, 255)) = 0
        _ColorShapeA ("ColorShapeA", Color) = (0.5,0.5,0.5,1)
        _Color2 ("Color2", Color) = (0.5,0.5,0.5,1)
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Distort ("Distort", Float ) = 0
        [MaterialToggle] _DiskShape ("DiskShape", Float ) = 1
        _StartFadeValue ("StartFadeValue", Float ) = 0.5
        _Mask ("Mask", 2D) = "white" {}
        _ROTA ("ROTA", Float ) = 0
        _ProgressTouch ("ProgressTouch", Range(0, 1)) = 0
        _ColorShapeB ("ColorShapeB", Color) = (0.5,0.5,0.5,1)
        _valueDistort ("valueDistort", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Perlin; uniform float4 _Perlin_ST;
            uniform float _PosterizeStrength;
            uniform float4 _ColorShapeA;
            uniform float4 _Color2;
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            uniform float _Distort;
            uniform fixed _DiskShape;
            float TheAlpha( float theDistance , float alphaCenter , float alphaTransition1 , float alphaTransition2 , float alphaEnd , float startFade , float middleFade ){
            if(theDistance<startFade)
            {
            return(alphaCenter);
            }
            else if(theDistance<middleFade)
            {
            return(alphaTransition1);
            }
            else if(theDistance<1.0)
            {
            return(alphaTransition2);
            }
            else
            {
            return(alphaEnd);
            }
            
            }
            
            uniform float _StartFadeValue;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform float _ROTA;
            uniform float _ProgressTouch;
            uniform float4 _ColorShapeB;
            uniform float _valueDistort;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float node_5097 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_2866_if_leA = step(node_5097,1.0);
                float node_2866_if_leB = step(1.0,node_5097);
                float node_4484 = 0.0;
                clip(lerp( 1.0, lerp((node_2866_if_leA*1.0)+(node_2866_if_leB*node_4484),node_4484,node_2866_if_leA*node_2866_if_leB), _DiskShape ) - 0.5);
////// Lighting:
////// Emissive:
                float3 node_5112 = lerp(_ColorShapeA.rgb,_ColorShapeB.rgb,_ProgressTouch);
                float node_3469 = 0.0;
                float node_6225 = 1.2;
                float node_9500 = (node_6225 + ( (_ProgressTouch - node_3469) * (2.5 - node_6225) ) / (1.0 - node_3469));
                float2 node_9907 = ((i.uv0*node_9500)+((1.0 - node_9500)*0.5));
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(node_9907, _Perlin3));
                float node_1651 = ((_Perlin3_var.r+_valueDistort)*6.28318530718);
                float2 node_7372 = (i.uv0+float2(((cos(node_1651)*_Distort)+(_valueDistort*0.45)),(sin(node_1651)*_Distort)));
                float4 _Perlin_var = tex2D(_Perlin,TRANSFORM_TEX(node_7372, _Perlin));
                float node_2528 = 1.0;
                float node_4232 = (1.0 - node_2528);
                float node_6372_if_leA = step(node_5097,node_4232);
                float node_6372_if_leB = step(node_4232,node_5097);
                float3 node_6553 = float3(0,0,0);
                float node_8126 = saturate(floor(_Perlin_var.r * _PosterizeStrength) / (_PosterizeStrength - 1));
                float3 node_7484 = lerp(float3(1,1,1),node_6553,node_8126);
                float node_1719 = saturate(node_5097);
                float node_5235 = (1.0 - (node_2528*0.5)); // MiddleEdge
                float node_4033_if_leA = step(node_1719,node_5235);
                float node_4033_if_leB = step(node_5235,node_1719);
                float node_6011 = 0.0;
                float node_9757 = 1.0;
                float node_3198 = 0.5;
                float3 node_6822 = lerp(node_7484,node_7484,(1.0 - cos(((node_6011 + ( (node_1719 - node_4232) * (node_9757 - node_6011) ) / (node_5235 - node_4232))*3.141592654*node_3198)))); // HalfInside
                float3 node_6974 = lerp((node_4033_if_leA*node_6822)+(node_4033_if_leB*lerp(node_6822,node_6553,saturate((1.0 - cos(((node_6011 + ( (node_1719 - node_5235) * (node_9757 - node_6011) ) / (node_9757 - node_5235))*3.141592654*0.5)))))),node_6822,node_4033_if_leA*node_4033_if_leB);
                float3 emissive = lerp(node_5112,lerp(_Color2.rgb,node_5112,_Perlin_var.r),saturate(lerp((node_6372_if_leA*node_7484)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r));
                float3 finalColor = emissive;
                float node_7536 = 1.0;
                float node_9422 = node_8126;
                float node_1888 = node_5097;
                float node_3957 = (_StartFadeValue+((1.0 - _StartFadeValue)*node_3198));
                float node_1436 = 0.0;
                float node_2390 = 1.0;
                float node_1255 = 0.0;
                float node_1408_ang = _ROTA;
                float node_1408_spd = 1.0;
                float node_1408_cos = cos(node_1408_spd*node_1408_ang);
                float node_1408_sin = sin(node_1408_spd*node_1408_ang);
                float2 node_1408_piv = float2(0.5,0.5);
                float2 node_1408 = (mul(i.uv0-node_1408_piv,float2x2( node_1408_cos, -node_1408_sin, node_1408_sin, node_1408_cos))+node_1408_piv);
                float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(node_1408, _Mask));
                return fixed4(finalColor,(TheAlpha( node_5097 , node_7536 , lerp(node_7536,node_9422,(1.0 - cos(((node_1436 + ( (node_1888 - _StartFadeValue) * (node_2390 - node_1436) ) / (node_3957 - _StartFadeValue))*3.141592654*0.5)))) , lerp(node_9422,node_1255,sin(((node_1436 + ( (node_1888 - node_3957) * (node_2390 - node_1436) ) / (node_2390 - node_3957))*3.141592654*0.5))) , node_1255 , _StartFadeValue , node_3957 )*_Mask_var.r));
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform fixed _DiskShape;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float node_5097 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_2866_if_leA = step(node_5097,1.0);
                float node_2866_if_leB = step(1.0,node_5097);
                float node_4484 = 0.0;
                clip(lerp( 1.0, lerp((node_2866_if_leA*1.0)+(node_2866_if_leB*node_4484),node_4484,node_2866_if_leA*node_2866_if_leB), _DiskShape ) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
