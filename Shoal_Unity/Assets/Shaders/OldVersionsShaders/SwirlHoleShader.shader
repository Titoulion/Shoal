// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:42210,y:31561,varname:node_3138,prsc:2|emission-6612-OUT,alpha-1718-OUT,clip-6502-OUT;n:type:ShaderForge.SFN_TexCoord,id:2864,x:34425,y:31538,varname:node_2864,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:2565,x:34609,y:31654,varname:node_2565,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:4021,x:34610,y:31523,varname:node_4021,prsc:2|A-2864-UVOUT,B-2565-OUT;n:type:ShaderForge.SFN_Multiply,id:5097,x:34843,y:31492,varname:node_5097,prsc:2|A-4021-OUT,B-2032-OUT;n:type:ShaderForge.SFN_Vector1,id:2032,x:34720,y:31734,varname:node_2032,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:6372,x:37715,y:30672,varname:node_6372,prsc:2|A-5097-OUT,B-4232-OUT,GT-6974-OUT,EQ-6974-OUT,LT-5656-OUT;n:type:ShaderForge.SFN_OneMinus,id:4232,x:35299,y:31683,varname:node_4232,prsc:2|IN-5568-OUT;n:type:ShaderForge.SFN_Slider,id:5568,x:34732,y:31934,ptovrint:False,ptlb:EdgeWidth,ptin:_EdgeWidth,varname:node_5568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.05,cur:0.05,max:10;n:type:ShaderForge.SFN_Relay,id:6974,x:38015,y:30905,varname:node_6974,prsc:2|IN-4033-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3623,x:36328,y:31736,varname:node_3623,prsc:2|IN-1719-OUT,IMIN-5235-OUT,IMAX-9757-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Vector1,id:9757,x:36042,y:31835,varname:node_9757,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6011,x:36183,y:32105,varname:node_6011,prsc:2,v1:0;n:type:ShaderForge.SFN_Posterize,id:3946,x:37483,y:31917,varname:node_3946,prsc:2|IN-3413-R,STPS-8099-OUT;n:type:ShaderForge.SFN_Tex2d,id:3413,x:37456,y:29953,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_3413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7520-UVOUT;n:type:ShaderForge.SFN_Lerp,id:7484,x:37122,y:31505,varname:node_7484,prsc:2|A-5656-OUT,B-6553-OUT,T-8126-OUT;n:type:ShaderForge.SFN_Lerp,id:8881,x:37769,y:31198,varname:node_8881,prsc:2|A-6822-OUT,B-6553-OUT,T-6287-OUT;n:type:ShaderForge.SFN_If,id:4033,x:38230,y:31139,varname:node_4033,prsc:2|A-1719-OUT,B-5235-OUT,GT-8881-OUT,EQ-6822-OUT,LT-6822-OUT;n:type:ShaderForge.SFN_Multiply,id:9056,x:35339,y:32209,varname:node_9056,prsc:2|A-5568-OUT,B-6193-OUT;n:type:ShaderForge.SFN_Vector1,id:6193,x:35938,y:31721,varname:node_6193,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:5235,x:35401,y:31917,cmnt:MiddleEdge,varname:node_5235,prsc:2|IN-9056-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5083,x:36514,y:32015,varname:node_5083,prsc:2|IN-1719-OUT,IMIN-4232-OUT,IMAX-5235-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Lerp,id:6822,x:37370,y:31118,cmnt:HalfInside,varname:node_6822,prsc:2|A-5656-OUT,B-7484-OUT,T-9044-OUT;n:type:ShaderForge.SFN_Clamp01,id:1719,x:35026,y:31637,varname:node_1719,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:6389,x:37940,y:31696,varname:node_6389,prsc:2|A-3623-OUT,B-3339-OUT,C-4512-OUT;n:type:ShaderForge.SFN_Pi,id:3339,x:38211,y:31807,varname:node_3339,prsc:2;n:type:ShaderForge.SFN_Vector1,id:4512,x:37940,y:31869,varname:node_4512,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:832,x:38182,y:31617,varname:node_832,prsc:2|IN-6389-OUT;n:type:ShaderForge.SFN_Relay,id:9802,x:37381,y:31286,varname:node_9802,prsc:2|IN-564-OUT;n:type:ShaderForge.SFN_Relay,id:9044,x:36869,y:32065,varname:node_9044,prsc:2|IN-7727-OUT;n:type:ShaderForge.SFN_Multiply,id:2264,x:36684,y:32200,varname:node_2264,prsc:2|A-5083-OUT,B-5034-OUT,C-3198-OUT;n:type:ShaderForge.SFN_Pi,id:5034,x:36494,y:32268,varname:node_5034,prsc:2;n:type:ShaderForge.SFN_Vector1,id:3198,x:39128,y:32939,varname:node_3198,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:3739,x:36894,y:32164,varname:node_3739,prsc:2|IN-2264-OUT;n:type:ShaderForge.SFN_OneMinus,id:7727,x:37150,y:32164,varname:node_7727,prsc:2|IN-3739-OUT;n:type:ShaderForge.SFN_OneMinus,id:564,x:38394,y:31604,varname:node_564,prsc:2|IN-832-OUT;n:type:ShaderForge.SFN_Slider,id:8099,x:37078,y:32032,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_8099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:255;n:type:ShaderForge.SFN_Relay,id:6553,x:36977,y:31531,varname:node_6553,prsc:2|IN-2285-OUT;n:type:ShaderForge.SFN_Clamp01,id:6287,x:37576,y:31269,varname:node_6287,prsc:2|IN-9802-OUT;n:type:ShaderForge.SFN_Color,id:258,x:37459,y:30470,ptovrint:False,ptlb:OutsideColor1,ptin:_OutsideColor1,varname:node_258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Clamp01,id:8126,x:37674,y:31803,varname:node_8126,prsc:2|IN-3946-OUT;n:type:ShaderForge.SFN_Color,id:3927,x:38548,y:30412,ptovrint:False,ptlb:ColorCentre,ptin:_ColorCentre,varname:node_3927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Relay,id:5656,x:37058,y:31000,varname:node_5656,prsc:2|IN-7014-OUT;n:type:ShaderForge.SFN_Vector3,id:2285,x:36885,y:31430,varname:node_2285,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:7014,x:36874,y:31000,varname:node_7014,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Lerp,id:8465,x:38897,y:30590,varname:node_8465,prsc:2|A-3927-RGB,B-2354-OUT,T-2414-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3544,x:37956,y:30645,varname:node_3544,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6372-OUT;n:type:ShaderForge.SFN_Clamp01,id:2414,x:38136,y:30640,varname:node_2414,prsc:2|IN-3544-OUT;n:type:ShaderForge.SFN_Tex2d,id:340,x:37435,y:30136,ptovrint:False,ptlb:Perlin2,ptin:_Perlin2,varname:node_340,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7520-UVOUT;n:type:ShaderForge.SFN_Color,id:659,x:37391,y:30336,ptovrint:False,ptlb:OutsideColor2,ptin:_OutsideColor2,varname:node_659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:2354,x:38246,y:30443,varname:node_2354,prsc:2|A-659-RGB,B-258-RGB,T-340-R;n:type:ShaderForge.SFN_Tex2d,id:6902,x:35118,y:29979,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_6902,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:6170,x:36142,y:29723,varname:node_6170,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7372,x:36855,y:29836,varname:node_7372,prsc:2|A-2040-OUT,B-6323-OUT;n:type:ShaderForge.SFN_Append,id:6323,x:36495,y:30019,varname:node_6323,prsc:2|A-8494-OUT,B-1416-OUT;n:type:ShaderForge.SFN_Multiply,id:1651,x:35789,y:30167,varname:node_1651,prsc:2|A-1548-OUT,B-7525-OUT;n:type:ShaderForge.SFN_Tau,id:7525,x:35656,y:30221,varname:node_7525,prsc:2;n:type:ShaderForge.SFN_Cos,id:9792,x:35984,y:30117,varname:node_9792,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Sin,id:6812,x:35984,y:30361,varname:node_6812,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Multiply,id:8494,x:36232,y:30040,varname:node_8494,prsc:2|A-9792-OUT,B-3180-OUT;n:type:ShaderForge.SFN_Multiply,id:1416,x:36295,y:30359,varname:node_1416,prsc:2|A-6812-OUT,B-3180-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3180,x:35767,y:30514,ptovrint:False,ptlb:Distort,ptin:_Distort,varname:node_3180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:680,x:35061,y:30212,varname:node_680,prsc:2;n:type:ShaderForge.SFN_Add,id:1548,x:35584,y:30022,varname:node_1548,prsc:2|A-6902-R,B-1590-OUT;n:type:ShaderForge.SFN_Multiply,id:1590,x:35383,y:30109,varname:node_1590,prsc:2|A-680-TSL,B-6122-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6122,x:35154,y:30563,ptovrint:False,ptlb:SpeedDistort,ptin:_SpeedDistort,varname:node_6122,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:1663,x:39014,y:29576,varname:node_1663,prsc:2|A-1719-OUT,B-3689-OUT;n:type:ShaderForge.SFN_Vector1,id:3689,x:38769,y:29737,varname:node_3689,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:5538,x:39262,y:30175,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_5538,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1663-OUT;n:type:ShaderForge.SFN_Blend,id:6612,x:39159,y:30572,varname:node_6612,prsc:2,blmd:10,clmp:True|SRC-5538-RGB,DST-8465-OUT;n:type:ShaderForge.SFN_If,id:2866,x:37720,y:32855,varname:node_2866,prsc:2|A-5097-OUT,B-5442-OUT,GT-4484-OUT,EQ-4484-OUT,LT-4508-OUT;n:type:ShaderForge.SFN_Vector1,id:5442,x:37360,y:32927,varname:node_5442,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4484,x:37433,y:32991,varname:node_4484,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:4508,x:37401,y:33072,varname:node_4508,prsc:2,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:6502,x:39667,y:33096,ptovrint:False,ptlb:DiskShape,ptin:_DiskShape,varname:node_6502,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4982-OUT,B-2866-OUT;n:type:ShaderForge.SFN_Vector1,id:4982,x:38921,y:33225,varname:node_4982,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:6204,x:40081,y:31726,varname:node_6204,prsc:2|A-7536-OUT,B-9422-OUT,T-2759-OUT;n:type:ShaderForge.SFN_Lerp,id:4812,x:39943,y:32297,varname:node_4812,prsc:2|A-9422-OUT,B-1255-OUT,T-1302-OUT;n:type:ShaderForge.SFN_Relay,id:9422,x:39174,y:31493,varname:node_9422,prsc:2|IN-1693-OUT;n:type:ShaderForge.SFN_Vector1,id:1255,x:39449,y:32360,varname:node_1255,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:7536,x:38843,y:31880,varname:node_7536,prsc:2,v1:1;n:type:ShaderForge.SFN_Code,id:7108,x:38346,y:32039,varname:node_7108,prsc:2,code:aQBmACgAdABoAGUARABpAHMAdABhAG4AYwBlADwAcwB0AGEAcgB0AEYAYQBkAGUAKQAKAHsACgByAGUAdAB1AHIAbgAoAGEAbABwAGgAYQBDAGUAbgB0AGUAcgApADsACgB9AAoAZQBsAHMAZQAgAGkAZgAoAHQAaABlAEQAaQBzAHQAYQBuAGMAZQA8AG0AaQBkAGQAbABlAEYAYQBkAGUAKQAKAHsACgByAGUAdAB1AHIAbgAoAGEAbABwAGgAYQBUAHIAYQBuAHMAaQB0AGkAbwBuADEAKQA7AAoAfQAKAGUAbABzAGUAIABpAGYAKAB0AGgAZQBEAGkAcwB0AGEAbgBjAGUAPAAxAC4AMAApAAoAewAKAHIAZQB0AHUAcgBuACgAYQBsAHAAaABhAFQAcgBhAG4AcwBpAHQAaQBvAG4AMgApADsACgB9AAoAZQBsAHMAZQAKAHsACgByAGUAdAB1AHIAbgAoAGEAbABwAGgAYQBFAG4AZAApADsACgB9AAoA,output:0,fname:TheAlpha,width:791,height:361,input:0,input:0,input:0,input:0,input:0,input:0,input:0,input_1_label:theDistance,input_2_label:alphaCenter,input_3_label:alphaTransition1,input_4_label:alphaTransition2,input_5_label:alphaEnd,input_6_label:startFade,input_7_label:middleFade|A-5097-OUT,B-7536-OUT,C-6204-OUT,D-4812-OUT,E-1255-OUT,F-2400-OUT,G-3957-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9581,x:38690,y:31346,varname:node_9581,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6822-OUT;n:type:ShaderForge.SFN_Relay,id:1888,x:38707,y:32492,varname:node_1888,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:5069,x:39646,y:32543,varname:node_5069,prsc:2|A-2987-OUT,B-4777-OUT,C-6765-OUT;n:type:ShaderForge.SFN_Pi,id:4777,x:39449,y:32569,varname:node_4777,prsc:2;n:type:ShaderForge.SFN_Vector1,id:6765,x:39567,y:32676,varname:node_6765,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Sin,id:1302,x:39894,y:32540,varname:node_1302,prsc:2|IN-5069-OUT;n:type:ShaderForge.SFN_Pi,id:7010,x:39644,y:32135,varname:node_7010,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2879,x:39842,y:32091,varname:node_2879,prsc:2|A-3746-OUT,B-7010-OUT,C-9922-OUT;n:type:ShaderForge.SFN_Vector1,id:9922,x:39681,y:32223,varname:node_9922,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:4600,x:40012,y:32105,varname:node_4600,prsc:2|IN-2879-OUT;n:type:ShaderForge.SFN_OneMinus,id:2759,x:40144,y:32105,varname:node_2759,prsc:2|IN-4600-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3746,x:39393,y:32114,varname:node_3746,prsc:2|IN-1888-OUT,IMIN-2400-OUT,IMAX-3957-OUT,OMIN-1436-OUT,OMAX-2390-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2400,x:39753,y:32785,ptovrint:False,ptlb:StartFadeValue,ptin:_StartFadeValue,varname:node_2400,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:1436,x:39606,y:32897,varname:node_1436,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:2390,x:39491,y:32921,varname:node_2390,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2987,x:40031,y:32663,varname:node_2987,prsc:2|IN-1888-OUT,IMIN-3957-OUT,IMAX-2390-OUT,OMIN-1436-OUT,OMAX-2390-OUT;n:type:ShaderForge.SFN_OneMinus,id:8133,x:40050,y:32920,varname:node_8133,prsc:2|IN-2400-OUT;n:type:ShaderForge.SFN_Multiply,id:8493,x:40207,y:32920,varname:node_8493,prsc:2|A-8133-OUT,B-3198-OUT;n:type:ShaderForge.SFN_Add,id:3957,x:40383,y:32941,varname:node_3957,prsc:2|A-2400-OUT,B-8493-OUT;n:type:ShaderForge.SFN_OneMinus,id:1693,x:39086,y:31305,varname:node_1693,prsc:2|IN-9581-OUT;n:type:ShaderForge.SFN_Tex2d,id:5721,x:41177,y:31715,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_5721,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1408-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1718,x:41411,y:31672,varname:node_1718,prsc:2|A-7108-OUT,B-5721-R;n:type:ShaderForge.SFN_Rotator,id:1408,x:41041,y:31863,varname:node_1408,prsc:2|UVIN-5081-UVOUT,ANG-2015-OUT;n:type:ShaderForge.SFN_TexCoord,id:5081,x:40832,y:31882,varname:node_5081,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:2015,x:41147,y:31949,ptovrint:False,ptlb:ROTA,ptin:_ROTA,varname:node_2015,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ArcTan2,id:486,x:36464,y:29503,varname:node_486,prsc:2|A-7746-OUT,B-2560-OUT;n:type:ShaderForge.SFN_Subtract,id:7746,x:36313,y:29472,varname:node_7746,prsc:2|A-6170-V,B-5134-OUT;n:type:ShaderForge.SFN_Vector1,id:5134,x:36142,y:29517,varname:node_5134,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:2560,x:36313,y:29626,varname:node_2560,prsc:2|A-6170-U,B-5134-OUT;n:type:ShaderForge.SFN_Add,id:3230,x:36688,y:29514,varname:node_3230,prsc:2|A-486-OUT,B-621-OUT;n:type:ShaderForge.SFN_Vector1,id:621,x:36571,y:29739,varname:node_621,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:3415,x:37160,y:29486,varname:node_3415,prsc:2|A-9117-OUT,B-1371-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1371,x:36932,y:29633,ptovrint:False,ptlb:ValueSwirld,ptin:_ValueSwirld,varname:node_1371,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:2040,x:37342,y:29581,varname:node_2040,prsc:2|A-3415-OUT,B-6170-UVOUT;n:type:ShaderForge.SFN_Cos,id:1121,x:36889,y:29347,varname:node_1121,prsc:2|IN-3230-OUT;n:type:ShaderForge.SFN_Sin,id:3876,x:36877,y:29514,varname:node_3876,prsc:2|IN-3230-OUT;n:type:ShaderForge.SFN_Append,id:9117,x:37102,y:29395,varname:node_9117,prsc:2|A-1121-OUT,B-3876-OUT;n:type:ShaderForge.SFN_Rotator,id:7520,x:37215,y:29803,varname:node_7520,prsc:2|UVIN-7372-OUT,ANG-4322-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2184,x:36929,y:30051,ptovrint:False,ptlb:node_2184,ptin:_node_2184,varname:node_2184,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:4322,x:37087,y:30075,varname:node_4322,prsc:2|A-2184-OUT,B-7789-T;n:type:ShaderForge.SFN_Time,id:7789,x:36904,y:30315,varname:node_7789,prsc:2;proporder:5568-3413-8099-258-3927-340-659-6902-3180-6122-5538-6502-2400-5721-2015-1371-2184;pass:END;sub:END;*/

