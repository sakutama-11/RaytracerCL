﻿#ifndef MATH_D2X2_CL
#define MATH_D2X2_CL
//############################################################################## ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM2
// 2 x 2 行列

typedef struct
{
  float _11, _21,
        _12, _22;
}
TSingleM2;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM2

///////////////////////////////////////////////////////////////////////// 演算子

TSingleM2 __attribute__((overloadable)) Mul( const TSingleM2 A, const TSingleM2 B )
{
  TSingleM2 Result;

  Result._11 = A._11 * B._11 + A._12 * B._21;
  Result._12 = A._11 * B._12 + A._12 * B._22;

  Result._21 = A._21 * B._11 + A._22 * B._21;
  Result._22 = A._21 * B._12 + A._22 * B._22;

  return Result;
}

//------------------------------------------------------------------------------

float2 __attribute__((overloadable)) Mul( const TSingleM2 A, const float2 B )
{
  float2 Result;

  Result.x = A._11 * B.x + A._12;
  Result.y = A._21 * B.x + A._22;

  return Result;
}

//------------------------------------------------------------------------------

TSingleM2 __attribute__((overloadable)) Div( const TSingleM2 A, const float B )
{
  TSingleM2 Result;

  Result._11 = A._11 / B;
  Result._12 = A._12 / B;
  Result._21 = A._21 / B;
  Result._22 = A._22 / B;

  return Result;
}

//------------------------------------------------------------------------------

float __attribute__((overloadable)) Det( const TSingleM2 M )
{
  return M._11 * M._22 - M._21 * M._12;
}

//------------------------------------------------------------------------------

TSingleM2 __attribute__((overloadable)) Adjugate( const TSingleM2 M )
{
  TSingleM2 Result;

  Result._11 = +M._22;  Result._12 = -M._12;
  Result._21 = -M._21;  Result._22 = +M._11;

  return Result;
}

//------------------------------------------------------------------------------

TSingleM2 __attribute__((overloadable)) Inverse( const TSingleM2 M )
{
   return Div( Adjugate( M ), Det( M ) );
}

//############################################################################## ■
#endif