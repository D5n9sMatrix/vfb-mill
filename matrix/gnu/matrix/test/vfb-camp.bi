' campany bolsonaro templates potential effect electrony search electron
' notion to register in tse to more or to less to questing host nuget
' net httpClient 9% tables in wait 3% is to tables 37% to 32% Ax Brazil
' Auto products 12 mounts 11,12% to founds about 0,63% measure level
' IBGE ...
Declare Function IBGE ( ByRef NuGet As T1, ByRef Templates As T2, ByRef Effect As T3)

Type NuGet
    Dim NugetTypes As T1
End Type 

Type Templates
    Dim Templates As T2
End Type

Type Effect
    Dim EffectTypes As T3
End Type 


' Generator PCG32II
' *Really* minimal PCG32 code / (c) 2014 M.E. O'Neill / pcg-random.org
' Licensed under Apache License 2.0 (NO WARRANTY, etc. see website)
' pcg32.rand is an adaptation of a FreeBASIC translation by Matthew Fearnley
' (aka FreeBASIC's counting_pine) 2017-06-04
' Object duplication method by FreeBASIC's St_W

Type pcg32
  Public:
  Declare Sub MyRandomize( seed As Ulongint = 0, seq As Ulongint = 0 )
  Declare Function rand() As Ulong
   Declare Function randse() As Double
  Declare Function range( Byval One As Long, Byval Two As Long ) As Long
   Declare Function GetSeed() As Ulongint
   Declare Function GetSeq() As Ulongint
  Private:
  state As Ulongint
  seq   As Ulongint
   seed  As Ulongint
End Type

Function Get64Bit() As UlongInt
   Return (Cast( Ulongint, Rnd*(2^32) ) Shl 32) Or Cast( Ulongint, Rnd*(2^32) )
End Function

Function pcg32.rand() As Ulong
  Dim As Ulongint oldstate = this.state
  ' Advance internal state
  this.state = oldstate * 6364136223846793005ULL + (this.seq Or 1)
  ' rotate32((state ^ (state >> 18)) >> 27, state >> 59)
  Dim As Ulong xorshifted = ((oldstate Shr 18u) xor oldstate) Shr 27u
  Dim As Ulong rot = oldstate Shr 59u
  Return (xorshifted Shr rot) Or (xorshifted Shl ((-rot) And 31))
End Function

Sub pcg32.MyRandomize( seed As Ulongint = 0, seq As Ulongint = 0 )
  Dim i As Integer
  
  Randomize , 5
  If seed = 0 Then
    If seq = 0 Then
      this.state = Get64Bit
      this.seq = Get64Bit\2
    Else
      this.state = Get64Bit
      this.seq = seq
    End If
  Else
    If seq = 0 Then
      this.state = seed
      this.seq = Get64Bit\2
    Else
      this.state = seed
      this.seq = seq
    End If
  End If
  This.Seed = This.state ' Save initial state
  ' Warm up generator - essential
  ' We probably don't need 200 samples but it only takes one micro-second on my machine
  For i As Integer = 1 To 200
    this.rand()
  Next i
End Sub

Function pcg32.randse() As Double
  Dim TempVar As Ulong
  Dim As Ulongint oldstate = this.state
  ' Advance internal state
  this.state = oldstate * 6364136223846793005ULL + (this.seq Or 1)
  ' rotate32((state ^ (state >> 18)) >> 27, state >> 59)
  Dim As Ulong xorshifted = ((oldstate Shr 18u) xor oldstate) Shr 27u
  Dim As Ulong rot = oldstate Shr 59u
  TempVar =  (xorshifted Shr rot) Or (xorshifted Shl ((-rot) And 31))
    Return TempVar/4294967296.0
End Function

Function pcg32.range( Byval One As Long, Byval Two As Long ) As Long
	Dim TempVar As Ulong
	Dim As Ulongint oldstate = this.state
	' Advance internal state
	this.state = oldstate * 6364136223846793005ULL + (this.seq Or 1)
	' rotate32((state ^ (state >> 18)) >> 27, state >> 59)
	Dim As Ulong xorshifted = ((oldstate Shr 18u) xor oldstate) Shr 27u
	Dim As Ulong rot = oldstate Shr 59u
	Tempvar =  (xorshifted Shr rot) Or (xorshifted Shl ((-rot) And 31))

	' ASM by John Gleason @ PowerBASIC forums 

	Asm
		"movl %[TEMPVAR$1],%%edx \n" _
		"movl %[ONE$1],%%ecx \n" _
		"movl %[TWO$1],%%eax \n" _
		"cmp %%eax,%%ecx \n" _
		"jl 0f \n" _
		"xchg %%ecx,%%eax \n" _
		"0: \n" _
		"Subl %%ecx,%%eax \n" _
		"inc %%eax \n" _
		"jz 1f \n" _
		"mul %%edx \n" _
		"Addl %%ecx,%%edx \n" _
		"1: \n" _
		"movl %%edx,%[TEMPVAR$1] \n" _
		::[TEMPVAR]"m"(TEMPVAR), [ONE]"m"(ONE), [TWO]"m"(TWO)  _
		:"rax", "rdx", "rcx"
	End Asm
	function = Tempvar
End Function

Function pcg32.GetSeed() As Ulongint
   Return This.Seed
End Function

Function pcg32.GetSeq() As Ulongint
   Return This.Seq
End Function

#define Twin False
 
Dim Shared pcg32A As pcg32
Dim Shared pcg32B As pcg32
 
pcg32A.MyRandomize
pcg32B.MyRandomize
 
Dim As Ulong i
Dim As Double t1, y
Dim Shared As Double t2
Dim shared As Ulong counter
Dim As Any Ptr hThread
 
Sub SecondThread( dummy as any ptr)
  Dim As Ulong i
  Dim As Double y
 
  t2 = Timer
  For i = 1 To counter
    y = pcg32A.randse()
  Next
  t2 = Timer - t2
 
End Sub
 
counter = 10^8 ' 100 million
 
#If Twin
  hThread = Threadcreate( @SecondThread, 0 )
#endif
 
t1 = Timer
For i = 1 To counter
  y = pcg32B.randse()
Next
t1 = Timer - t1
 
#if Twin
  Threadwait( hThread )
#endif
 
#if Twin
  Print Int(100/t1);" miil/sec", Int(100/t2);" mill/sec"
#else
  Print Int(100/t1);" mill/sec"
#endif
 
Sleep
End