Shader "Shader Forge/ToileShader" {
    Properties {
        _EdgeWidth ("EdgeWidth", Range(0.05, 10)) = 0.05
        _Perlin ("Perlin", 2D) = "white" {}
        _PosterizeStrength ("PosterizeStrength", Range(0, 255)) = 0
        _OutsideColor1 ("OutsideColor1", Color) = (0.5,0.5,0.5,1)
        _ColorCentre ("ColorCentre", Color) = (0.5,0.5,0.5,1)
        _Perlin2 ("Perlin2", 2D) = "white" {}
        _OutsideColor2 ("OutsideColor2", Color) = (0.5,0.5,0.5,1)
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Distort ("Distort", Float ) = 0
        _SpeedDistort ("SpeedDistort", Float ) = 0
        _Ramp ("Ramp", 2D) = "white" {}
        [MaterialToggle] _DiskShape ("DiskShape", Float ) = 1
        _StartFadeValue ("StartFadeValue", Float ) = 0.5
        _Mask ("Mask", 2D) = "white" {}
        _ROTA ("ROTA", Float ) = 0
        _ValueSwirld ("ValueSwirld", Float ) = 0
        _node_2184 ("node_2184", Float ) = 0
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
            uniform float4 _TimeEditor;
            uniform float _EdgeWidth;
            uniform sampler2D _Perlin; uniform float4 _Perlin_ST;
            uniform float _PosterizeStrength;
            uniform float4 _OutsideColor1;
            uniform float4 _ColorCentre;
            uniform sampler2D _Perlin2; uniform float4 _Perlin2_ST;
            uniform float4 _OutsideColor2;
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            uniform float _Distort;
            uniform float _SpeedDistort;
            uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
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
            uniform float _ValueSwirld;
            uniform float _node_2184;
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
                float node_1719 = saturate(node_5097);
                float2 node_1663 = float2(node_1719,0.5);
                float4 _Ramp_var = tex2D(_Ramp,TRANSFORM_TEX(node_1663, _Ramp));
                float4 node_7789 = _Time + _TimeEditor;
                float node_7520_ang = (_node_2184*node_7789.g);
                float node_7520_spd = 1.0;
                float node_7520_cos = cos(node_7520_spd*node_7520_ang);
                float node_7520_sin = sin(node_7520_spd*node_7520_ang);
                float2 node_7520_piv = float2(0.5,0.5);
                float node_5134 = 0.5;
                float node_3230 = (atan2((i.uv0.g-node_5134),(i.uv0.r-node_5134))+0.5);
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(i.uv0, _Perlin3));
                float4 node_680 = _Time + _TimeEditor;
                float node_1651 = ((_Perlin3_var.r+(node_680.r*_SpeedDistort))*6.28318530718);
                float2 node_7520 = (mul((((float2(cos(node_3230),sin(node_3230))*_ValueSwirld)+i.uv0)+float2((cos(node_1651)*_Distort),(sin(node_1651)*_Distort)))-node_7520_piv,float2x2( node_7520_cos, -node_7520_sin, node_7520_sin, node_7520_cos))+node_7520_piv);
                float4 _Perlin2_var = tex2D(_Perlin2,TRANSFORM_TEX(node_7520, _Perlin2));
                float node_4232 = (1.0 - _EdgeWidth);
                float node_6372_if_leA = step(node_5097,node_4232);
                float node_6372_if_leB = step(node_4232,node_5097);
                float3 node_5656 = float3(1,1,1);
                float node_5235 = (1.0 - (_EdgeWidth*0.5)); // MiddleEdge
                float node_4033_if_leA = step(node_1719,node_5235);
                float node_4033_if_leB = step(node_5235,node_1719);
                float3 node_6553 = float3(0,0,0);
                float4 _Perlin_var = tex2D(_Perlin,TRANSFORM_TEX(node_7520, _Perlin));
                float node_6011 = 0.0;
                float node_9757 = 1.0;
                float node_3198 = 0.5;
                float3 node_6822 = lerp(node_5656,lerp(node_5656,node_6553,saturate(floor(_Perlin_var.r * _PosterizeStrength) / (_PosterizeStrength - 1))),(1.0 - cos(((node_6011 + ( (node_1719 - node_4232) * (node_9757 - node_6011) ) / (node_5235 - node_4232))*3.141592654*node_3198)))); // HalfInside
                float3 node_6974 = lerp((node_4033_if_leA*node_6822)+(node_4033_if_leB*lerp(node_6822,node_6553,saturate((1.0 - cos(((node_6011 + ( (node_1719 - node_5235) * (node_9757 - node_6011) ) / (node_9757 - node_5235))*3.141592654*0.5)))))),node_6822,node_4033_if_leA*node_4033_if_leB);
                float3 emissive = saturate(( lerp(_ColorCentre.rgb,lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),saturate(lerp((node_6372_if_leA*node_5656)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r)) > 0.5 ? (1.0-(1.0-2.0*(lerp(_ColorCentre.rgb,lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),saturate(lerp((node_6372_if_leA*node_5656)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r))-0.5))*(1.0-_Ramp_var.rgb)) : (2.0*lerp(_ColorCentre.rgb,lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),saturate(lerp((node_6372_if_leA*node_5656)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r))*_Ramp_var.rgb) ));
                float3 finalColor = emissive;
                float node_7536 = 1.0;
                float node_9422 = (1.0 - node_6822.r);
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
