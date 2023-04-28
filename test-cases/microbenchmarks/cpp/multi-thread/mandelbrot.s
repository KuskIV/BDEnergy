	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"mandelbrot.cpp"
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
main:                                   # @main
.Lfunc_begin0:
.seh_proc main
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$280, %rsp                      # imm = 0x118
	.seh_stackalloc 280
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	movaps	%xmm6, 128(%rbp)                # 16-byte Spill
	.seh_savexmm %xmm6, 256
	.seh_endprologue
	movq	$-2, 120(%rbp)
	movl	$16000, %r8d                    # imm = 0x3E80
	cmpl	$2, %ecx
	jl	.LBB0_2
# %bb.1:
	movq	8(%rdx), %rcx
	callq	atoi
	movslq	%eax, %r8
.LBB0_2:
	leaq	"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A"(%rip), %rdx
	leaq	-80(%rbp), %rsi
	movq	%rsi, %rcx
	movq	%r8, %r9
	callq	"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
	movl	numberOfCpuCores(%rip), %eax
	movq	%rax, -32(%rbp)
	xorps	%xmm6, %xmm6
	movaps	%xmm6, 64(%rbp)
	movq	$0, 80(%rbp)
	movq	$0, 96(%rbp)
	testq	%rax, %rax
	je	.LBB0_8
# %bb.3:
	xorl	%ecx, %ecx
	leaq	-32(%rbp), %r14
	leaq	64(%rbp), %r15
	leaq	96(%rbp), %rbx
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	%rsi, (%rdx)
	movq	%rcx, 8(%rdx)
	movq	%rax, 16(%rdx)
	movq	-72(%rbp), %rdi
	shrq	$3, %rdi
	imulq	%rdi, %rcx
	movq	%rcx, 24(%rdx)
	imulq	%rax, %rdi
	movq	%rdi, 32(%rdx)
	addq	$40, 72(%rbp)
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	movq	96(%rbp), %rcx
	incq	%rcx
	movq	%rcx, 96(%rbp)
	movq	-32(%rbp), %rax
	cmpq	%rax, %rcx
	jae	.LBB0_8
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	72(%rbp), %rdx
	cmpq	80(%rbp), %rdx
	jne	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
.Ltmp0:
	movq	%r14, 32(%rsp)
	movq	%r15, %rcx
	movq	%rsi, %r8
	movq	%rbx, %r9
	callq	"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
.Ltmp1:
	jmp	.LBB0_7
.LBB0_8:
	movaps	%xmm6, 96(%rbp)
	movq	$0, 112(%rbp)
	movq	64(%rbp), %rdi
	movq	72(%rbp), %r13
	leaq	(%rbp), %rbx
	movabsq	$4607182418800017408, %r14      # imm = 0x3FF0000000000000
	movabsq	$4616189618054758400, %r15      # imm = 0x4010000000000000
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	cmpq	%r13, %rdi
	je	.LBB0_10
# %bb.15:                               #   in Loop: Header=BB0_9 Depth=1
	movabsq	$-4613937818241073152, %rax     # imm = 0xBFF8000000000000
	movq	%rax, -32(%rbp)
	movabsq	$-4616189618054758400, %rax     # imm = 0xBFF0000000000000
	movq	%rax, -24(%rbp)
	movabsq	$4602678819172646912, %rax      # imm = 0x3FE0000000000000
	movq	%rax, -16(%rbp)
	movq	%r14, -8(%rbp)
	movq	32(%rdi), %rax
	movq	%rax, 32(%rbx)
	movups	(%rdi), %xmm0
	movups	16(%rdi), %xmm1
	movups	%xmm1, 16(%rbx)
	movups	%xmm0, (%rbx)
	movq	$8, 40(%rbp)
	movq	%r15, 48(%rbp)
	movq	104(%rbp), %rsi
	cmpq	112(%rbp), %rsi
	je	.LBB0_23
# %bb.16:                               #   in Loop: Header=BB0_9 Depth=1
.Ltmp2:
	movl	$88, %ecx
	callq	"??2@YAPEAX_K@Z"
.Ltmp3:
# %bb.17:                               #   in Loop: Header=BB0_9 Depth=1
	movq	48(%rbp), %rcx
	movq	%rcx, 80(%rax)
	movups	32(%rbp), %xmm0
	movups	%xmm0, 64(%rax)
	movups	-32(%rbp), %xmm0
	movups	-16(%rbp), %xmm1
	movups	(%rbp), %xmm2
	movups	16(%rbp), %xmm3
	movups	%xmm3, 48(%rax)
	movups	%xmm2, 32(%rax)
	movups	%xmm1, 16(%rax)
	movups	%xmm0, (%rax)
	leaq	8(%rsi), %r12
.Ltmp4:
	movq	%r12, 40(%rsp)
	movl	$0, 32(%rsp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"(%rip), %r8
	movq	%rax, 56(%rbp)                  # 8-byte Spill
	movq	%rax, %r9
	callq	_beginthreadex
.Ltmp5:
# %bb.18:                               #   in Loop: Header=BB0_9 Depth=1
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.LBB0_19
# %bb.22:                               #   in Loop: Header=BB0_9 Depth=1
	addq	$16, 104(%rbp)
	addq	$40, %rdi
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_23:                               #   in Loop: Header=BB0_9 Depth=1
.Ltmp8:
	leaq	96(%rbp), %rcx
	movq	%rsi, %rdx
	leaq	-32(%rbp), %r8
	callq	"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
.Ltmp9:
# %bb.24:                               #   in Loop: Header=BB0_9 Depth=1
	addq	$40, %rdi
	jmp	.LBB0_9
.LBB0_10:
	movq	96(%rbp), %rdi
	movq	104(%rbp), %rbx
	leaq	-32(%rbp), %r14
	cmpq	%rbx, %rdi
	je	.LBB0_12
	.p2align	4, 0x90
.LBB0_53:                               # =>This Inner Loop Header: Depth=1
	movl	8(%rdi), %esi
	testl	%esi, %esi
	je	.LBB0_54
# %bb.56:                               #   in Loop: Header=BB0_53 Depth=1
.Ltmp10:
	callq	_Thrd_id
.Ltmp11:
# %bb.57:                               #   in Loop: Header=BB0_53 Depth=1
	cmpl	%eax, %esi
	je	.LBB0_58
# %bb.60:                               #   in Loop: Header=BB0_53 Depth=1
	movups	(%rdi), %xmm0
	movaps	%xmm0, -32(%rbp)
.Ltmp12:
	movq	%r14, %rcx
	xorl	%edx, %edx
	callq	_Thrd_join
.Ltmp13:
# %bb.61:                               #   in Loop: Header=BB0_53 Depth=1
	testl	%eax, %eax
	jne	.LBB0_62
# %bb.64:                               #   in Loop: Header=BB0_53 Depth=1
	movq	$0, (%rdi)
	movl	$0, 8(%rdi)
	addq	$16, %rdi
	cmpq	%rbx, %rdi
	jne	.LBB0_53
.LBB0_12:
	movq	96(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB0_35
# %bb.13:
	movq	104(%rbp), %rax
	cmpq	%rax, %rcx
	je	.LBB0_28
# %bb.14:
	movq	%rcx, %rdx
	.p2align	4, 0x90
.LBB0_26:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, 8(%rdx)
	jne	.LBB0_27
# %bb.25:                               #   in Loop: Header=BB0_26 Depth=1
	addq	$16, %rdx
	cmpq	%rax, %rdx
	jne	.LBB0_26
.LBB0_28:
	movq	112(%rbp), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB0_34
# %bb.29:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB0_30
# %bb.33:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB0_34:
	callq	"??3@YAXPEAX_K@Z"
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 96(%rbp)
	movq	$0, 112(%rbp)
.LBB0_35:
	movq	64(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB0_43
# %bb.36:
	movq	80(%rbp), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB0_42
# %bb.37:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB0_38
# %bb.41:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB0_42:
	callq	"??3@YAXPEAX_K@Z"
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 64(%rbp)
	movq	$0, 80(%rbp)
.LBB0_43:
	movq	-48(%rbp), %r8
	movq	-80(%rbp), %rcx
	movq	-56(%rbp), %rdx
	subq	%rdx, %r8
.Ltmp24:
	callq	"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
.Ltmp25:
# %bb.44:
	movq	-56(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB0_52
# %bb.45:
	movq	-40(%rbp), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB0_51
# %bb.46:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB0_47
# %bb.50:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB0_51:
	leaq	-56(%rbp), %rsi
	callq	"??3@YAXPEAX_K@Z"
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	movq	$0, 16(%rsi)
.LBB0_52:
	xorl	%eax, %eax
	movaps	128(%rbp), %xmm6                # 16-byte Reload
	addq	$280, %rsp                      # imm = 0x118
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_62:
.Ltmp14:
	movl	$2, %ecx
	callq	"?_Throw_Cpp_error@std@@YAXH@Z"
.Ltmp15:
# %bb.63:
.LBB0_54:
.Ltmp18:
	movl	$1, %ecx
	callq	"?_Throw_Cpp_error@std@@YAXH@Z"
.Ltmp19:
# %bb.55:
.LBB0_58:
.Ltmp16:
	movl	$5, %ecx
	callq	"?_Throw_Cpp_error@std@@YAXH@Z"
.Ltmp17:
# %bb.59:
.LBB0_19:
	movl	$0, (%r12)
.Ltmp6:
	movl	$6, %ecx
	callq	"?_Throw_Cpp_error@std@@YAXH@Z"
.Ltmp7:
# %bb.20:
.LBB0_27:
	callq	terminate
.LBB0_38:
.Ltmp22:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp23:
# %bb.39:
.LBB0_47:
.Ltmp26:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp27:
# %bb.48:
.LBB0_30:
.Ltmp20:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp21:
# %bb.31:
	int3
	.seh_handlerdata
	.long	($cppxdata$main)@IMGREL
	.text
	.seh_endproc
	.def	"?dtor$21@?0?main@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$21@?0?main@4HA":
.seh_proc "?dtor$21@?0?main@4HA"
.LBB0_21:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movaps	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	movq	56(%rbp), %rcx                  # 8-byte Reload
	callq	"??3@YAXPEAX@Z"
	movaps	48(%rsp), %xmm6                 # 16-byte Reload
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.text
	.seh_endproc
	.def	"?dtor$32@?0?main@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$32@?0?main@4HA":
.seh_proc "?dtor$32@?0?main@4HA"
.LBB0_32:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movaps	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.text
	.seh_endproc
	.def	"?dtor$40@?0?main@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$40@?0?main@4HA":
.seh_proc "?dtor$40@?0?main@4HA"
.LBB0_40:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movaps	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.text
	.seh_endproc
	.def	"?dtor$49@?0?main@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$49@?0?main@4HA":
.seh_proc "?dtor$49@?0?main@4HA"
.LBB0_49:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movaps	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.text
	.seh_endproc
	.def	"?dtor$65@?0?main@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$65@?0?main@4HA":
.seh_proc "?dtor$65@?0?main@4HA"
.LBB0_65:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movaps	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	leaq	96(%rbp), %rcx
	callq	"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
	leaq	64(%rbp), %rcx
	callq	"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
	leaq	-80(%rbp), %rcx
	callq	"??1PortableBinaryBitmap@@QEAA@XZ"
	movaps	48(%rsp), %xmm6                 # 16-byte Reload
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.text
	.seh_endproc
	.def	"?dtor$66@?0?main@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$66@?0?main@4HA":
.seh_proc "?dtor$66@?0?main@4HA"
.LBB0_66:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movaps	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.text
	.seh_endproc
	.def	"?dtor$67@?0?main@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$67@?0?main@4HA":
.seh_proc "?dtor$67@?0?main@4HA"
.LBB0_67:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movaps	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end0:
	.seh_handlerdata
	.text
	.seh_endproc
	.section	.xdata,"dr"
	.p2align	2
$cppxdata$main:
	.long	429065506                       # MagicNumber
	.long	7                               # MaxState
	.long	($stateUnwindMap$main)@IMGREL   # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	12                              # IPMapEntries
	.long	($ip2state$main)@IMGREL         # IPToStateXData
	.long	248                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
$stateUnwindMap$main:
	.long	-1                              # ToState
	.long	"?dtor$66@?0?main@4HA"@IMGREL   # Action
	.long	-1                              # ToState
	.long	"?dtor$32@?0?main@4HA"@IMGREL   # Action
	.long	-1                              # ToState
	.long	"?dtor$40@?0?main@4HA"@IMGREL   # Action
	.long	-1                              # ToState
	.long	"?dtor$49@?0?main@4HA"@IMGREL   # Action
	.long	-1                              # ToState
	.long	"?dtor$67@?0?main@4HA"@IMGREL   # Action
	.long	-1                              # ToState
	.long	"?dtor$65@?0?main@4HA"@IMGREL   # Action
	.long	5                               # ToState
	.long	"?dtor$21@?0?main@4HA"@IMGREL   # Action
$ip2state$main:
	.long	.Lfunc_begin0@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp0@IMGREL+1                 # IP
	.long	0                               # ToState
	.long	.Ltmp2@IMGREL+1                 # IP
	.long	5                               # ToState
	.long	.Ltmp4@IMGREL+1                 # IP
	.long	6                               # ToState
	.long	.Ltmp8@IMGREL+1                 # IP
	.long	5                               # ToState
	.long	.Ltmp24@IMGREL+1                # IP
	.long	4                               # ToState
	.long	.Ltmp14@IMGREL+1                # IP
	.long	5                               # ToState
	.long	.Ltmp6@IMGREL+1                 # IP
	.long	6                               # ToState
	.long	.Ltmp22@IMGREL+1                # IP
	.long	2                               # ToState
	.long	.Ltmp26@IMGREL+1                # IP
	.long	3                               # ToState
	.long	.Ltmp20@IMGREL+1                # IP
	.long	1                               # ToState
	.long	.Ltmp21@IMGREL+1                # IP
	.long	-1                              # ToState
	.text
                                        # -- End function
	.def	"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
	.globl	"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z" # -- Begin function ??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z
	.p2align	4, 0x90
"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z": # @"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
.Lfunc_begin1:
.seh_proc "??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	movl	%r8d, %eax
	andl	$7, %eax
	movl	$8, %edi
	subq	%rax, %rdi
	testq	%rax, %rax
	cmoveq	%rax, %rdi
	movq	%rdx, (%rcx)
	addq	%r8, %rdi
	movq	%rdi, 8(%rcx)
	movl	numberOfCpuCores(%rip), %ecx
	movq	%r9, %rax
	xorl	%edx, %edx
	divq	%rcx
	subq	%rdx, %rcx
	testq	%rdx, %rdx
	cmoveq	%rdx, %rcx
	addq	%r9, %rcx
	movq	%rcx, 16(%rsi)
	imulq	%rdi, %rcx
	xorps	%xmm0, %xmm0
	movups	%xmm0, 24(%rsi)
	movq	$0, 40(%rsi)
	cmpq	$8, %rcx
	jb	.LBB1_5
# %bb.1:
	movq	%rcx, %rdi
	shrq	$3, %rdi
	cmpq	$32768, %rcx                    # imm = 0x8000
	jb	.LBB1_3
# %bb.2:
	leaq	39(%rdi), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rcx
	andq	$-32, %rcx
	movq	%rax, -8(%rcx)
	jmp	.LBB1_4
.LBB1_3:
	movq	%rdi, %rcx
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rcx
.LBB1_4:
	movq	%rcx, 24(%rsi)
	movq	%rcx, 32(%rsi)
	leaq	(%rcx,%rdi), %rbx
	movq	%rbx, 40(%rsi)
	xorl	%edx, %edx
	movq	%rdi, %r8
	callq	memset
	movq	%rbx, 32(%rsi)
.LBB1_5:
	leaq	24(%rsi), %rax
	movq	%rax, -8(%rbp)                  # 8-byte Spill
	movq	(%rsi), %rcx
.Ltmp28:
	leaq	"??_C@_02NHCIPLKK@P4?$AA@"(%rip), %rdx
	callq	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
.Ltmp29:
# %bb.6:
.Ltmp30:
	movq	%rax, %rcx
	movb	$10, %dl
	callq	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
.Ltmp31:
# %bb.7:
	movq	(%rsi), %rcx
	movq	8(%rsi), %rdx
.Ltmp32:
	callq	"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
.Ltmp33:
# %bb.8:
.Ltmp34:
	movq	%rax, %rcx
	movb	$32, %dl
	callq	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
.Ltmp35:
# %bb.9:
	movq	16(%rsi), %rdx
.Ltmp36:
	movq	%rax, %rcx
	callq	"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
.Ltmp37:
# %bb.10:
.Ltmp38:
	movq	%rax, %rcx
	movb	$10, %dl
	callq	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
.Ltmp39:
# %bb.11:
	movq	%rsi, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z")@IMGREL
	.section	.text,"xr",discard,"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
	.seh_endproc
	.def	"?dtor$12@?0???0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$12@?0???0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z@4HA":
.seh_proc "?dtor$12@?0???0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z@4HA"
.LBB1_12:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	48(%rdx), %rbp
	.seh_endprologue
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	callq	"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end1:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
	.p2align	2
"$cppxdata$??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z")@IMGREL # IPToStateXData
	.long	48                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z":
	.long	-1                              # ToState
	.long	"?dtor$12@?0???0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z@4HA"@IMGREL # Action
"$ip2state$??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z":
	.long	.Lfunc_begin1@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp28@IMGREL+1                # IP
	.long	0                               # ToState
	.long	.Ltmp39@IMGREL+1                # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0PortableBinaryBitmap@@QEAA@AEAV?$basic_ostream@DU?$char_traits@D@std@@@std@@_K1@Z"
                                        # -- End function
	.def	"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
	.globl	"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ" # -- Begin function ??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ
	.p2align	4, 0x90
"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ": # @"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
.Lfunc_begin2:
.seh_proc "??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB2_13
# %bb.1:
	movq	8(%rsi), %rax
	cmpq	%rax, %rcx
	je	.LBB2_6
# %bb.2:
	movq	%rcx, %rdx
	.p2align	4, 0x90
.LBB2_4:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, 8(%rdx)
	jne	.LBB2_5
# %bb.3:                                #   in Loop: Header=BB2_4 Depth=1
	addq	$16, %rdx
	cmpq	%rax, %rdx
	jne	.LBB2_4
.LBB2_6:
	movq	16(%rsi), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB2_12
# %bb.7:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB2_8
# %bb.11:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB2_12:
	callq	"??3@YAXPEAX_K@Z"
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	movq	$0, 16(%rsi)
.LBB2_13:
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
.LBB2_5:
	callq	terminate
.LBB2_8:
.Ltmp40:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp41:
# %bb.9:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$10@?0???1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$10@?0???1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$10@?0???1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ@4HA"
.LBB2_10:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end2:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$10@?0???1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ":
	.long	.Lfunc_begin2@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp40@IMGREL+1                # IP
	.long	0                               # ToState
	.long	.Ltmp41@IMGREL+1                # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@QEAA@XZ"
                                        # -- End function
	.def	"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
	.globl	"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ" # -- Begin function ??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ
	.p2align	4, 0x90
"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ": # @"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
.Lfunc_begin3:
.seh_proc "??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_8
# %bb.1:
	movq	16(%rsi), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB3_7
# %bb.2:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB3_3
# %bb.6:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB3_7:
	callq	"??3@YAXPEAX_K@Z"
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	movq	$0, 16(%rsi)
.LBB3_8:
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
.LBB3_3:
.Ltmp42:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp43:
# %bb.4:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$5@?0???1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$5@?0???1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$5@?0???1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ@4HA"
.LBB3_5:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end3:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$5@?0???1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ":
	.long	.Lfunc_begin3@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp42@IMGREL+1                # IP
	.long	0                               # ToState
	.long	.Ltmp43@IMGREL+1                # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@QEAA@XZ"
                                        # -- End function
	.def	"??1PortableBinaryBitmap@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1PortableBinaryBitmap@@QEAA@XZ"
	.globl	"??1PortableBinaryBitmap@@QEAA@XZ" # -- Begin function ??1PortableBinaryBitmap@@QEAA@XZ
	.p2align	4, 0x90
"??1PortableBinaryBitmap@@QEAA@XZ":     # @"??1PortableBinaryBitmap@@QEAA@XZ"
.Lfunc_begin4:
.seh_proc "??1PortableBinaryBitmap@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	%rcx, %rsi
	movq	32(%rcx), %r8
	movq	(%rcx), %rcx
	movq	24(%rsi), %rdx
	subq	%rdx, %r8
.Ltmp44:
	callq	"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
.Ltmp45:
# %bb.1:
	leaq	24(%rsi), %rdi
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB4_9
# %bb.2:
	movq	40(%rsi), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB4_8
# %bb.3:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB4_4
# %bb.7:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB4_8:
	callq	"??3@YAXPEAX_K@Z"
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rdi)
	movq	$0, 16(%rdi)
.LBB4_9:
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
.LBB4_4:
.Ltmp46:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp47:
# %bb.5:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??1PortableBinaryBitmap@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1PortableBinaryBitmap@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$6@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$6@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA":
.seh_proc "?dtor$6@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA"
.LBB4_6:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??1PortableBinaryBitmap@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$10@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$10@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA":
.seh_proc "?dtor$10@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA"
.LBB4_10:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end4:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1PortableBinaryBitmap@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1PortableBinaryBitmap@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1PortableBinaryBitmap@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$??1PortableBinaryBitmap@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	4                               # IPMapEntries
	.long	("$ip2state$??1PortableBinaryBitmap@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1PortableBinaryBitmap@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$6@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$10@?0???1PortableBinaryBitmap@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1PortableBinaryBitmap@@QEAA@XZ":
	.long	.Lfunc_begin4@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp44@IMGREL+1                # IP
	.long	1                               # ToState
	.long	.Ltmp46@IMGREL+1                # IP
	.long	0                               # ToState
	.long	.Ltmp47@IMGREL+1                # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1PortableBinaryBitmap@@QEAA@XZ"
                                        # -- End function
	.def	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.globl	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z" # -- Begin function ??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z
	.p2align	4, 0x90
"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z": # @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
.Lfunc_begin5:
.seh_proc "??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 16(%rbp)
	movl	%edx, %r14d
	movq	%rcx, %rsi
	movq	%rcx, -8(%rbp)
	movq	(%rcx), %rax
	movslq	4(%rax), %rax
	movq	72(%rcx,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB5_2
# %bb.1:
	movq	(%rcx), %rax
	callq	*8(%rax)
.LBB5_2:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rsi,%rax)
	je	.LBB5_4
# %bb.3:
	movb	$0, (%rbp)
	jmp	.LBB5_9
.LBB5_4:
	movq	80(%rsi,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB5_6
# %bb.5:
	cmpq	%rsi, %rcx
	je	.LBB5_6
# %bb.7:
.Ltmp48:
	callq	"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
.Ltmp49:
# %bb.8:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rsi,%rax)
	sete	(%rbp)
	jmp	.LBB5_9
.LBB5_6:
	movb	$1, (%rbp)
.LBB5_9:
	cmpb	$0, (%rbp)
	movq	%rsi, 8(%rbp)                   # 8-byte Spill
	je	.LBB5_10
# %bb.14:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movq	40(%rsi,%rax), %rcx
	leaq	-1(%rcx), %rdx
	xorl	%ebx, %ebx
	cmpq	$2, %rcx
	movl	$0, %r15d
	cmovgeq	%rdx, %r15
	movl	$448, %ecx                      # imm = 0x1C0
	andl	24(%rsi,%rax), %ecx
	cmpl	$64, %ecx
	jne	.LBB5_15
.LBB5_23:
	testl	%ebx, %ebx
	jne	.LBB5_29
# %bb.24:
	movq	8(%rbp), %rcx                   # 8-byte Reload
	movq	(%rcx), %rax
	movslq	4(%rax), %rax
	movq	72(%rcx,%rax), %rcx
	movq	64(%rcx), %rax
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	je	.LBB5_27
# %bb.25:
	movq	88(%rcx), %rbx
	movl	(%rbx), %edi
	testl	%edi, %edi
	jle	.LBB5_27
# %bb.26:
	decl	%edi
	movl	%edi, (%rbx)
	leaq	1(%rdx), %rcx
	movq	%rcx, (%rax)
	movb	%r14b, (%rdx)
	movzbl	%r14b, %eax
	jmp	.LBB5_28
.LBB5_10:
	xorl	%eax, %eax
	movq	%rax, -16(%rbp)                 # 8-byte Spill
.LBB5_11:                               # Block address taken
$ehgcr_5_11:
	movq	8(%rbp), %rsi                   # 8-byte Reload
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movq	$0, 40(%rsi,%rax)
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movq	-16(%rbp), %rdx                 # 8-byte Reload
	orl	16(%rsi,%rax), %edx
	xorl	%ecx, %ecx
	cmpq	$0, 72(%rsi,%rax)
	sete	%cl
	shll	$2, %ecx
	andl	$23, %edx
	orl	%ecx, %edx
	movl	%edx, 16(%rsi,%rax)
	andl	20(%rsi,%rax), %edx
	jne	.LBB5_12
# %bb.39:
	callq	"?uncaught_exception@std@@YA_NXZ"
	testb	%al, %al
	jne	.LBB5_41
# %bb.40:
	movq	-8(%rbp), %rcx
.Ltmp62:
	callq	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
.Ltmp63:
.LBB5_41:
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movslq	4(%rcx), %rcx
	movq	72(%rax,%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB5_43
# %bb.42:
	movq	(%rcx), %rax
.Ltmp64:
	callq	*16(%rax)
.Ltmp65:
.LBB5_43:
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB5_15:
	xorl	%ebx, %ebx
	jmp	.LBB5_16
	.p2align	4, 0x90
.LBB5_20:                               #   in Loop: Header=BB5_16 Depth=1
	decl	%esi
	movl	%esi, (%r8)
	leaq	1(%rdi), %rcx
	movq	%rcx, (%rbx)
	movb	%dl, (%rdi)
.LBB5_22:                               #   in Loop: Header=BB5_16 Depth=1
	xorl	%ebx, %ebx
	cmpl	$-1, %eax
	sete	%bl
	shll	$2, %ebx
	decq	%r15
.LBB5_16:                               # =>This Inner Loop Header: Depth=1
	testl	%ebx, %ebx
	jne	.LBB5_23
# %bb.17:                               #   in Loop: Header=BB5_16 Depth=1
	testq	%r15, %r15
	jle	.LBB5_23
# %bb.18:                               #   in Loop: Header=BB5_16 Depth=1
	movq	8(%rbp), %rdx                   # 8-byte Reload
	movq	(%rdx), %rax
	movslq	4(%rax), %rax
	movq	72(%rdx,%rax), %rcx
	movzbl	88(%rdx,%rax), %edx
	movzbl	%dl, %eax
	movq	64(%rcx), %rbx
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB5_21
# %bb.19:                               #   in Loop: Header=BB5_16 Depth=1
	movq	88(%rcx), %r8
	movl	(%r8), %esi
	testl	%esi, %esi
	jg	.LBB5_20
.LBB5_21:                               #   in Loop: Header=BB5_16 Depth=1
	movq	(%rcx), %rbx
.Ltmp50:
	movl	%eax, %edx
	callq	*24(%rbx)
.Ltmp51:
	jmp	.LBB5_22
.LBB5_27:
	movzbl	%r14b, %edx
	movq	(%rcx), %rax
.Ltmp52:
	callq	*24(%rax)
.Ltmp53:
.LBB5_28:
	xorl	%ebx, %ebx
	cmpl	$-1, %eax
	sete	%bl
	shll	$2, %ebx
	jmp	.LBB5_29
	.p2align	4, 0x90
.LBB5_33:                               #   in Loop: Header=BB5_29 Depth=1
	decl	%esi
	movl	%esi, (%r8)
	leaq	1(%rdi), %rcx
	movq	%rcx, (%rbx)
	movb	%dl, (%rdi)
.LBB5_35:                               #   in Loop: Header=BB5_29 Depth=1
	xorl	%ebx, %ebx
	cmpl	$-1, %eax
	sete	%bl
	shll	$2, %ebx
	decq	%r15
.LBB5_29:                               # =>This Inner Loop Header: Depth=1
	movq	%rbx, -16(%rbp)                 # 8-byte Spill
	testl	%ebx, %ebx
	jne	.LBB5_11
# %bb.30:                               #   in Loop: Header=BB5_29 Depth=1
	testq	%r15, %r15
	jle	.LBB5_11
# %bb.31:                               #   in Loop: Header=BB5_29 Depth=1
	movq	8(%rbp), %rdx                   # 8-byte Reload
	movq	(%rdx), %rax
	movslq	4(%rax), %rax
	movq	72(%rdx,%rax), %rcx
	movzbl	88(%rdx,%rax), %edx
	movzbl	%dl, %eax
	movq	64(%rcx), %rbx
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB5_34
# %bb.32:                               #   in Loop: Header=BB5_29 Depth=1
	movq	88(%rcx), %r8
	movl	(%r8), %esi
	testl	%esi, %esi
	jg	.LBB5_33
.LBB5_34:                               #   in Loop: Header=BB5_29 Depth=1
	movq	(%rcx), %rbx
.Ltmp54:
	movl	%eax, %edx
	callq	*24(%rbx)
.Ltmp55:
	jmp	.LBB5_35
.LBB5_12:
	testb	$2, %dl
	leaq	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"(%rip), %rax
	leaq	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"(%rip), %rcx
	cmoveq	%rax, %rcx
	testb	$4, %dl
	leaq	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"(%rip), %rsi
	cmoveq	%rcx, %rsi
	leaq	-48(%rbp), %rcx
	movl	$1, %edx
	callq	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	movups	-48(%rbp), %xmm0
	movaps	%xmm0, -32(%rbp)
.Ltmp58:
	leaq	-88(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	%rsi, %r8
	callq	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
.Ltmp59:
# %bb.13:
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, -88(%rbp)
.Ltmp60:
	leaq	"_TI5?AVfailure@ios_base@std@@"(%rip), %rdx
	leaq	-88(%rbp), %rcx
	callq	_CxxThrowException
.Ltmp61:
# %bb.38:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z")@IMGREL
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.seh_endproc
	.def	"?catch$36@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?catch$36@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA":
.seh_proc "?catch$36@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"
	.seh_handler __CxxFrameHandler3, @unwind, @except
.LBB5_36:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	8(%rbp), %rdx                   # 8-byte Reload
	movq	(%rdx), %rax
	movslq	4(%rax), %rcx
	addq	%rdx, %rcx
.Ltmp56:
	movl	$4, %edx
	movb	$1, %r8b
	callq	"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
.Ltmp57:
# %bb.37:
	xorl	%eax, %eax
	movq	%rax, -16(%rbp)                 # 8-byte Spill
	leaq	.LBB5_11(%rip), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CATCHRET
	.seh_handlerdata
	.long	("$cppxdata$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z")@IMGREL
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.seh_endproc
	.def	"?dtor$44@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$44@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA":
.seh_proc "?dtor$44@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"
.LBB5_44:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.seh_endproc
	.def	"?dtor$45@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$45@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA":
.seh_proc "?dtor$45@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"
.LBB5_45:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.seh_endproc
	.def	"?dtor$46@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$46@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA":
.seh_proc "?dtor$46@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"
.LBB5_46:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-8(%rbp), %rcx
	callq	"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.seh_endproc
	.def	"?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA":
.seh_proc "?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"
.LBB5_47:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-8(%rbp), %rcx
	callq	"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end5:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
	.p2align	2
"$cppxdata$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z":
	.long	429065506                       # MagicNumber
	.long	6                               # MaxState
	.long	("$stateUnwindMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z")@IMGREL # UnwindMap
	.long	1                               # NumTryBlocks
	.long	("$tryMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z")@IMGREL # TryBlockMap
	.long	8                               # IPMapEntries
	.long	("$ip2state$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z")@IMGREL # IPToStateXData
	.long	144                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z":
	.long	-1                              # ToState
	.long	"?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$44@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$45@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$46@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	0                               # Action
	.long	3                               # ToState
	.long	0                               # Action
"$tryMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z":
	.long	4                               # TryLow
	.long	4                               # TryHigh
	.long	5                               # CatchHigh
	.long	1                               # NumCatches
	.long	("$handlerMap$0$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z")@IMGREL # HandlerArray
"$handlerMap$0$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z":
	.long	64                              # Adjectives
	.long	0                               # Type
	.long	0                               # CatchObjOffset
	.long	"?catch$36@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"@IMGREL # Handler
	.long	104                             # ParentFrameOffset
"$ip2state$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z":
	.long	.Lfunc_begin5@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp48@IMGREL+1                # IP
	.long	0                               # ToState
	.long	.Ltmp62@IMGREL+1                # IP
	.long	2                               # ToState
	.long	.Ltmp64@IMGREL+1                # IP
	.long	1                               # ToState
	.long	.Ltmp50@IMGREL+1                # IP
	.long	4                               # ToState
	.long	.Ltmp58@IMGREL+1                # IP
	.long	3                               # ToState
	.long	.Ltmp61@IMGREL+1                # IP
	.long	-1                              # ToState
	.long	"?catch$36@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z@4HA"@IMGREL # IP
	.long	5                               # ToState
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@D@Z"
                                        # -- End function
	.def	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.globl	"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z" # -- Begin function ??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z
	.p2align	4, 0x90
"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z": # @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
.Lfunc_begin6:
.seh_proc "??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 16(%rbp)
	movq	%rdx, %r14
	movq	%rcx, %rsi
	movq	%rdx, %rcx
	callq	strlen
	movq	%rax, %r15
	movq	(%rsi), %rax
	movslq	4(%rax), %rcx
	movq	40(%rsi,%rcx), %rcx
	xorl	%edx, %edx
	movq	%rcx, %r13
	subq	%r15, %r13
	cmovleq	%rdx, %r13
	testq	%rcx, %rcx
	cmovleq	%rdx, %r13
	movq	%rsi, -16(%rbp)
	movslq	4(%rax), %rax
	movq	72(%rsi,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB6_2
# %bb.1:
	movq	(%rcx), %rax
	callq	*8(%rax)
.LBB6_2:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rsi,%rax)
	je	.LBB6_4
# %bb.3:
	movb	$0, -8(%rbp)
	cmpb	$0, -8(%rbp)
	jne	.LBB6_11
	jmp	.LBB6_10
.LBB6_4:
	movq	80(%rsi,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB6_6
# %bb.5:
	cmpq	%rsi, %rcx
	je	.LBB6_6
# %bb.7:
.Ltmp66:
	callq	"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
.Ltmp67:
# %bb.8:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rsi,%rax)
	sete	-8(%rbp)
	cmpb	$0, -8(%rbp)
	jne	.LBB6_11
.LBB6_10:
	movl	$4, %r12d
	jmp	.LBB6_38
.LBB6_6:
	movb	$1, -8(%rbp)
	cmpb	$0, -8(%rbp)
	je	.LBB6_10
.LBB6_11:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movl	$448, %ecx                      # imm = 0x1C0
	andl	24(%rsi,%rax), %ecx
	xorl	%r12d, %r12d
	movb	$1, %al
	cmpl	$64, %ecx
	movq	%rsi, (%rbp)                    # 8-byte Spill
	je	.LBB6_22
# %bb.12:
	testq	%r13, %r13
	jle	.LBB6_22
	.p2align	4, 0x90
.LBB6_13:                               # =>This Inner Loop Header: Depth=1
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movq	72(%rsi,%rax), %rcx
	movzbl	88(%rsi,%rax), %edx
	movzbl	%dl, %eax
	movq	64(%rcx), %rdi
	movq	(%rdi), %rsi
	testq	%rsi, %rsi
	je	.LBB6_16
# %bb.14:                               #   in Loop: Header=BB6_13 Depth=1
	movq	88(%rcx), %r8
	movl	(%r8), %ebx
	testl	%ebx, %ebx
	jle	.LBB6_16
# %bb.15:                               #   in Loop: Header=BB6_13 Depth=1
	decl	%ebx
	movl	%ebx, (%r8)
	leaq	1(%rsi), %rcx
	movq	%rcx, (%rdi)
	movb	%dl, (%rsi)
	jmp	.LBB6_17
	.p2align	4, 0x90
.LBB6_16:                               #   in Loop: Header=BB6_13 Depth=1
	movq	(%rcx), %rdx
	movq	24(%rdx), %rbx
	movl	$0, 12(%rbp)
.Ltmp68:
	movl	%eax, %edx
	callq	*%rbx
.Ltmp69:
.LBB6_17:                               #   in Loop: Header=BB6_13 Depth=1
	cmpl	$-1, %eax
	movq	(%rbp), %rsi                    # 8-byte Reload
	je	.LBB6_18
# %bb.19:                               #   in Loop: Header=BB6_13 Depth=1
	leaq	-1(%r13), %rcx
	cmpq	$1, %r13
	movq	%rcx, %r13
	jg	.LBB6_13
# %bb.20:
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	jmp	.LBB6_21
.LBB6_18:
	movl	$4, %r12d
.LBB6_21:
	cmpl	$-1, %eax
	setne	%al
.LBB6_22:
	testb	%al, %al
	je	.LBB6_25
# %bb.23:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movq	72(%rsi,%rax), %rcx
	movq	(%rcx), %rax
	movq	72(%rax), %rax
	movl	$0, 12(%rbp)
.Ltmp70:
	movq	%r14, %rdx
	movq	%r15, %r8
	callq	*%rax
.Ltmp71:
# %bb.24:
	xorl	%r12d, %r12d
	cmpq	%r15, %rax
	setne	%r12b
	shll	$2, %r12d
	movq	(%rbp), %rsi                    # 8-byte Reload
.LBB6_25:
	testl	%r12d, %r12d
	jne	.LBB6_37
# %bb.26:
	testq	%r13, %r13
	jle	.LBB6_37
	.p2align	4, 0x90
.LBB6_27:                               # =>This Inner Loop Header: Depth=1
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movq	72(%rsi,%rax), %rcx
	movzbl	88(%rsi,%rax), %edx
	movzbl	%dl, %eax
	movq	64(%rcx), %rsi
	movq	(%rsi), %rdi
	testq	%rdi, %rdi
	je	.LBB6_30
# %bb.28:                               #   in Loop: Header=BB6_27 Depth=1
	movq	88(%rcx), %r8
	movl	(%r8), %ebx
	testl	%ebx, %ebx
	jle	.LBB6_30
# %bb.29:                               #   in Loop: Header=BB6_27 Depth=1
	decl	%ebx
	movl	%ebx, (%r8)
	leaq	1(%rdi), %rcx
	movq	%rcx, (%rsi)
	movb	%dl, (%rdi)
	jmp	.LBB6_31
	.p2align	4, 0x90
.LBB6_30:                               #   in Loop: Header=BB6_27 Depth=1
	movq	(%rcx), %rdx
	movq	24(%rdx), %rbx
	movl	%r12d, 12(%rbp)
.Ltmp72:
	movl	%eax, %edx
	callq	*%rbx
.Ltmp73:
.LBB6_31:                               #   in Loop: Header=BB6_27 Depth=1
	cmpl	$-1, %eax
	je	.LBB6_32
# %bb.36:                               #   in Loop: Header=BB6_27 Depth=1
	leaq	-1(%r13), %rax
	cmpq	$1, %r13
	movq	%rax, %r13
	movq	(%rbp), %rsi                    # 8-byte Reload
	jg	.LBB6_27
	jmp	.LBB6_37
.LBB6_32:
	movl	$4, %r12d
	movq	(%rbp), %rsi                    # 8-byte Reload
.LBB6_37:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	movq	$0, 40(%rsi,%rax)
.LBB6_38:
	movq	(%rsi), %rax
	movslq	4(%rax), %rax
	orl	16(%rsi,%rax), %r12d
	xorl	%ecx, %ecx
	cmpq	$0, 72(%rsi,%rax)
	sete	%cl
	shll	$2, %ecx
	andl	$23, %r12d
	orl	%ecx, %r12d
	movl	%r12d, 16(%rsi,%rax)
	andl	20(%rsi,%rax), %r12d
	jne	.LBB6_39
# %bb.42:
	callq	"?uncaught_exception@std@@YA_NXZ"
	testb	%al, %al
	jne	.LBB6_44
# %bb.43:
	movq	-16(%rbp), %rcx
.Ltmp80:
	callq	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
.Ltmp81:
.LBB6_44:
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	movslq	4(%rcx), %rcx
	movq	72(%rax,%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB6_46
# %bb.45:
	movq	(%rcx), %rax
.Ltmp82:
	callq	*16(%rax)
.Ltmp83:
.LBB6_46:
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB6_39:
	testb	$2, %r12b
	leaq	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"(%rip), %rax
	leaq	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"(%rip), %rcx
	cmoveq	%rax, %rcx
	testb	$4, %r12b
	leaq	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"(%rip), %rsi
	cmoveq	%rcx, %rsi
	leaq	-48(%rbp), %rcx
	movl	$1, %edx
	callq	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	movups	-48(%rbp), %xmm0
	movaps	%xmm0, -32(%rbp)
.Ltmp76:
	leaq	-88(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	%rsi, %r8
	callq	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
.Ltmp77:
# %bb.40:
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, -88(%rbp)
.Ltmp78:
	leaq	"_TI5?AVfailure@ios_base@std@@"(%rip), %rdx
	leaq	-88(%rbp), %rcx
	callq	_CxxThrowException
.Ltmp79:
# %bb.41:
.LBB6_35:                               # Block address taken
$ehgcr_6_35:
	movl	12(%rbp), %r12d
	movq	(%rbp), %rsi                    # 8-byte Reload
	jmp	.LBB6_38
	.seh_handlerdata
	.long	("$cppxdata$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z")@IMGREL
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.seh_endproc
	.def	"?catch$33@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?catch$33@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA":
.seh_proc "?catch$33@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"
	.seh_handler __CxxFrameHandler3, @unwind, @except
.LBB6_33:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	(%rbp), %rdx                    # 8-byte Reload
	movq	(%rdx), %rax
	movslq	4(%rax), %rcx
	addq	%rdx, %rcx
.Ltmp74:
	movl	$4, %edx
	movb	$1, %r8b
	callq	"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
.Ltmp75:
# %bb.34:
	leaq	.LBB6_35(%rip), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CATCHRET
	.seh_handlerdata
	.long	("$cppxdata$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z")@IMGREL
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.seh_endproc
	.def	"?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA":
.seh_proc "?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"
.LBB6_47:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.seh_endproc
	.def	"?dtor$48@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$48@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA":
.seh_proc "?dtor$48@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"
.LBB6_48:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.seh_endproc
	.def	"?dtor$49@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$49@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA":
.seh_proc "?dtor$49@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"
.LBB6_49:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-16(%rbp), %rcx
	callq	"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.seh_endproc
	.def	"?dtor$50@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$50@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA":
.seh_proc "?dtor$50@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"
.LBB6_50:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-16(%rbp), %rcx
	callq	"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end6:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
	.p2align	2
"$cppxdata$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z":
	.long	429065506                       # MagicNumber
	.long	6                               # MaxState
	.long	("$stateUnwindMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z")@IMGREL # UnwindMap
	.long	1                               # NumTryBlocks
	.long	("$tryMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z")@IMGREL # TryBlockMap
	.long	8                               # IPMapEntries
	.long	("$ip2state$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z")@IMGREL # IPToStateXData
	.long	144                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z":
	.long	-1                              # ToState
	.long	"?dtor$50@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$47@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$48@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$49@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	0                               # Action
	.long	3                               # ToState
	.long	0                               # Action
"$tryMap$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z":
	.long	4                               # TryLow
	.long	4                               # TryHigh
	.long	5                               # CatchHigh
	.long	1                               # NumCatches
	.long	("$handlerMap$0$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z")@IMGREL # HandlerArray
"$handlerMap$0$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z":
	.long	64                              # Adjectives
	.long	0                               # Type
	.long	0                               # CatchObjOffset
	.long	"?catch$33@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"@IMGREL # Handler
	.long	120                             # ParentFrameOffset
"$ip2state$??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z":
	.long	.Lfunc_begin6@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp66@IMGREL+1                # IP
	.long	0                               # ToState
	.long	.Ltmp68@IMGREL+1                # IP
	.long	4                               # ToState
	.long	.Ltmp80@IMGREL+1                # IP
	.long	2                               # ToState
	.long	.Ltmp82@IMGREL+1                # IP
	.long	1                               # ToState
	.long	.Ltmp76@IMGREL+1                # IP
	.long	3                               # ToState
	.long	.Ltmp79@IMGREL+1                # IP
	.long	-1                              # ToState
	.long	"?catch$33@?0???$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z@4HA"@IMGREL # IP
	.long	5                               # ToState
	.section	.text,"xr",discard,"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"
                                        # -- End function
	.def	"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.globl	"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z" # -- Begin function ??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z
	.p2align	4, 0x90
"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z": # @"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
.Lfunc_begin7:
.seh_proc "??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$192, %rsp
	.seh_stackalloc 192
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 56(%rbp)
	movq	%rdx, %r14
	movq	%rcx, %rbx
	movq	%rcx, 32(%rbp)
	movq	(%rcx), %rax
	movslq	4(%rax), %rax
	movq	72(%rcx,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB7_2
# %bb.1:
	movq	(%rcx), %rax
	callq	*8(%rax)
.LBB7_2:
	movq	(%rbx), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rbx,%rax)
	je	.LBB7_4
# %bb.3:
	movb	$0, 40(%rbp)
	jmp	.LBB7_9
.LBB7_4:
	movq	80(%rbx,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB7_6
# %bb.5:
	cmpq	%rbx, %rcx
	je	.LBB7_6
# %bb.7:
.Ltmp84:
	callq	"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
.Ltmp85:
# %bb.8:
	movq	(%rbx), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rbx,%rax)
	sete	40(%rbp)
	jmp	.LBB7_9
.LBB7_6:
	movb	$1, 40(%rbp)
.LBB7_9:
	cmpb	$0, 40(%rbp)
	movq	%rbx, 24(%rbp)                  # 8-byte Spill
	je	.LBB7_10
# %bb.11:
	movq	(%rbx), %rax
	movslq	4(%rax), %rax
	movq	64(%rbx,%rax), %rax
	movq	8(%rax), %rcx
	movq	%rcx, -24(%rbp)
	movq	(%rcx), %rax
	callq	*8(%rax)
.Ltmp86:
	leaq	-32(%rbp), %rcx
	callq	"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
.Ltmp87:
# %bb.12:
	movq	%rax, %rdi
	movq	-24(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB7_15
# %bb.13:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB7_15
# %bb.14:
	movq	(%rax), %rsi
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rsi)
.LBB7_15:
	movq	(%rbx), %rax
	movslq	4(%rax), %rax
	leaq	(%rbx,%rax), %r9
	movzbl	88(%rbx,%rax), %ecx
	movq	72(%rbx,%rax), %rax
	movb	$0, 8(%rbp)
	movq	%rax, 16(%rbp)
	movq	(%rdi), %rax
	movq	48(%rax), %rax
.Ltmp88:
	movq	%r14, 40(%rsp)
	movb	%cl, 32(%rsp)
	leaq	-64(%rbp), %rdx
	leaq	8(%rbp), %r8
	movq	%rdi, %rcx
	callq	*%rax
.Ltmp89:
# %bb.16:
	movzbl	-64(%rbp), %eax
	shll	$2, %eax
	movl	%eax, 52(%rbp)                  # 4-byte Spill
	jmp	.LBB7_17
.LBB7_10:
	movl	$0, 52(%rbp)                    # 4-byte Folded Spill
.LBB7_17:                               # Block address taken
$ehgcr_7_17:
	movq	24(%rbp), %rsi                  # 8-byte Reload
	movq	(%rsi), %rax
	movslq	4(%rax), %rcx
	movl	16(%rsi,%rcx), %eax
	xorl	%edx, %edx
	cmpq	$0, 72(%rsi,%rcx)
	sete	%dl
	shll	$2, %edx
	andl	$23, %eax
	orl	52(%rbp), %eax                  # 4-byte Folded Reload
	orl	%edx, %eax
	movl	%eax, 16(%rsi,%rcx)
	andl	20(%rsi,%rcx), %eax
	jne	.LBB7_18
# %bb.27:
	callq	"?uncaught_exception@std@@YA_NXZ"
	testb	%al, %al
	jne	.LBB7_29
# %bb.28:
	movq	32(%rbp), %rcx
.Ltmp96:
	callq	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
.Ltmp97:
.LBB7_29:
	movq	32(%rbp), %rax
	movq	(%rax), %rcx
	movslq	4(%rcx), %rcx
	movq	72(%rax,%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB7_31
# %bb.30:
	movq	(%rcx), %rax
.Ltmp98:
	callq	*16(%rax)
.Ltmp99:
.LBB7_31:
	movq	%rsi, %rax
	addq	$192, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq
.LBB7_18:
	testb	$2, %al
	leaq	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"(%rip), %rcx
	leaq	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"(%rip), %rdx
	cmoveq	%rcx, %rdx
	testb	$4, %al
	leaq	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"(%rip), %rsi
	cmoveq	%rdx, %rsi
	leaq	-80(%rbp), %rcx
	movl	$1, %edx
	callq	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	movups	-80(%rbp), %xmm0
	movaps	%xmm0, -48(%rbp)
.Ltmp92:
	leaq	-32(%rbp), %rcx
	leaq	-48(%rbp), %rdx
	movq	%rsi, %r8
	callq	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
.Ltmp93:
# %bb.19:
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, -32(%rbp)
.Ltmp94:
	leaq	"_TI5?AVfailure@ios_base@std@@"(%rip), %rdx
	leaq	-32(%rbp), %rcx
	callq	_CxxThrowException
.Ltmp95:
# %bb.26:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z")@IMGREL
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_endproc
	.def	"?dtor$20@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$20@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA":
.seh_proc "?dtor$20@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"
.LBB7_20:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	-24(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB7_23
# %bb.21:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB7_23
# %bb.22:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB7_23:
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_endproc
	.def	"?catch$24@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?catch$24@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA":
.seh_proc "?catch$24@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"
	.seh_handler __CxxFrameHandler3, @unwind, @except
.LBB7_24:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	24(%rbp), %rdx                  # 8-byte Reload
	movq	(%rdx), %rax
	movslq	4(%rax), %rcx
	addq	%rdx, %rcx
.Ltmp90:
	movl	$4, %edx
	movb	$1, %r8b
	callq	"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
.Ltmp91:
# %bb.25:
	movl	$0, 52(%rbp)                    # 4-byte Folded Spill
	leaq	.LBB7_17(%rip), %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq                                    # CATCHRET
	.seh_handlerdata
	.long	("$cppxdata$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z")@IMGREL
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_endproc
	.def	"?dtor$32@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$32@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA":
.seh_proc "?dtor$32@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"
.LBB7_32:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_endproc
	.def	"?dtor$33@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$33@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA":
.seh_proc "?dtor$33@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"
.LBB7_33:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_endproc
	.def	"?dtor$34@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$34@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA":
.seh_proc "?dtor$34@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"
.LBB7_34:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	32(%rbp), %rcx
	callq	"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_endproc
	.def	"?dtor$35@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$35@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA":
.seh_proc "?dtor$35@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"
.LBB7_35:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	32(%rbp), %rcx
	callq	"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end7:
	.seh_handlerdata
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
	.p2align	2
"$cppxdata$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z":
	.long	429065506                       # MagicNumber
	.long	7                               # MaxState
	.long	("$stateUnwindMap$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z")@IMGREL # UnwindMap
	.long	1                               # NumTryBlocks
	.long	("$tryMap$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z")@IMGREL # TryBlockMap
	.long	11                              # IPMapEntries
	.long	("$ip2state$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z")@IMGREL # IPToStateXData
	.long	184                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z":
	.long	-1                              # ToState
	.long	"?dtor$35@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$32@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$33@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$34@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	"?dtor$20@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	0                               # Action
	.long	3                               # ToState
	.long	0                               # Action
"$tryMap$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z":
	.long	5                               # TryLow
	.long	5                               # TryHigh
	.long	6                               # CatchHigh
	.long	1                               # NumCatches
	.long	("$handlerMap$0$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z")@IMGREL # HandlerArray
"$handlerMap$0$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z":
	.long	64                              # Adjectives
	.long	0                               # Type
	.long	0                               # CatchObjOffset
	.long	"?catch$24@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"@IMGREL # Handler
	.long	104                             # ParentFrameOffset
"$ip2state$??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z":
	.long	.Lfunc_begin7@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp84@IMGREL+1                # IP
	.long	0                               # ToState
	.long	.Ltmp85@IMGREL+1                # IP
	.long	-1                              # ToState
	.long	.Ltmp86@IMGREL+1                # IP
	.long	4                               # ToState
	.long	.Ltmp87@IMGREL+1                # IP
	.long	-1                              # ToState
	.long	.Ltmp88@IMGREL+1                # IP
	.long	5                               # ToState
	.long	.Ltmp96@IMGREL+1                # IP
	.long	2                               # ToState
	.long	.Ltmp98@IMGREL+1                # IP
	.long	1                               # ToState
	.long	.Ltmp92@IMGREL+1                # IP
	.long	3                               # ToState
	.long	.Ltmp95@IMGREL+1                # IP
	.long	-1                              # ToState
	.long	"?catch$24@?0???6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z@4HA"@IMGREL # IP
	.long	6                               # ToState
	.section	.text,"xr",discard,"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@_K@Z"
                                        # -- End function
	.def	"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
	.globl	"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ" # -- Begin function ??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ
	.p2align	4, 0x90
"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ": # @"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
.Lfunc_begin8:
.seh_proc "??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB8_8
# %bb.1:
	movq	16(%rsi), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB8_7
# %bb.2:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB8_3
# %bb.6:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB8_7:
	callq	"??3@YAXPEAX_K@Z"
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	movq	$0, 16(%rsi)
.LBB8_8:
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
.LBB8_3:
.Ltmp100:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp101:
# %bb.4:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$5@?0???1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$5@?0???1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$5@?0???1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ@4HA"
.LBB8_5:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end8:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$5@?0???1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ":
	.long	.Lfunc_begin8@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp100@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp101@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1?$vector@DV?$allocator@D@std@@@std@@QEAA@XZ"
                                        # -- End function
	.def	"?_Throw_bad_array_new_length@std@@YAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Throw_bad_array_new_length@std@@YAXXZ"
	.globl	"?_Throw_bad_array_new_length@std@@YAXXZ" # -- Begin function ?_Throw_bad_array_new_length@std@@YAXXZ
	.p2align	4, 0x90
"?_Throw_bad_array_new_length@std@@YAXXZ": # @"?_Throw_bad_array_new_length@std@@YAXXZ"
.seh_proc "?_Throw_bad_array_new_length@std@@YAXXZ"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	xorps	%xmm0, %xmm0
	movups	%xmm0, 40(%rsp)
	leaq	"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@"(%rip), %rax
	movq	%rax, 40(%rsp)
	leaq	"??_7bad_array_new_length@std@@6B@"(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	"_TI3?AVbad_array_new_length@std@@"(%rip), %rdx
	leaq	32(%rsp), %rcx
	callq	_CxxThrowException
	int3
	.seh_endproc
                                        # -- End function
	.def	"??0bad_array_new_length@std@@QEAA@AEBV01@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"
	.globl	"??0bad_array_new_length@std@@QEAA@AEBV01@@Z" # -- Begin function ??0bad_array_new_length@std@@QEAA@AEBV01@@Z
	.p2align	4, 0x90
"??0bad_array_new_length@std@@QEAA@AEBV01@@Z": # @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"
.Lfunc_begin9:
.seh_proc "??0bad_array_new_length@std@@QEAA@AEBV01@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdx), %rcx
.Ltmp102:
	movq	%rax, %rdx
	callq	__std_exception_copy
.Ltmp103:
# %bb.1:
	leaq	"??_7bad_array_new_length@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0bad_array_new_length@std@@QEAA@AEBV01@@Z")@IMGREL
	.section	.text,"xr",discard,"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0bad_array_new_length@std@@QEAA@AEBV01@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0bad_array_new_length@std@@QEAA@AEBV01@@Z@4HA":
.seh_proc "?dtor$2@?0???0bad_array_new_length@std@@QEAA@AEBV01@@Z@4HA"
.LBB10_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end9:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"
	.p2align	2
"$cppxdata$??0bad_array_new_length@std@@QEAA@AEBV01@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0bad_array_new_length@std@@QEAA@AEBV01@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0bad_array_new_length@std@@QEAA@AEBV01@@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0bad_array_new_length@std@@QEAA@AEBV01@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0bad_array_new_length@std@@QEAA@AEBV01@@Z@4HA"@IMGREL # Action
"$ip2state$??0bad_array_new_length@std@@QEAA@AEBV01@@Z":
	.long	.Lfunc_begin9@IMGREL            # IP
	.long	-1                              # ToState
	.long	.Ltmp102@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp103@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"
                                        # -- End function
	.def	"??0bad_alloc@std@@QEAA@AEBV01@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0bad_alloc@std@@QEAA@AEBV01@@Z"
	.globl	"??0bad_alloc@std@@QEAA@AEBV01@@Z" # -- Begin function ??0bad_alloc@std@@QEAA@AEBV01@@Z
	.p2align	4, 0x90
"??0bad_alloc@std@@QEAA@AEBV01@@Z":     # @"??0bad_alloc@std@@QEAA@AEBV01@@Z"
.Lfunc_begin10:
.seh_proc "??0bad_alloc@std@@QEAA@AEBV01@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdx), %rcx
.Ltmp104:
	movq	%rax, %rdx
	callq	__std_exception_copy
.Ltmp105:
# %bb.1:
	leaq	"??_7bad_alloc@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0bad_alloc@std@@QEAA@AEBV01@@Z")@IMGREL
	.section	.text,"xr",discard,"??0bad_alloc@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0bad_alloc@std@@QEAA@AEBV01@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0bad_alloc@std@@QEAA@AEBV01@@Z@4HA":
.seh_proc "?dtor$2@?0???0bad_alloc@std@@QEAA@AEBV01@@Z@4HA"
.LBB11_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end10:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0bad_alloc@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0bad_alloc@std@@QEAA@AEBV01@@Z"
	.p2align	2
"$cppxdata$??0bad_alloc@std@@QEAA@AEBV01@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0bad_alloc@std@@QEAA@AEBV01@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0bad_alloc@std@@QEAA@AEBV01@@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0bad_alloc@std@@QEAA@AEBV01@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0bad_alloc@std@@QEAA@AEBV01@@Z@4HA"@IMGREL # Action
"$ip2state$??0bad_alloc@std@@QEAA@AEBV01@@Z":
	.long	.Lfunc_begin10@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp104@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp105@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0bad_alloc@std@@QEAA@AEBV01@@Z"
                                        # -- End function
	.def	"??0exception@std@@QEAA@AEBV01@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0exception@std@@QEAA@AEBV01@@Z"
	.globl	"??0exception@std@@QEAA@AEBV01@@Z" # -- Begin function ??0exception@std@@QEAA@AEBV01@@Z
	.p2align	4, 0x90
"??0exception@std@@QEAA@AEBV01@@Z":     # @"??0exception@std@@QEAA@AEBV01@@Z"
.Lfunc_begin11:
.seh_proc "??0exception@std@@QEAA@AEBV01@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdx), %rcx
.Ltmp106:
	movq	%rax, %rdx
	callq	__std_exception_copy
.Ltmp107:
# %bb.1:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0exception@std@@QEAA@AEBV01@@Z")@IMGREL
	.section	.text,"xr",discard,"??0exception@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0exception@std@@QEAA@AEBV01@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0exception@std@@QEAA@AEBV01@@Z@4HA":
.seh_proc "?dtor$2@?0???0exception@std@@QEAA@AEBV01@@Z@4HA"
.LBB12_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end11:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0exception@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0exception@std@@QEAA@AEBV01@@Z"
	.p2align	2
"$cppxdata$??0exception@std@@QEAA@AEBV01@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0exception@std@@QEAA@AEBV01@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0exception@std@@QEAA@AEBV01@@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0exception@std@@QEAA@AEBV01@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0exception@std@@QEAA@AEBV01@@Z@4HA"@IMGREL # Action
"$ip2state$??0exception@std@@QEAA@AEBV01@@Z":
	.long	.Lfunc_begin11@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp106@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp107@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0exception@std@@QEAA@AEBV01@@Z"
                                        # -- End function
	.def	"??_Gbad_array_new_length@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
	.globl	"??_Gbad_array_new_length@std@@UEAAPEAXI@Z" # -- Begin function ??_Gbad_array_new_length@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gbad_array_new_length@std@@UEAAPEAXI@Z": # @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
.Lfunc_begin12:
.seh_proc "??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp108:
	callq	__std_exception_destroy
.Ltmp109:
# %bb.1:
	testl	%edi, %edi
	je	.LBB13_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB13_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_Gbad_array_new_length@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_Gbad_array_new_length@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_Gbad_array_new_length@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_Gbad_array_new_length@std@@UEAAPEAXI@Z@4HA"
.LBB13_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end12:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_Gbad_array_new_length@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_Gbad_array_new_length@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_Gbad_array_new_length@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_Gbad_array_new_length@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_Gbad_array_new_length@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_Gbad_array_new_length@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin12@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp108@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp109@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"?what@exception@std@@UEBAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?what@exception@std@@UEBAPEBDXZ"
	.globl	"?what@exception@std@@UEBAPEBDXZ" # -- Begin function ?what@exception@std@@UEBAPEBDXZ
	.p2align	4, 0x90
"?what@exception@std@@UEBAPEBDXZ":      # @"?what@exception@std@@UEBAPEBDXZ"
# %bb.0:
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	leaq	"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@"(%rip), %rax
	cmovneq	%rcx, %rax
	retq
                                        # -- End function
	.def	"??_Gbad_alloc@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gbad_alloc@std@@UEAAPEAXI@Z"
	.globl	"??_Gbad_alloc@std@@UEAAPEAXI@Z" # -- Begin function ??_Gbad_alloc@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gbad_alloc@std@@UEAAPEAXI@Z":       # @"??_Gbad_alloc@std@@UEAAPEAXI@Z"
.Lfunc_begin13:
.seh_proc "??_Gbad_alloc@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp110:
	callq	__std_exception_destroy
.Ltmp111:
# %bb.1:
	testl	%edi, %edi
	je	.LBB15_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB15_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_Gbad_alloc@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_Gbad_alloc@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_Gbad_alloc@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_Gbad_alloc@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_Gbad_alloc@std@@UEAAPEAXI@Z@4HA"
.LBB15_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end13:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_Gbad_alloc@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_Gbad_alloc@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_Gbad_alloc@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_Gbad_alloc@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_Gbad_alloc@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_Gbad_alloc@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_Gbad_alloc@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_Gbad_alloc@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin13@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp110@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp111@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_Gbad_alloc@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"??_Gexception@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gexception@std@@UEAAPEAXI@Z"
	.globl	"??_Gexception@std@@UEAAPEAXI@Z" # -- Begin function ??_Gexception@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gexception@std@@UEAAPEAXI@Z":       # @"??_Gexception@std@@UEAAPEAXI@Z"
.Lfunc_begin14:
.seh_proc "??_Gexception@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp112:
	callq	__std_exception_destroy
.Ltmp113:
# %bb.1:
	testl	%edi, %edi
	je	.LBB16_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB16_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_Gexception@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_Gexception@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_Gexception@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_Gexception@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_Gexception@std@@UEAAPEAXI@Z@4HA"
.LBB16_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end14:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_Gexception@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_Gexception@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_Gexception@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_Gexception@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_Gexception@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_Gexception@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_Gexception@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_Gexception@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin14@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp112@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp113@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_Gexception@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
	.globl	"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z" # -- Begin function ?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z
	.p2align	4, 0x90
"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z": # @"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
.seh_proc "?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$96, %rsp
	.seh_stackalloc 96
	.seh_endprologue
	orl	16(%rcx), %edx
	xorl	%eax, %eax
	cmpq	$0, 72(%rcx)
	sete	%al
	shll	$2, %eax
	andl	$23, %edx
	orl	%eax, %edx
	movl	%edx, 16(%rcx)
	andl	20(%rcx), %edx
	jne	.LBB17_1
# %bb.3:
	addq	$96, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
.LBB17_1:
	testb	%r8b, %r8b
	je	.LBB17_2
# %bb.4:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	callq	_CxxThrowException
.LBB17_2:
	testb	$2, %dl
	leaq	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"(%rip), %rax
	leaq	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"(%rip), %rcx
	cmoveq	%rax, %rcx
	testb	$4, %dl
	leaq	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"(%rip), %rsi
	cmoveq	%rcx, %rsi
	leaq	40(%rsp), %rdi
	movq	%rdi, %rcx
	movl	$1, %edx
	callq	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	leaq	56(%rsp), %rbx
	movq	%rbx, %rcx
	movq	%rsi, %rdx
	movq	%rdi, %r8
	callq	"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z"
	leaq	"_TI5?AVfailure@ios_base@std@@"(%rip), %rdx
	movq	%rbx, %rcx
	callq	_CxxThrowException
	int3
	.seh_endproc
                                        # -- End function
	.def	"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.globl	"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ" # -- Begin function ??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ
	.p2align	4, 0x90
"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ": # @"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
.Lfunc_begin15:
.seh_proc "??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	callq	"?uncaught_exception@std@@YA_NXZ"
	testb	%al, %al
	jne	.LBB18_2
# %bb.1:
	movq	(%rsi), %rcx
.Ltmp114:
	callq	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
.Ltmp115:
.LBB18_2:
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	movslq	4(%rcx), %rcx
	movq	72(%rax,%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB18_4
# %bb.3:
	movq	(%rcx), %rax
.Ltmp116:
	callq	*16(%rax)
.Ltmp117:
.LBB18_4:
	nop
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$5@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$5@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$5@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA"
.LBB18_5:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$6@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$6@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$6@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA"
.LBB18_6:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end15:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	4                               # IPMapEntries
	.long	("$ip2state$??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$6@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$5@?0???1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ":
	.long	.Lfunc_begin15@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp114@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp116@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp117@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
                                        # -- End function
	.def	"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.globl	"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ" # -- Begin function ?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ
	.p2align	4, 0x90
"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ": # @"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
.Lfunc_begin16:
.seh_proc "?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$160, %rsp
	.seh_stackalloc 160
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 24(%rbp)
	movq	%rcx, %rdi
	movq	(%rcx), %rax
	movslq	4(%rax), %rcx
	movq	72(%rdi,%rcx), %rsi
	testq	%rsi, %rsi
	je	.LBB19_24
# %bb.1:
	movq	%rdi, (%rbp)
	movslq	4(%rax), %rax
	movq	72(%rdi,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB19_3
# %bb.2:
	movq	(%rcx), %rax
	callq	*8(%rax)
.LBB19_3:
	movq	(%rdi), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rdi,%rax)
	je	.LBB19_5
# %bb.4:
	movb	$0, 8(%rbp)
	cmpb	$0, 8(%rbp)
	jne	.LBB19_11
	jmp	.LBB19_20
.LBB19_5:
	movq	80(%rdi,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB19_7
# %bb.6:
	cmpq	%rdi, %rcx
	je	.LBB19_7
# %bb.8:
.Ltmp118:
	callq	"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
.Ltmp119:
# %bb.9:
	movq	(%rdi), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rdi,%rax)
	sete	8(%rbp)
	cmpb	$0, 8(%rbp)
	jne	.LBB19_11
	jmp	.LBB19_20
.LBB19_7:
	movb	$1, 8(%rbp)
	cmpb	$0, 8(%rbp)
	je	.LBB19_20
.LBB19_11:
	movq	%rdi, -8(%rbp)                  # 8-byte Spill
	movq	(%rsi), %rax
.Ltmp120:
	movq	%rsi, %rcx
	callq	*104(%rax)
.Ltmp121:
# %bb.12:
	xorl	%ecx, %ecx
	cmpl	$-1, %eax
	sete	%cl
	shll	$2, %ecx
	movl	%ecx, 20(%rbp)                  # 4-byte Spill
.LBB19_13:                              # Block address taken
$ehgcr_19_13:
	movq	-8(%rbp), %rdi                  # 8-byte Reload
	movq	(%rdi), %rax
	movslq	4(%rax), %rcx
	movl	16(%rdi,%rcx), %eax
	xorl	%edx, %edx
	cmpq	$0, 72(%rdi,%rcx)
	sete	%dl
	shll	$2, %edx
	orl	20(%rbp), %edx                  # 4-byte Folded Reload
	andl	$23, %eax
	orl	%edx, %eax
	movl	%eax, 16(%rdi,%rcx)
	andl	20(%rdi,%rcx), %eax
	jne	.LBB19_14
.LBB19_20:
	callq	"?uncaught_exception@std@@YA_NXZ"
	testb	%al, %al
	jne	.LBB19_22
# %bb.21:
	movq	(%rbp), %rcx
.Ltmp128:
	callq	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
.Ltmp129:
.LBB19_22:
	movq	(%rbp), %rax
	movq	(%rax), %rcx
	movslq	4(%rcx), %rcx
	movq	72(%rax,%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB19_24
# %bb.23:
	movq	(%rcx), %rax
.Ltmp130:
	callq	*16(%rax)
.Ltmp131:
.LBB19_24:
	movq	%rdi, %rax
	addq	$160, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
.LBB19_14:
	testb	$2, %al
	leaq	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"(%rip), %rcx
	leaq	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"(%rip), %rdx
	cmoveq	%rcx, %rdx
	testb	$4, %al
	leaq	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"(%rip), %rsi
	cmoveq	%rdx, %rsi
	leaq	-48(%rbp), %rcx
	movl	$1, %edx
	callq	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	movups	-48(%rbp), %xmm0
	movaps	%xmm0, -32(%rbp)
.Ltmp124:
	leaq	-88(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	%rsi, %r8
	callq	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
.Ltmp125:
# %bb.15:
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, -88(%rbp)
.Ltmp126:
	leaq	"_TI5?AVfailure@ios_base@std@@"(%rip), %rdx
	leaq	-88(%rbp), %rcx
	callq	_CxxThrowException
.Ltmp127:
# %bb.16:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ")@IMGREL
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.seh_endproc
	.def	"?catch$17@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?catch$17@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA":
.seh_proc "?catch$17@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"
	.seh_handler __CxxFrameHandler3, @unwind, @except
.LBB19_17:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	movq	(%rdx), %rax
	movslq	4(%rax), %rcx
	addq	%rdx, %rcx
.Ltmp122:
	movl	$4, %edx
	movb	$1, %r8b
	callq	"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
.Ltmp123:
# %bb.18:
	movl	$0, 20(%rbp)                    # 4-byte Folded Spill
	leaq	.LBB19_13(%rip), %rax
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CATCHRET
	.seh_handlerdata
	.long	("$cppxdata$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ")@IMGREL
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.seh_endproc
	.def	"?dtor$19@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$19@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA":
.seh_proc "?dtor$19@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"
.LBB19_19:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	%rbp, %rcx
	callq	"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.seh_endproc
	.def	"?dtor$25@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$25@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA":
.seh_proc "?dtor$25@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"
.LBB19_25:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.seh_endproc
	.def	"?dtor$26@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$26@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA":
.seh_proc "?dtor$26@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"
.LBB19_26:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.seh_endproc
	.def	"?dtor$27@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$27@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA":
.seh_proc "?dtor$27@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"
.LBB19_27:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	%rbp, %rcx
	callq	"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end16:
	.seh_handlerdata
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
	.p2align	2
"$cppxdata$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ":
	.long	429065506                       # MagicNumber
	.long	6                               # MaxState
	.long	("$stateUnwindMap$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ")@IMGREL # UnwindMap
	.long	1                               # NumTryBlocks
	.long	("$tryMap$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ")@IMGREL # TryBlockMap
	.long	8                               # IPMapEntries
	.long	("$ip2state$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ")@IMGREL # IPToStateXData
	.long	152                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ":
	.long	-1                              # ToState
	.long	"?dtor$27@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$19@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"@IMGREL # Action
	.long	1                               # ToState
	.long	0                               # Action
	.long	1                               # ToState
	.long	0                               # Action
	.long	-1                              # ToState
	.long	"?dtor$25@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$26@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"@IMGREL # Action
"$tryMap$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ":
	.long	2                               # TryLow
	.long	2                               # TryHigh
	.long	3                               # CatchHigh
	.long	1                               # NumCatches
	.long	("$handlerMap$0$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ")@IMGREL # HandlerArray
"$handlerMap$0$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ":
	.long	64                              # Adjectives
	.long	0                               # Type
	.long	0                               # CatchObjOffset
	.long	"?catch$17@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"@IMGREL # Handler
	.long	72                              # ParentFrameOffset
"$ip2state$?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ":
	.long	.Lfunc_begin16@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp118@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp120@IMGREL+1               # IP
	.long	2                               # ToState
	.long	.Ltmp128@IMGREL+1               # IP
	.long	5                               # ToState
	.long	.Ltmp130@IMGREL+1               # IP
	.long	4                               # ToState
	.long	.Ltmp124@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp127@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	"?catch$17@?0??flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ@4HA"@IMGREL # IP
	.long	3                               # ToState
	.section	.text,"xr",discard,"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
                                        # -- End function
	.def	"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.globl	"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ" # -- Begin function ??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ
	.p2align	4, 0x90
"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ": # @"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
.Lfunc_begin17:
.seh_proc "??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	(%rcx), %rax
	movq	(%rax), %rcx
	movslq	4(%rcx), %rcx
	movq	72(%rax,%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB20_2
# %bb.1:
	movq	(%rcx), %rax
.Ltmp132:
	callq	*16(%rax)
.Ltmp133:
.LBB20_2:
	nop
	addq	$48, %rsp
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$3@?0???1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$3@?0???1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$3@?0???1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA"
.LBB20_3:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end17:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$3@?0???1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ":
	.long	.Lfunc_begin17@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp132@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp133@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
                                        # -- End function
	.def	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	.globl	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z" # -- Begin function ?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z
	.p2align	4, 0x90
"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z": # @"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
.seh_proc "?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	%edx, %edi
	movq	%rcx, %rsi
	movl	"?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA"(%rip), %eax
	movl	_tls_index(%rip), %ecx
	movq	%gs:88, %rdx
	movq	(%rdx,%rcx,8), %rcx
	cmpl	_Init_thread_epoch@SECREL32(%rcx), %eax
	jg	.LBB21_1
.LBB21_3:
	movl	%edi, (%rsi)
	leaq	"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@A"(%rip), %rax
	movq	%rax, 8(%rsi)
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rdi
	popq	%rsi
	retq
.LBB21_1:
	leaq	"?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA"(%rip), %rcx
	callq	_Init_thread_header
	cmpl	$-1, "?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA"(%rip)
	jne	.LBB21_3
# %bb.2:
	leaq	"??__F_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@YAXXZ"(%rip), %rcx
	callq	atexit
	leaq	"?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA"(%rip), %rcx
	callq	_Init_thread_footer
	jmp	.LBB21_3
	.seh_endproc
                                        # -- End function
	.def	"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z"
	.globl	"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z" # -- Begin function ??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z
	.p2align	4, 0x90
"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z": # @"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z"
.seh_proc "??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$48, %rsp
	.seh_stackalloc 48
	.seh_endprologue
	movq	%rdx, %rax
	movq	%rcx, %rsi
	movups	(%r8), %xmm0
	movaps	%xmm0, 32(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rax, %r8
	callq	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"??0failure@ios_base@std@@QEAA@AEBV012@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0failure@ios_base@std@@QEAA@AEBV012@@Z"
	.globl	"??0failure@ios_base@std@@QEAA@AEBV012@@Z" # -- Begin function ??0failure@ios_base@std@@QEAA@AEBV012@@Z
	.p2align	4, 0x90
"??0failure@ios_base@std@@QEAA@AEBV012@@Z": # @"??0failure@ios_base@std@@QEAA@AEBV012@@Z"
.Lfunc_begin18:
.seh_proc "??0failure@ios_base@std@@QEAA@AEBV012@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rdx
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdi), %rcx
.Ltmp134:
	callq	__std_exception_copy
.Ltmp135:
# %bb.1:
	leaq	"??_7_System_error@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movups	24(%rdi), %xmm0
	movups	%xmm0, 24(%rsi)
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0failure@ios_base@std@@QEAA@AEBV012@@Z")@IMGREL
	.section	.text,"xr",discard,"??0failure@ios_base@std@@QEAA@AEBV012@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0failure@ios_base@std@@QEAA@AEBV012@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0failure@ios_base@std@@QEAA@AEBV012@@Z@4HA":
.seh_proc "?dtor$2@?0???0failure@ios_base@std@@QEAA@AEBV012@@Z@4HA"
.LBB23_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end18:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0failure@ios_base@std@@QEAA@AEBV012@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0failure@ios_base@std@@QEAA@AEBV012@@Z"
	.p2align	2
"$cppxdata$??0failure@ios_base@std@@QEAA@AEBV012@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0failure@ios_base@std@@QEAA@AEBV012@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0failure@ios_base@std@@QEAA@AEBV012@@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0failure@ios_base@std@@QEAA@AEBV012@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0failure@ios_base@std@@QEAA@AEBV012@@Z@4HA"@IMGREL # Action
"$ip2state$??0failure@ios_base@std@@QEAA@AEBV012@@Z":
	.long	.Lfunc_begin18@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp134@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp135@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0failure@ios_base@std@@QEAA@AEBV012@@Z"
                                        # -- End function
	.def	"??0system_error@std@@QEAA@AEBV01@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@AEBV01@@Z"
	.globl	"??0system_error@std@@QEAA@AEBV01@@Z" # -- Begin function ??0system_error@std@@QEAA@AEBV01@@Z
	.p2align	4, 0x90
"??0system_error@std@@QEAA@AEBV01@@Z":  # @"??0system_error@std@@QEAA@AEBV01@@Z"
.Lfunc_begin19:
.seh_proc "??0system_error@std@@QEAA@AEBV01@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rdx
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdi), %rcx
.Ltmp136:
	callq	__std_exception_copy
.Ltmp137:
# %bb.1:
	leaq	"??_7_System_error@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movups	24(%rdi), %xmm0
	movups	%xmm0, 24(%rsi)
	leaq	"??_7system_error@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0system_error@std@@QEAA@AEBV01@@Z")@IMGREL
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0system_error@std@@QEAA@AEBV01@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0system_error@std@@QEAA@AEBV01@@Z@4HA":
.seh_proc "?dtor$2@?0???0system_error@std@@QEAA@AEBV01@@Z@4HA"
.LBB24_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end19:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0system_error@std@@QEAA@AEBV01@@Z"
	.p2align	2
"$cppxdata$??0system_error@std@@QEAA@AEBV01@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0system_error@std@@QEAA@AEBV01@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0system_error@std@@QEAA@AEBV01@@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0system_error@std@@QEAA@AEBV01@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0system_error@std@@QEAA@AEBV01@@Z@4HA"@IMGREL # Action
"$ip2state$??0system_error@std@@QEAA@AEBV01@@Z":
	.long	.Lfunc_begin19@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp136@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp137@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@AEBV01@@Z"
                                        # -- End function
	.def	"??0_System_error@std@@QEAA@AEBV01@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0_System_error@std@@QEAA@AEBV01@@Z"
	.globl	"??0_System_error@std@@QEAA@AEBV01@@Z" # -- Begin function ??0_System_error@std@@QEAA@AEBV01@@Z
	.p2align	4, 0x90
"??0_System_error@std@@QEAA@AEBV01@@Z": # @"??0_System_error@std@@QEAA@AEBV01@@Z"
.Lfunc_begin20:
.seh_proc "??0_System_error@std@@QEAA@AEBV01@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rdx
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdi), %rcx
.Ltmp138:
	callq	__std_exception_copy
.Ltmp139:
# %bb.1:
	leaq	"??_7_System_error@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movups	24(%rdi), %xmm0
	movups	%xmm0, 24(%rsi)
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0_System_error@std@@QEAA@AEBV01@@Z")@IMGREL
	.section	.text,"xr",discard,"??0_System_error@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0_System_error@std@@QEAA@AEBV01@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0_System_error@std@@QEAA@AEBV01@@Z@4HA":
.seh_proc "?dtor$2@?0???0_System_error@std@@QEAA@AEBV01@@Z@4HA"
.LBB25_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end20:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0_System_error@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0_System_error@std@@QEAA@AEBV01@@Z"
	.p2align	2
"$cppxdata$??0_System_error@std@@QEAA@AEBV01@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0_System_error@std@@QEAA@AEBV01@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0_System_error@std@@QEAA@AEBV01@@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0_System_error@std@@QEAA@AEBV01@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0_System_error@std@@QEAA@AEBV01@@Z@4HA"@IMGREL # Action
"$ip2state$??0_System_error@std@@QEAA@AEBV01@@Z":
	.long	.Lfunc_begin20@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp138@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp139@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0_System_error@std@@QEAA@AEBV01@@Z"
                                        # -- End function
	.def	"??0runtime_error@std@@QEAA@AEBV01@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0runtime_error@std@@QEAA@AEBV01@@Z"
	.globl	"??0runtime_error@std@@QEAA@AEBV01@@Z" # -- Begin function ??0runtime_error@std@@QEAA@AEBV01@@Z
	.p2align	4, 0x90
"??0runtime_error@std@@QEAA@AEBV01@@Z": # @"??0runtime_error@std@@QEAA@AEBV01@@Z"
.Lfunc_begin21:
.seh_proc "??0runtime_error@std@@QEAA@AEBV01@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdx), %rcx
.Ltmp140:
	movq	%rax, %rdx
	callq	__std_exception_copy
.Ltmp141:
# %bb.1:
	leaq	"??_7runtime_error@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0runtime_error@std@@QEAA@AEBV01@@Z")@IMGREL
	.section	.text,"xr",discard,"??0runtime_error@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0runtime_error@std@@QEAA@AEBV01@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0runtime_error@std@@QEAA@AEBV01@@Z@4HA":
.seh_proc "?dtor$2@?0???0runtime_error@std@@QEAA@AEBV01@@Z@4HA"
.LBB26_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end21:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0runtime_error@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0runtime_error@std@@QEAA@AEBV01@@Z"
	.p2align	2
"$cppxdata$??0runtime_error@std@@QEAA@AEBV01@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0runtime_error@std@@QEAA@AEBV01@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0runtime_error@std@@QEAA@AEBV01@@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0runtime_error@std@@QEAA@AEBV01@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0runtime_error@std@@QEAA@AEBV01@@Z@4HA"@IMGREL # Action
"$ip2state$??0runtime_error@std@@QEAA@AEBV01@@Z":
	.long	.Lfunc_begin21@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp140@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp141@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0runtime_error@std@@QEAA@AEBV01@@Z"
                                        # -- End function
	.def	"??__F_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@YAXXZ";
	.scl	3;
	.type	32;
	.endef
	.text
	.p2align	4, 0x90                         # -- Begin function ??__F_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@YAXXZ
"??__F_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@YAXXZ": # @"??__F_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@YAXXZ"
# %bb.0:
	retq
                                        # -- End function
	.def	"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z"
	.globl	"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z" # -- Begin function ??_G_Iostream_error_category2@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z": # @"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z"
.seh_proc "??_G_Iostream_error_category2@std@@UEAAPEAXI@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rcx, %rsi
	testl	%edx, %edx
	je	.LBB28_2
# %bb.1:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB28_2:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?name@_Iostream_error_category2@std@@UEBAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?name@_Iostream_error_category2@std@@UEBAPEBDXZ"
	.globl	"?name@_Iostream_error_category2@std@@UEBAPEBDXZ" # -- Begin function ?name@_Iostream_error_category2@std@@UEBAPEBDXZ
	.p2align	4, 0x90
"?name@_Iostream_error_category2@std@@UEBAPEBDXZ": # @"?name@_Iostream_error_category2@std@@UEBAPEBDXZ"
# %bb.0:
	leaq	"??_C@_08LLGCOLLL@iostream?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z"
	.globl	"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z" # -- Begin function ?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z
	.p2align	4, 0x90
"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z": # @"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z"
.seh_proc "?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, %rsi
	cmpl	$1, %r8d
	jne	.LBB30_2
# %bb.1:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsi)
	movups	%xmm0, (%rsi)
	movq	$15, 24(%rsi)
	movl	$32, %ecx
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rdi
	movq	%rax, (%rsi)
	movq	$21, 16(%rsi)
	movq	$31, 24(%rsi)
	movaps	"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB"(%rip), %xmm0
	movups	%xmm0, (%rax)
	movabsq	$8245935278387129697, %rax      # imm = 0x726F727265206D61
	movq	%rax, 13(%rdi)
	addq	$21, %rdi
	jmp	.LBB30_10
.LBB30_2:
	movl	%r8d, %ecx
	callq	"?_Syserror_map@std@@YAPEBDH@Z"
	movq	%rax, %r14
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	movups	%xmm0, 16(%rsi)
	movq	%rax, %rcx
	callq	strlen
	testq	%rax, %rax
	js	.LBB30_11
# %bb.3:
	movq	%rax, %rdi
	cmpq	$15, %rax
	ja	.LBB30_5
# %bb.4:
	movq	%rdi, 16(%rsi)
	movq	$15, 24(%rsi)
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rsi, %rdi
	jmp	.LBB30_10
.LBB30_5:
	movq	$15, 24(%rsi)
	movq	%rdi, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %r15      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %r15
	leaq	1(%r15), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB30_8
# %bb.6:
	cmpq	$-39, %rcx
	jae	.LBB30_12
# %bb.7:
	leaq	40(%r15), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rbx
	andq	$-32, %rbx
	movq	%rax, -8(%rbx)
	jmp	.LBB30_9
.LBB30_8:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rbx
.LBB30_9:
	movq	%rbx, (%rsi)
	movq	%rdi, 16(%rsi)
	movq	%r15, 24(%rsi)
	movq	%rbx, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rbx, %rdi
.LBB30_10:
	movb	$0, (%rdi)
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
.LBB30_11:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB30_12:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
	int3
	.seh_endproc
                                        # -- End function
	.def	"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z"
	.globl	"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z" # -- Begin function ?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z
	.p2align	4, 0x90
"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z": # @"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z"
# %bb.0:
	movq	%rdx, %rax
	movl	%r8d, (%rdx)
	movq	%rcx, 8(%rdx)
	retq
                                        # -- End function
	.def	"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z"
	.globl	"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z" # -- Begin function ?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z
	.p2align	4, 0x90
"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z": # @"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z"
# %bb.0:
	movq	8(%rdx), %rax
	movq	8(%rcx), %rcx
	cmpq	8(%rax), %rcx
	sete	%cl
	cmpl	%r8d, (%rdx)
	sete	%al
	andb	%cl, %al
	retq
                                        # -- End function
	.def	"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z"
	.globl	"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z" # -- Begin function ?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z
	.p2align	4, 0x90
"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z": # @"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z"
.seh_proc "?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$48, %rsp
	.seh_stackalloc 48
	.seh_endprologue
	movq	%r8, %rsi
	movl	%edx, %r8d
	movq	(%rcx), %rax
	leaq	32(%rsp), %rdx
	callq	*24(%rax)
	movq	40(%rsp), %rax
	movq	8(%rsi), %rcx
	movq	8(%rax), %rax
	cmpq	8(%rcx), %rax
	sete	%cl
	movl	32(%rsp), %eax
	cmpl	(%rsi), %eax
	sete	%al
	andb	%cl, %al
	addq	$48, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?_Xlen_string@std@@YAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Xlen_string@std@@YAXXZ"
	.globl	"?_Xlen_string@std@@YAXXZ"      # -- Begin function ?_Xlen_string@std@@YAXXZ
	.p2align	4, 0x90
"?_Xlen_string@std@@YAXXZ":             # @"?_Xlen_string@std@@YAXXZ"
.seh_proc "?_Xlen_string@std@@YAXXZ"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	leaq	"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@"(%rip), %rcx
	callq	"?_Xlength_error@std@@YAXPEBD@Z"
	int3
	.seh_endproc
                                        # -- End function
	.def	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
	.globl	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z" # -- Begin function ??0system_error@std@@QEAA@Verror_code@1@PEBD@Z
	.p2align	4, 0x90
"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z": # @"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
.Lfunc_begin22:
.seh_proc "??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$96, %rsp
	.seh_stackalloc 96
	leaq	96(%rsp), %rbp
	.seh_setframe %rbp, 96
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	%r8, %r12
	movq	%rdx, %r14
	movq	%rcx, %r15
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	%xmm0, -48(%rbp)
	movq	%r8, %rcx
	callq	strlen
	testq	%rax, %rax
	js	.LBB35_19
# %bb.1:
	movq	%rax, %rbx
	cmpq	$15, %rax
	ja	.LBB35_3
# %bb.2:
	movq	%rbx, -32(%rbp)
	movq	$15, -24(%rbp)
	leaq	-48(%rbp), %rcx
	movq	%r12, %rdx
	movq	%rbx, %r8
	callq	memcpy
	addq	%rbp, %rbx
	addq	$-48, %rbx
	jmp	.LBB35_8
.LBB35_3:
	movq	$15, -24(%rbp)
	movq	%rbx, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %rdi      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %rdi
	leaq	1(%rdi), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB35_6
# %bb.4:
	cmpq	$-39, %rcx
	jae	.LBB35_20
# %bb.5:
	leaq	40(%rdi), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rsi
	andq	$-32, %rsi
	movq	%rax, -8(%rsi)
	jmp	.LBB35_7
.LBB35_6:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rsi
.LBB35_7:
	movq	%rsi, -48(%rbp)
	movq	%rbx, -32(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rsi, %rcx
	movq	%r12, %rdx
	movq	%rbx, %r8
	callq	memcpy
	addq	%rsi, %rbx
.LBB35_8:
	movb	$0, (%rbx)
	movups	(%r14), %xmm0
	movaps	%xmm0, -64(%rbp)
.Ltmp142:
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %r8
	movq	%r15, %rcx
	callq	"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
.Ltmp143:
# %bb.9:
	movq	-24(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB35_17
# %bb.10:
	movq	-48(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB35_16
# %bb.11:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB35_12
# %bb.15:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB35_16:
	callq	"??3@YAXPEAX_K@Z"
.LBB35_17:
	leaq	"??_7system_error@std@@6B@"(%rip), %rax
	movq	%rax, (%r15)
	movq	%r15, %rax
	addq	$96, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB35_19:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB35_20:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB35_12:
.Ltmp144:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp145:
# %bb.13:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??0system_error@std@@QEAA@Verror_code@1@PEBD@Z")@IMGREL
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
	.seh_endproc
	.def	"?dtor$14@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$14@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA":
.seh_proc "?dtor$14@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA"
.LBB35_14:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	96(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
	.seh_endproc
	.def	"?dtor$18@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$18@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA":
.seh_proc "?dtor$18@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA"
.LBB35_18:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	96(%rdx), %rbp
	.seh_endprologue
	leaq	-48(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end22:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
	.p2align	2
"$cppxdata$??0system_error@std@@QEAA@Verror_code@1@PEBD@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$??0system_error@std@@QEAA@Verror_code@1@PEBD@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	5                               # IPMapEntries
	.long	("$ip2state$??0system_error@std@@QEAA@Verror_code@1@PEBD@Z")@IMGREL # IPToStateXData
	.long	88                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0system_error@std@@QEAA@Verror_code@1@PEBD@Z":
	.long	-1                              # ToState
	.long	"?dtor$14@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$18@?0???0system_error@std@@QEAA@Verror_code@1@PEBD@Z@4HA"@IMGREL # Action
"$ip2state$??0system_error@std@@QEAA@Verror_code@1@PEBD@Z":
	.long	.Lfunc_begin22@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp142@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp143@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp144@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp145@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
                                        # -- End function
	.def	"??_Gfailure@ios_base@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
	.globl	"??_Gfailure@ios_base@std@@UEAAPEAXI@Z" # -- Begin function ??_Gfailure@ios_base@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gfailure@ios_base@std@@UEAAPEAXI@Z": # @"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
.Lfunc_begin23:
.seh_proc "??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp146:
	callq	__std_exception_destroy
.Ltmp147:
# %bb.1:
	testl	%edi, %edi
	je	.LBB36_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB36_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_Gfailure@ios_base@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_Gfailure@ios_base@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_Gfailure@ios_base@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_Gfailure@ios_base@std@@UEAAPEAXI@Z@4HA"
.LBB36_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end23:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_Gfailure@ios_base@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_Gfailure@ios_base@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_Gfailure@ios_base@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_Gfailure@ios_base@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_Gfailure@ios_base@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_Gfailure@ios_base@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin23@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp146@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp147@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
	.globl	"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z" # -- Begin function ??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z
	.p2align	4, 0x90
"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z": # @"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
.Lfunc_begin24:
.seh_proc "??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$136, %rsp
	.seh_stackalloc 136
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%r8, %rbx
	movq	%rdx, %r14
	movq	%rcx, %rsi
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	%xmm0, -16(%rbp)
	movq	16(%r8), %rdi
	cmpq	$16, 24(%r8)
	jb	.LBB37_2
# %bb.1:
	movq	(%rbx), %rbx
.LBB37_2:
	testq	%rdi, %rdi
	js	.LBB37_24
# %bb.3:
	cmpq	$15, %rdi
	ja	.LBB37_5
# %bb.4:
	movq	%rdi, -16(%rbp)
	movq	$15, -8(%rbp)
	movups	(%rbx), %xmm0
	movaps	%xmm0, -32(%rbp)
	jmp	.LBB37_12
.LBB37_5:
	movq	$15, -8(%rbp)
	movq	%rdi, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %r15      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %r15
	leaq	1(%r15), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB37_8
# %bb.6:
	cmpq	$-39, %rcx
	jae	.LBB37_25
# %bb.7:
	leaq	40(%r15), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rcx
	andq	$-32, %rcx
	movq	%rax, -8(%rcx)
	jmp	.LBB37_11
.LBB37_8:
	testq	%rcx, %rcx
	je	.LBB37_9
# %bb.10:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rcx
	jmp	.LBB37_11
.LBB37_9:
	xorl	%ecx, %ecx
.LBB37_11:
	movq	%rcx, -32(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%r15, -8(%rbp)
	incq	%rdi
	movq	%rbx, %rdx
	movq	%rdi, %r8
	callq	memcpy
.LBB37_12:
	movups	(%r14), %xmm0
	movaps	%xmm0, -96(%rbp)
	leaq	-80(%rbp), %rdi
	leaq	-96(%rbp), %rdx
	leaq	-32(%rbp), %r8
	movq	%rdi, %rcx
	callq	"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	cmpq	$16, -56(%rbp)
	jb	.LBB37_14
# %bb.13:
	movq	-80(%rbp), %rdi
.LBB37_14:
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	leaq	8(%rsi), %rdx
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rsi)
	movq	%rdi, -48(%rbp)
	movb	$1, -40(%rbp)
.Ltmp148:
	leaq	-48(%rbp), %rcx
	callq	__std_exception_copy
.Ltmp149:
# %bb.15:
	leaq	"??_7runtime_error@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	-56(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB37_23
# %bb.16:
	movq	-80(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB37_22
# %bb.17:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB37_18
# %bb.21:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB37_22:
	callq	"??3@YAXPEAX_K@Z"
.LBB37_23:
	leaq	"??_7_System_error@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movups	(%r14), %xmm0
	movups	%xmm0, 24(%rsi)
	movq	%rsi, %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB37_24:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB37_25:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB37_18:
.Ltmp150:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp151:
# %bb.19:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z")@IMGREL
	.section	.text,"xr",discard,"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
	.seh_endproc
	.def	"?dtor$20@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$20@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA":
.seh_proc "?dtor$20@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA"
.LBB37_20:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
	.seh_endproc
	.def	"?dtor$26@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$26@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA":
.seh_proc "?dtor$26@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA"
.LBB37_26:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end24:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
	.p2align	2
"$cppxdata$??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	5                               # IPMapEntries
	.long	("$ip2state$??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z")@IMGREL # IPToStateXData
	.long	128                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z":
	.long	-1                              # ToState
	.long	"?dtor$26@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$20@?0???0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z@4HA"@IMGREL # Action
"$ip2state$??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z":
	.long	.Lfunc_begin24@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp148@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp149@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp150@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp151@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"
                                        # -- End function
	.def	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	.globl	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ" # -- Begin function ??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ
	.p2align	4, 0x90
"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ": # @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
.Lfunc_begin25:
.seh_proc "??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	movq	24(%rcx), %rax
	cmpq	$16, %rax
	jb	.LBB38_8
# %bb.1:
	movq	(%rsi), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB38_7
# %bb.2:
	movq	-8(%rcx), %r8
	addq	$-8, %rcx
	subq	%r8, %rcx
	cmpq	$32, %rcx
	jae	.LBB38_3
# %bb.6:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%r8, %rcx
.LBB38_7:
	callq	"??3@YAXPEAX_K@Z"
.LBB38_8:
	movq	$0, 16(%rsi)
	movq	$15, 24(%rsi)
	movb	$0, (%rsi)
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
.LBB38_3:
.Ltmp152:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp153:
# %bb.4:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$5@?0???1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$5@?0???1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$5@?0???1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ@4HA"
.LBB38_5:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end25:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$5@?0???1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ":
	.long	.Lfunc_begin25@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp152@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp153@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
                                        # -- End function
	.def	"??_Gsystem_error@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gsystem_error@std@@UEAAPEAXI@Z"
	.globl	"??_Gsystem_error@std@@UEAAPEAXI@Z" # -- Begin function ??_Gsystem_error@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gsystem_error@std@@UEAAPEAXI@Z":    # @"??_Gsystem_error@std@@UEAAPEAXI@Z"
.Lfunc_begin26:
.seh_proc "??_Gsystem_error@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp154:
	callq	__std_exception_destroy
.Ltmp155:
# %bb.1:
	testl	%edi, %edi
	je	.LBB39_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB39_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_Gsystem_error@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_Gsystem_error@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_Gsystem_error@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_Gsystem_error@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_Gsystem_error@std@@UEAAPEAXI@Z@4HA"
.LBB39_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end26:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_Gsystem_error@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_Gsystem_error@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_Gsystem_error@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_Gsystem_error@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_Gsystem_error@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_Gsystem_error@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_Gsystem_error@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_Gsystem_error@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin26@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp154@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp155@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_Gsystem_error@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	.globl	"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z" # -- Begin function ?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z
	.p2align	4, 0x90
"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z": # @"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
.Lfunc_begin27:
.seh_proc "?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$88, %rsp
	.seh_stackalloc 88
	leaq	80(%rsp), %rbp
	.seh_setframe %rbp, 80
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rdx, %rdi
	movq	%rcx, %r14
	movq	%r8, -8(%rbp)                   # 8-byte Spill
	movq	16(%r8), %rax
	testq	%rax, %rax
	je	.LBB40_6
# %bb.1:
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	movq	24(%rcx), %rbx
	movq	%rbx, %rdx
	subq	%rax, %rdx
	cmpq	$2, %rdx
	jae	.LBB40_2
# %bb.5:
.Ltmp156:
	movq	$2, 32(%rsp)
	leaq	"??_C@_02LMMGGCAJ@?3?5?$AA@"(%rip), %r9
	movl	$2, %edx
	callq	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
.Ltmp157:
	jmp	.LBB40_6
.LBB40_2:
	leaq	2(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	%rcx, %rdx
	cmpq	$16, %rbx
	jb	.LBB40_4
# %bb.3:
	movq	(%rcx), %rdx
.LBB40_4:
	movw	$8250, (%rdx,%rax)              # imm = 0x203A
	movb	$0, 2(%rdx,%rax)
.LBB40_6:
	movq	8(%rdi), %rcx
	movl	(%rdi), %r8d
	movq	(%rcx), %rax
.Ltmp158:
	leaq	-40(%rbp), %rdi
	movq	%rdi, %rdx
	callq	*16(%rax)
.Ltmp159:
# %bb.7:
	movq	-24(%rbp), %r8
	cmpq	$16, -16(%rbp)
	jb	.LBB40_9
# %bb.8:
	movq	-40(%rbp), %rdi
.LBB40_9:
	movq	-8(%rbp), %rsi                  # 8-byte Reload
	movq	16(%rsi), %rcx
	movq	24(%rsi), %rax
	movq	%rax, %rdx
	subq	%rcx, %rdx
	cmpq	%r8, %rdx
	jae	.LBB40_10
# %bb.13:
.Ltmp160:
	movq	%r8, 32(%rsp)
	movq	%rsi, %rcx
	movq	%r8, %rdx
	movq	%rdi, %r9
	callq	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
.Ltmp161:
	jmp	.LBB40_14
.LBB40_10:
	leaq	(%rcx,%r8), %r15
	movq	%r15, 16(%rsi)
	movq	%rsi, %rbx
	cmpq	$16, %rax
	jb	.LBB40_12
# %bb.11:
	movq	(%rsi), %rbx
.LBB40_12:
	addq	%rbx, %rcx
	movq	%rdi, %rdx
	callq	memmove
	movb	$0, (%rbx,%r15)
.LBB40_14:
	movq	-16(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB40_22
# %bb.15:
	movq	-40(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB40_21
# %bb.16:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB40_17
# %bb.20:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB40_21:
	callq	"??3@YAXPEAX_K@Z"
.LBB40_22:
	movq	-8(%rbp), %rax                  # 8-byte Reload
	movups	(%rax), %xmm0
	movups	16(%rax), %xmm1
	movups	%xmm1, 16(%r14)
	movups	%xmm0, (%r14)
	movq	$0, 16(%rax)
	movq	$15, 24(%rax)
	movb	$0, (%rax)
	movq	%r14, %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB40_17:
.Ltmp162:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp163:
# %bb.18:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z")@IMGREL
	.section	.text,"xr",discard,"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	.seh_endproc
	.def	"?dtor$19@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$19@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA":
.seh_proc "?dtor$19@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA"
.LBB40_19:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	.seh_endproc
	.def	"?dtor$23@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$23@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA":
.seh_proc "?dtor$23@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA"
.LBB40_23:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	leaq	-40(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	.seh_endproc
	.def	"?dtor$24@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$24@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA":
.seh_proc "?dtor$24@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA"
.LBB40_24:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end27:
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
	.p2align	2
"$cppxdata$?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z":
	.long	429065506                       # MagicNumber
	.long	3                               # MaxState
	.long	("$stateUnwindMap$?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	6                               # IPMapEntries
	.long	("$ip2state$?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z")@IMGREL # IPToStateXData
	.long	80                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z":
	.long	-1                              # ToState
	.long	"?dtor$19@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$24@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA"@IMGREL # Action
	.long	1                               # ToState
	.long	"?dtor$23@?0??_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z@4HA"@IMGREL # Action
"$ip2state$?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z":
	.long	.Lfunc_begin27@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp156@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp160@IMGREL+1               # IP
	.long	2                               # ToState
	.long	.Ltmp161@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp162@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp163@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"
                                        # -- End function
	.def	"??_G_System_error@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_G_System_error@std@@UEAAPEAXI@Z"
	.globl	"??_G_System_error@std@@UEAAPEAXI@Z" # -- Begin function ??_G_System_error@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_G_System_error@std@@UEAAPEAXI@Z":   # @"??_G_System_error@std@@UEAAPEAXI@Z"
.Lfunc_begin28:
.seh_proc "??_G_System_error@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp164:
	callq	__std_exception_destroy
.Ltmp165:
# %bb.1:
	testl	%edi, %edi
	je	.LBB41_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB41_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_G_System_error@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_G_System_error@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_G_System_error@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_G_System_error@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_G_System_error@std@@UEAAPEAXI@Z@4HA"
.LBB41_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end28:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_G_System_error@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_G_System_error@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_G_System_error@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_G_System_error@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_G_System_error@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_G_System_error@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_G_System_error@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_G_System_error@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin28@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp164@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp165@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_G_System_error@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
	.globl	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z" # -- Begin function ??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z
	.p2align	4, 0x90
"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z": # @"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
.Lfunc_begin29:
.seh_proc "??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	16(%rcx), %rdi
	movabsq	$9223372036854775807, %r14      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rdi, %rax
	xorq	%r14, %rax
	cmpq	%rdx, %rax
	jb	.LBB42_20
# %bb.1:
	movq	%rdx, %rsi
	movq	%rcx, %r15
	addq	%rdi, %rsi
	movq	24(%rcx), %r13
	movq	%rsi, %rax
	orq	$15, %rax
	js	.LBB42_4
# %bb.2:
	movq	%r13, %rcx
	shrq	%rcx
	movabsq	$9223372036854775807, %r14      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rcx, %rdx
	xorq	%r14, %rdx
	cmpq	%r13, %rdx
	jb	.LBB42_4
# %bb.3:
	addq	%r13, %rcx
	cmpq	%rcx, %rax
	cmovaq	%rax, %rcx
	movq	%rcx, %r14
.LBB42_4:
	leaq	1(%r14), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB42_7
# %bb.5:
	cmpq	$-39, %rcx
	jae	.LBB42_21
# %bb.6:
	movq	%r9, %r12
	leaq	40(%r14), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rbx
	andq	$-32, %rbx
	movq	%rax, -8(%rbx)
	jmp	.LBB42_10
.LBB42_7:
	movq	%r9, %r12
	testq	%rcx, %rcx
	je	.LBB42_8
# %bb.9:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rbx
	jmp	.LBB42_10
.LBB42_8:
	xorl	%ebx, %ebx
.LBB42_10:
	movq	%rsi, 16(%r15)
	movq	%r14, 24(%r15)
	cmpq	$16, %r13
	jb	.LBB42_18
# %bb.11:
	movq	(%r15), %rsi
	movq	%rbx, %rcx
	movq	%rsi, %rdx
	movq	%rdi, %r8
	callq	memcpy
	leaq	(%rbx,%rdi), %rcx
	movq	%r12, %rdx
	movq	112(%rbp), %r14
	movq	%r14, %r8
	callq	memcpy
	addq	%r14, %rdi
	movb	$0, (%rbx,%rdi)
	leaq	1(%r13), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB42_17
# %bb.12:
	movq	-8(%rsi), %rax
	addq	$-8, %rsi
	subq	%rax, %rsi
	cmpq	$32, %rsi
	jae	.LBB42_13
# %bb.16:
	addq	$40, %r13
	movq	%r13, %rdx
	movq	%rax, %rsi
.LBB42_17:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX_K@Z"
	jmp	.LBB42_19
.LBB42_18:
	movq	%rbx, %rcx
	movq	%r15, %rdx
	movq	%rdi, %r8
	callq	memcpy
	leaq	(%rbx,%rdi), %rcx
	movq	%r12, %rdx
	movq	112(%rbp), %rsi
	movq	%rsi, %r8
	callq	memcpy
	addq	%rsi, %rdi
	movb	$0, (%rbx,%rdi)
.LBB42_19:
	movq	%rbx, (%r15)
	movq	%r15, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB42_20:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB42_21:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB42_13:
.Ltmp166:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp167:
# %bb.14:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
	.seh_endproc
	.def	"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z@4HA":
.seh_proc "?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z@4HA"
.LBB42_15:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end29:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
	.p2align	2
"$cppxdata$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z":
	.long	-1                              # ToState
	.long	"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z@4HA"@IMGREL # Action
"$ip2state$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z":
	.long	.Lfunc_begin29@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp166@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp167@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@QEBD0@Z@PEBD_K@Z"
                                        # -- End function
	.def	"??_Gruntime_error@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gruntime_error@std@@UEAAPEAXI@Z"
	.globl	"??_Gruntime_error@std@@UEAAPEAXI@Z" # -- Begin function ??_Gruntime_error@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gruntime_error@std@@UEAAPEAXI@Z":   # @"??_Gruntime_error@std@@UEAAPEAXI@Z"
.Lfunc_begin30:
.seh_proc "??_Gruntime_error@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp168:
	callq	__std_exception_destroy
.Ltmp169:
# %bb.1:
	testl	%edi, %edi
	je	.LBB43_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB43_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_Gruntime_error@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_Gruntime_error@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_Gruntime_error@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_Gruntime_error@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_Gruntime_error@std@@UEAAPEAXI@Z@4HA"
.LBB43_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end30:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_Gruntime_error@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_Gruntime_error@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_Gruntime_error@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_Gruntime_error@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_Gruntime_error@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_Gruntime_error@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_Gruntime_error@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_Gruntime_error@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin30@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp168@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp169@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_Gruntime_error@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
	.globl	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ" # -- Begin function ?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ
	.p2align	4, 0x90
"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ": # @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
.Lfunc_begin31:
.seh_proc "?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$120, %rsp
	.seh_stackalloc 120
	leaq	112(%rsp), %rbp
	.seh_setframe %rbp, 112
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	(%rcx), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rcx,%rax)
	jne	.LBB44_9
# %bb.1:
	movq	%rcx, %rsi
	testb	$2, 24(%rcx,%rax)
	je	.LBB44_9
# %bb.2:
	movq	72(%rsi,%rax), %rcx
	movq	(%rcx), %rax
.Ltmp170:
	callq	*104(%rax)
.Ltmp171:
# %bb.3:
	cmpl	$-1, %eax
	jne	.LBB44_9
# %bb.4:
	movq	(%rsi), %rax
	movslq	4(%rax), %rcx
	movl	16(%rsi,%rcx), %eax
	andl	$19, %eax
	orl	$4, %eax
	movl	%eax, 16(%rsi,%rcx)
	movl	20(%rsi,%rcx), %ecx
	andl	%ecx, %eax
	jne	.LBB44_5
.LBB44_9:                               # Block address taken
$ehgcr_44_9:
	addq	$120, %rsp
	popq	%rsi
	popq	%rbp
	retq
.LBB44_5:
	testb	$2, %al
	leaq	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"(%rip), %rax
	leaq	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"(%rip), %rdx
	cmoveq	%rax, %rdx
	testb	$4, %cl
	leaq	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"(%rip), %rsi
	cmoveq	%rdx, %rsi
	leaq	-32(%rbp), %rcx
	movl	$1, %edx
	callq	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	movups	-32(%rbp), %xmm0
	movaps	%xmm0, -16(%rbp)
.Ltmp172:
	leaq	-72(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	movq	%rsi, %r8
	callq	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
.Ltmp173:
# %bb.6:
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, -72(%rbp)
.Ltmp174:
	leaq	"_TI5?AVfailure@ios_base@std@@"(%rip), %rdx
	leaq	-72(%rbp), %rcx
	callq	_CxxThrowException
.Ltmp175:
# %bb.7:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ")@IMGREL
	.section	.text,"xr",discard,"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
	.seh_endproc
	.def	"?catch$8@?0??_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?catch$8@?0??_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ@4HA":
.seh_proc "?catch$8@?0??_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ@4HA"
	.seh_handler __CxxFrameHandler3, @unwind, @except
.LBB44_8:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	112(%rdx), %rbp
	.seh_endprologue
	leaq	.LBB44_9(%rip), %rax
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq                                    # CATCHRET
.Lfunc_end31:
	.seh_handlerdata
	.long	("$cppxdata$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ")@IMGREL
	.section	.text,"xr",discard,"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
	.p2align	2
"$cppxdata$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ")@IMGREL # UnwindMap
	.long	1                               # NumTryBlocks
	.long	("$tryMap$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ")@IMGREL # TryBlockMap
	.long	4                               # IPMapEntries
	.long	("$ip2state$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ")@IMGREL # IPToStateXData
	.long	112                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ":
	.long	-1                              # ToState
	.long	0                               # Action
	.long	-1                              # ToState
	.long	0                               # Action
"$tryMap$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ":
	.long	0                               # TryLow
	.long	0                               # TryHigh
	.long	1                               # CatchHigh
	.long	1                               # NumCatches
	.long	("$handlerMap$0$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ")@IMGREL # HandlerArray
"$handlerMap$0$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ":
	.long	64                              # Adjectives
	.long	0                               # Type
	.long	0                               # CatchObjOffset
	.long	"?catch$8@?0??_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ@4HA"@IMGREL # Handler
	.long	72                              # ParentFrameOffset
"$ip2state$?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ":
	.long	.Lfunc_begin31@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp170@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp175@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	"?catch$8@?0??_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ@4HA"@IMGREL # IP
	.long	1                               # ToState
	.section	.text,"xr",discard,"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
                                        # -- End function
	.def	"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
	.globl	"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z" # -- Begin function ??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z
	.p2align	4, 0x90
"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z": # @"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
.Lfunc_begin32:
.seh_proc "??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$160, %rsp
	.seh_stackalloc 160
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 24(%rbp)
	movq	%rcx, %rsi
	leaq	16(%rbp), %rcx
	xorl	%edx, %edx
	callq	"??0_Lockit@std@@QEAA@H@Z"
	movq	"?_Psave@?$_Facetptr@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@2PEBVfacet@locale@2@EB"(%rip), %r14
	cmpq	$0, "?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"(%rip)
	jne	.LBB45_4
# %bb.1:
	leaq	-96(%rbp), %rcx
	xorl	%edx, %edx
	callq	"??0_Lockit@std@@QEAA@H@Z"
	cmpq	$0, "?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"(%rip)
	jne	.LBB45_3
# %bb.2:
	movslq	"?_Id_cnt@id@locale@std@@0HA"(%rip), %rax
	incq	%rax
	movl	%eax, "?_Id_cnt@id@locale@std@@0HA"(%rip)
	movq	%rax, "?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"(%rip)
.LBB45_3:
	leaq	-96(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
.LBB45_4:
	movq	"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"(%rip), %rbx
	movq	8(%rsi), %rax
	cmpq	%rbx, 24(%rax)
	jbe	.LBB45_5
# %bb.6:
	movq	16(%rax), %rcx
	movq	(%rcx,%rbx,8), %rdi
	testq	%rdi, %rdi
	jne	.LBB45_13
	jmp	.LBB45_8
.LBB45_5:
	xorl	%edi, %edi
	testq	%rdi, %rdi
	jne	.LBB45_13
.LBB45_8:
	cmpb	$0, 36(%rax)
	je	.LBB45_13
# %bb.9:
.Ltmp176:
	callq	"?_Getgloballocale@locale@std@@CAPEAV_Locimp@12@XZ"
.Ltmp177:
# %bb.10:
	cmpq	%rbx, 24(%rax)
	jbe	.LBB45_11
# %bb.12:
	movq	16(%rax), %rax
	movq	(%rax,%rbx,8), %rdi
.LBB45_13:
	testq	%rdi, %rdi
	jne	.LBB45_22
.LBB45_14:
	movq	%r14, %rdi
	testq	%r14, %r14
	jne	.LBB45_22
# %bb.15:
.Ltmp178:
	movl	$16, %ecx
	callq	"??2@YAPEAX_K@Z"
.Ltmp179:
# %bb.16:
	movq	8(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rax, 8(%rbp)                   # 8-byte Spill
	je	.LBB45_17
# %bb.18:
	movq	40(%rdx), %rax
	addq	$48, %rdx
	testq	%rax, %rax
	cmovneq	%rax, %rdx
	jmp	.LBB45_19
.LBB45_11:
	xorl	%edi, %edi
	testq	%rdi, %rdi
	jne	.LBB45_22
	jmp	.LBB45_14
.LBB45_17:
	leaq	"??_C@_00CNPNBAHC@?$AA@"(%rip), %rdx
.LBB45_19:
.Ltmp180:
	leaq	-96(%rbp), %rcx
	callq	"??0_Locinfo@std@@QEAA@PEBD@Z"
.Ltmp181:
# %bb.20:
	movq	8(%rbp), %rsi                   # 8-byte Reload
	movl	$0, 8(%rsi)
	leaq	"??_7?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	leaq	-96(%rbp), %rcx
	callq	"??1_Locinfo@std@@QEAA@XZ"
.Ltmp182:
	movq	%rsi, %rcx
	callq	"?_Facet_Register@std@@YAXPEAV_Facet_base@1@@Z"
.Ltmp183:
# %bb.21:
	movq	8(%rbp), %rdi                   # 8-byte Reload
	movq	(%rdi), %rax
	movq	%rdi, %rcx
	callq	*8(%rax)
	movq	%rdi, "?_Psave@?$_Facetptr@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@2PEBVfacet@locale@2@EB"(%rip)
.LBB45_22:
	leaq	16(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
	movq	%rdi, %rax
	addq	$160, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z")@IMGREL
	.section	.text,"xr",discard,"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
	.seh_endproc
	.def	"?dtor$23@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$23@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA":
.seh_proc "?dtor$23@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA"
.LBB45_23:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	16(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
	.seh_endproc
	.def	"?dtor$24@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$24@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA":
.seh_proc "?dtor$24@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA"
.LBB45_24:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	8(%rbp), %rcx                   # 8-byte Reload
	callq	"??3@YAXPEAX@Z"
	nop
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
	.seh_endproc
	.def	"?dtor$25@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$25@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA":
.seh_proc "?dtor$25@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA"
.LBB45_25:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	8(%rbp), %rcx                   # 8-byte Reload
	movq	(%rcx), %rax
	movl	$1, %edx
	callq	*(%rax)
	nop
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end32:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
	.p2align	2
"$cppxdata$??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z":
	.long	429065506                       # MagicNumber
	.long	3                               # MaxState
	.long	("$stateUnwindMap$??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	5                               # IPMapEntries
	.long	("$ip2state$??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z")@IMGREL # IPToStateXData
	.long	152                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z":
	.long	-1                              # ToState
	.long	"?dtor$23@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA"@IMGREL # Action
	.long	0                               # ToState
	.long	"?dtor$24@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA"@IMGREL # Action
	.long	0                               # ToState
	.long	"?dtor$25@?0???$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z@4HA"@IMGREL # Action
"$ip2state$??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z":
	.long	.Lfunc_begin32@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp176@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp180@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp182@IMGREL+1               # IP
	.long	2                               # ToState
	.long	.Ltmp183@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$use_facet@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@YAAEBV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@0@AEBVlocale@0@@Z"
                                        # -- End function
	.def	"?_Throw_bad_cast@std@@YAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Throw_bad_cast@std@@YAXXZ"
	.globl	"?_Throw_bad_cast@std@@YAXXZ"   # -- Begin function ?_Throw_bad_cast@std@@YAXXZ
	.p2align	4, 0x90
"?_Throw_bad_cast@std@@YAXXZ":          # @"?_Throw_bad_cast@std@@YAXXZ"
.seh_proc "?_Throw_bad_cast@std@@YAXXZ"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	xorps	%xmm0, %xmm0
	movups	%xmm0, 40(%rsp)
	leaq	"??_C@_08EPJLHIJG@bad?5cast?$AA@"(%rip), %rax
	movq	%rax, 40(%rsp)
	leaq	"??_7bad_cast@std@@6B@"(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	"_TI2?AVbad_cast@std@@"(%rip), %rdx
	leaq	32(%rsp), %rcx
	callq	_CxxThrowException
	int3
	.seh_endproc
                                        # -- End function
	.def	"??0_Locinfo@std@@QEAA@PEBD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0_Locinfo@std@@QEAA@PEBD@Z"
	.globl	"??0_Locinfo@std@@QEAA@PEBD@Z"  # -- Begin function ??0_Locinfo@std@@QEAA@PEBD@Z
	.p2align	4, 0x90
"??0_Locinfo@std@@QEAA@PEBD@Z":         # @"??0_Locinfo@std@@QEAA@PEBD@Z"
.Lfunc_begin33:
.seh_proc "??0_Locinfo@std@@QEAA@PEBD@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	xorl	%edx, %edx
	callq	"??0_Lockit@std@@QEAA@H@Z"
	movq	$0, 8(%rdi)
	movb	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movb	$0, 32(%rdi)
	movq	$0, 40(%rdi)
	movw	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movw	$0, 64(%rdi)
	movq	$0, 72(%rdi)
	movb	$0, 80(%rdi)
	movq	$0, 88(%rdi)
	movb	$0, 96(%rdi)
	testq	%rsi, %rsi
	movq	%rdi, -16(%rbp)                 # 8-byte Spill
	je	.LBB47_3
# %bb.1:
.Ltmp184:
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	callq	"?_Locinfo_ctor@_Locinfo@std@@SAXPEAV12@PEBD@Z"
.Ltmp185:
# %bb.2:
	movq	-16(%rbp), %rax                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
.LBB47_3:
.Ltmp186:
	leaq	"??_C@_0BA@ELKIONDK@bad?5locale?5name?$AA@"(%rip), %rcx
	callq	"?_Xruntime_error@std@@YAXPEBD@Z"
.Ltmp187:
# %bb.4:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??0_Locinfo@std@@QEAA@PEBD@Z")@IMGREL
	.section	.text,"xr",discard,"??0_Locinfo@std@@QEAA@PEBD@Z"
	.seh_endproc
	.def	"?dtor$5@?0???0_Locinfo@std@@QEAA@PEBD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$5@?0???0_Locinfo@std@@QEAA@PEBD@Z@4HA":
.seh_proc "?dtor$5@?0???0_Locinfo@std@@QEAA@PEBD@Z@4HA"
.LBB47_5:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	movq	-16(%rbp), %rax                 # 8-byte Reload
	movq	%rax, %rsi
	movq	88(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB47_7
# %bb.6:
	callq	free
.LBB47_7:
	movq	%rsi, %rax
	movq	$0, 88(%rsi)
	movq	72(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB47_9
# %bb.8:
	callq	free
.LBB47_9:
	movq	%rsi, %rax
	movq	$0, 72(%rsi)
	movq	56(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB47_11
# %bb.10:
	callq	free
.LBB47_11:
	movq	%rsi, %rax
	movq	$0, 56(%rsi)
	movq	40(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB47_13
# %bb.12:
	callq	free
.LBB47_13:
	movq	%rsi, %rax
	movq	$0, 40(%rsi)
	movq	24(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB47_15
# %bb.14:
	callq	free
.LBB47_15:
	movq	%rsi, %rax
	movq	$0, 24(%rsi)
	movq	8(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB47_17
# %bb.16:
	callq	free
.LBB47_17:
	movq	%rsi, %rcx
	movq	$0, 8(%rsi)
	callq	"??1_Lockit@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end33:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0_Locinfo@std@@QEAA@PEBD@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0_Locinfo@std@@QEAA@PEBD@Z"
	.p2align	2
"$cppxdata$??0_Locinfo@std@@QEAA@PEBD@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0_Locinfo@std@@QEAA@PEBD@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0_Locinfo@std@@QEAA@PEBD@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0_Locinfo@std@@QEAA@PEBD@Z":
	.long	-1                              # ToState
	.long	"?dtor$5@?0???0_Locinfo@std@@QEAA@PEBD@Z@4HA"@IMGREL # Action
"$ip2state$??0_Locinfo@std@@QEAA@PEBD@Z":
	.long	.Lfunc_begin33@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp184@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp187@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0_Locinfo@std@@QEAA@PEBD@Z"
                                        # -- End function
	.def	"??1_Locinfo@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1_Locinfo@std@@QEAA@XZ"
	.globl	"??1_Locinfo@std@@QEAA@XZ"      # -- Begin function ??1_Locinfo@std@@QEAA@XZ
	.p2align	4, 0x90
"??1_Locinfo@std@@QEAA@XZ":             # @"??1_Locinfo@std@@QEAA@XZ"
.Lfunc_begin34:
.seh_proc "??1_Locinfo@std@@QEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
.Ltmp188:
	callq	"?_Locinfo_dtor@_Locinfo@std@@SAXPEAV12@@Z"
.Ltmp189:
# %bb.1:
	movq	88(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB48_3
# %bb.2:
	callq	free
.LBB48_3:
	movq	$0, 88(%rsi)
	movq	72(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB48_5
# %bb.4:
	callq	free
.LBB48_5:
	movq	$0, 72(%rsi)
	movq	56(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB48_7
# %bb.6:
	callq	free
.LBB48_7:
	movq	$0, 56(%rsi)
	movq	40(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB48_9
# %bb.8:
	callq	free
.LBB48_9:
	movq	$0, 40(%rsi)
	movq	24(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB48_11
# %bb.10:
	callq	free
.LBB48_11:
	movq	$0, 24(%rsi)
	movq	8(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB48_13
# %bb.12:
	callq	free
.LBB48_13:
	movq	$0, 8(%rsi)
	movq	%rsi, %rcx
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	jmp	"??1_Lockit@std@@QEAA@XZ"       # TAILCALL
	.seh_handlerdata
	.long	("$cppxdata$??1_Locinfo@std@@QEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1_Locinfo@std@@QEAA@XZ"
	.seh_endproc
	.def	"?dtor$14@?0???1_Locinfo@std@@QEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$14@?0???1_Locinfo@std@@QEAA@XZ@4HA":
.seh_proc "?dtor$14@?0???1_Locinfo@std@@QEAA@XZ@4HA"
.LBB48_14:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end34:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1_Locinfo@std@@QEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1_Locinfo@std@@QEAA@XZ"
	.p2align	2
"$cppxdata$??1_Locinfo@std@@QEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??1_Locinfo@std@@QEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??1_Locinfo@std@@QEAA@XZ")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1_Locinfo@std@@QEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$14@?0???1_Locinfo@std@@QEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1_Locinfo@std@@QEAA@XZ":
	.long	.Lfunc_begin34@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp188@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp189@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1_Locinfo@std@@QEAA@XZ"
                                        # -- End function
	.def	"??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z"
	.globl	"??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z" # -- Begin function ??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z
	.p2align	4, 0x90
"??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z": # @"??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z"
.seh_proc "??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rcx, %rsi
	testl	%edx, %edx
	je	.LBB49_2
# %bb.1:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB49_2:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?_Incref@facet@locale@std@@UEAAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Incref@facet@locale@std@@UEAAXXZ"
	.globl	"?_Incref@facet@locale@std@@UEAAXXZ" # -- Begin function ?_Incref@facet@locale@std@@UEAAXXZ
	.p2align	4, 0x90
"?_Incref@facet@locale@std@@UEAAXXZ":   # @"?_Incref@facet@locale@std@@UEAAXXZ"
# %bb.0:
	lock		incl	8(%rcx)
	retq
                                        # -- End function
	.def	"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ"
	.globl	"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ" # -- Begin function ?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ
	.p2align	4, 0x90
"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ": # @"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ"
# %bb.0:
	xorl	%eax, %eax
	lock		decl	8(%rcx)
	cmoveq	%rcx, %rax
	retq
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z" # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z"
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	.seh_endprologue
	movq	%r9, %r14
	movq	%r8, %rbx
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	movzbl	240(%rsp), %ebp
	movq	248(%rsp), %r9
	leaq	"??_C@_02BBAHNLBA@?$CFp?$AA@"(%rip), %r8
	leaq	80(%rsp), %r15
	movl	$64, %edx
	movq	%r15, %rcx
	callq	sprintf_s
	cltq
	movups	(%rbx), %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 40(%rsp)
	movb	%bpl, 32(%rsp)
	leaq	64(%rsp), %r8
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	movq	%r14, %r9
	callq	"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@7fffffffffffffff7fffffffffffffff # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z
	.section	.rdata,"dr",discard,__xmm@7fffffffffffffff7fffffffffffffff
	.p2align	4
__xmm@7fffffffffffffff7fffffffffffffff:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.globl	__real@4202a05f20000000
	.section	.rdata,"dr",discard,__real@4202a05f20000000
	.p2align	3
__real@4202a05f20000000:
	.quad	0x4202a05f20000000              # double 1.0E+10
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
.Lfunc_begin35:
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$168, %rsp
	.seh_stackalloc 168
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	movaps	%xmm6, 16(%rbp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 144
	.seh_endprologue
	movq	$-2, 8(%rbp)
	movq	%r9, %rdi
	movq	%r8, %r15
	movq	%rdx, %r12
	movq	%rcx, %r14
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, -16(%rbp)
	movapd	%xmm0, -32(%rbp)
	movq	$15, -8(%rbp)
	movb	$0, -32(%rbp)
	movl	$12288, %eax                    # imm = 0x3000
	andl	24(%r9), %eax
	movq	$-1, %r13
	cmpl	$12288, %eax                    # imm = 0x3000
	je	.LBB53_2
# %bb.1:
	movq	32(%rdi), %r13
.LBB53_2:
	movl	$13, %ecx
	je	.LBB53_6
# %bb.3:
	movq	%r13, %rcx
	testq	%r13, %r13
	jg	.LBB53_6
# %bb.4:
	movl	$6, %ecx
	jne	.LBB53_6
# %bb.5:
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
.LBB53_6:
	movsd	152(%rbp), %xmm6                # xmm6 = mem[0],zero
	movslq	%ecx, %rsi
	cmpl	$8192, %eax                     # imm = 0x2000
	jne	.LBB53_9
# %bb.7:
	movapd	__xmm@7fffffffffffffff7fffffffffffffff(%rip), %xmm0 # xmm0 = [NaN,NaN]
	andpd	%xmm6, %xmm0
	ucomisd	__real@4202a05f20000000(%rip), %xmm0
	jbe	.LBB53_9
# %bb.8:
	leaq	-44(%rbp), %rdx
	movapd	%xmm6, %xmm0
	callq	frexp
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovsl	%eax, %ecx
	imull	$30103, %ecx, %eax              # imm = 0x7597
	shrl	$5, %eax
	imulq	$175921861, %rax, %rax          # imm = 0xA7C5AC5
	shrq	$39, %rax
	addq	%rax, %rsi
.LBB53_9:
	addq	$50, %rsi
	movq	-16(%rbp), %rcx
	movq	%rsi, %r8
	subq	%rcx, %r8
	jbe	.LBB53_12
# %bb.10:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	subq	%rcx, %rdx
	cmpq	%r8, %rdx
	jae	.LBB53_14
# %bb.11:
.Ltmp190:
	movb	$0, 32(%rsp)
	leaq	-32(%rbp), %rcx
	movq	%r8, %rdx
	movq	%r8, %r9
	callq	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
.Ltmp191:
	jmp	.LBB53_20
.LBB53_12:
	cmpq	$16, -8(%rbp)
	jb	.LBB53_16
# %bb.13:
	movq	-32(%rbp), %rbx
	movq	%rsi, -16(%rbp)
	jmp	.LBB53_19
.LBB53_14:
	movq	%rsi, -16(%rbp)
	cmpq	$16, %rax
	jb	.LBB53_17
# %bb.15:
	movq	-32(%rbp), %rbx
	jmp	.LBB53_18
.LBB53_16:
	leaq	-32(%rbp), %rbx
	movq	%rsi, -16(%rbp)
	jmp	.LBB53_19
.LBB53_17:
	leaq	-32(%rbp), %rbx
.LBB53_18:
	addq	%rbx, %rcx
	xorl	%edx, %edx
	callq	memset
.LBB53_19:
	movb	$0, (%rbx,%rsi)
.LBB53_20:
	movl	24(%rdi), %ecx
	movb	$37, -40(%rbp)
	testb	$32, %cl
	jne	.LBB53_22
# %bb.21:
	leaq	-39(%rbp), %rax
	testb	$16, %cl
	jne	.LBB53_23
	jmp	.LBB53_24
.LBB53_22:
	leaq	-38(%rbp), %rax
	movb	$43, -39(%rbp)
	testb	$16, %cl
	je	.LBB53_24
.LBB53_23:
	movb	$35, (%rax)
	incq	%rax
.LBB53_24:
	movw	$10798, (%rax)                  # imm = 0x2A2E
	movb	$76, 2(%rax)
	movl	%ecx, %edx
	andl	$12288, %edx                    # imm = 0x3000
	testb	$4, %cl
	jne	.LBB53_29
# %bb.25:
	cmpl	$4096, %edx                     # imm = 0x1000
	je	.LBB53_35
# %bb.26:
	cmpl	$8192, %edx                     # imm = 0x2000
	je	.LBB53_34
# %bb.27:
	cmpl	$12288, %edx                    # imm = 0x3000
	jne	.LBB53_37
# %bb.28:
	movb	$97, %cl
	jmp	.LBB53_39
.LBB53_29:
	cmpl	$4096, %edx                     # imm = 0x1000
	je	.LBB53_36
# %bb.30:
	cmpl	$8192, %edx                     # imm = 0x2000
	je	.LBB53_34
# %bb.31:
	cmpl	$12288, %edx                    # imm = 0x3000
	jne	.LBB53_38
# %bb.32:
	movb	$65, %cl
	jmp	.LBB53_39
.LBB53_34:
	movb	$102, %cl
	jmp	.LBB53_39
.LBB53_35:
	movb	$101, %cl
	jmp	.LBB53_39
.LBB53_36:
	movb	$69, %cl
	jmp	.LBB53_39
.LBB53_37:
	movb	$103, %cl
	jmp	.LBB53_39
.LBB53_38:
	movb	$71, %cl
.LBB53_39:
	movb	%cl, 3(%rax)
	movb	$0, 4(%rax)
	movq	-16(%rbp), %rdx
	cmpq	$16, -8(%rbp)
	jb	.LBB53_41
# %bb.40:
	movq	-32(%rbp), %rcx
	jmp	.LBB53_42
.LBB53_41:
	leaq	-32(%rbp), %rcx
.LBB53_42:
.Ltmp192:
	movsd	%xmm6, 32(%rsp)
	leaq	-40(%rbp), %r8
	movl	%r13d, %r9d
	callq	sprintf_s
.Ltmp193:
# %bb.43:
	movzbl	144(%rbp), %ecx
	cltq
	cmpq	$16, -8(%rbp)
	jb	.LBB53_45
# %bb.44:
	movq	-32(%rbp), %rdx
	jmp	.LBB53_46
.LBB53_45:
	leaq	-32(%rbp), %rdx
.LBB53_46:
	movupd	(%r15), %xmm0
	movapd	%xmm0, -64(%rbp)
.Ltmp194:
	movq	%rax, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 32(%rsp)
	leaq	-64(%rbp), %r8
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%rdi, %r9
	callq	"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
.Ltmp195:
# %bb.47:
	movq	-8(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB53_52
# %bb.48:
	movq	-32(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB53_51
# %bb.49:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB53_53
# %bb.50:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB53_51:
	callq	"??3@YAXPEAX_K@Z"
.LBB53_52:
	movq	%r12, %rax
	movaps	16(%rbp), %xmm6                 # 16-byte Reload
	addq	$168, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB53_53:
.Ltmp196:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp197:
# %bb.54:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z")@IMGREL
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.seh_endproc
	.def	"?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA":
.seh_proc "?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA"
.LBB53_55:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movapd	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.seh_endproc
	.def	"?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA":
.seh_proc "?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA"
.LBB53_56:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movapd	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	leaq	-32(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	movaps	48(%rsp), %xmm6                 # 16-byte Reload
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end35:
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.p2align	2
"$cppxdata$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	6                               # IPMapEntries
	.long	("$ip2state$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z")@IMGREL # IPToStateXData
	.long	136                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z":
	.long	-1                              # ToState
	.long	"?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z@4HA"@IMGREL # Action
"$ip2state$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z":
	.long	.Lfunc_begin35@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp190@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp191@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp192@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp196@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp197@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z" # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
.Lfunc_begin36:
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$168, %rsp
	.seh_stackalloc 168
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	movaps	%xmm6, 16(%rbp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 144
	.seh_endprologue
	movq	$-2, 8(%rbp)
	movq	%r9, %rdi
	movq	%r8, %r15
	movq	%rdx, %r12
	movq	%rcx, %r14
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, -16(%rbp)
	movapd	%xmm0, -32(%rbp)
	movq	$15, -8(%rbp)
	movb	$0, -32(%rbp)
	movl	$12288, %eax                    # imm = 0x3000
	andl	24(%r9), %eax
	movq	$-1, %r13
	cmpl	$12288, %eax                    # imm = 0x3000
	je	.LBB54_2
# %bb.1:
	movq	32(%rdi), %r13
.LBB54_2:
	movl	$13, %ecx
	je	.LBB54_6
# %bb.3:
	movq	%r13, %rcx
	testq	%r13, %r13
	jg	.LBB54_6
# %bb.4:
	movl	$6, %ecx
	jne	.LBB54_6
# %bb.5:
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
.LBB54_6:
	movsd	152(%rbp), %xmm6                # xmm6 = mem[0],zero
	movslq	%ecx, %rsi
	cmpl	$8192, %eax                     # imm = 0x2000
	jne	.LBB54_9
# %bb.7:
	movapd	__xmm@7fffffffffffffff7fffffffffffffff(%rip), %xmm0 # xmm0 = [NaN,NaN]
	andpd	%xmm6, %xmm0
	ucomisd	__real@4202a05f20000000(%rip), %xmm0
	jbe	.LBB54_9
# %bb.8:
	leaq	-44(%rbp), %rdx
	movapd	%xmm6, %xmm0
	callq	frexp
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovsl	%eax, %ecx
	imull	$30103, %ecx, %eax              # imm = 0x7597
	shrl	$5, %eax
	imulq	$175921861, %rax, %rax          # imm = 0xA7C5AC5
	shrq	$39, %rax
	addq	%rax, %rsi
.LBB54_9:
	addq	$50, %rsi
	movq	-16(%rbp), %rcx
	movq	%rsi, %r8
	subq	%rcx, %r8
	jbe	.LBB54_12
# %bb.10:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	subq	%rcx, %rdx
	cmpq	%r8, %rdx
	jae	.LBB54_14
# %bb.11:
.Ltmp198:
	movb	$0, 32(%rsp)
	leaq	-32(%rbp), %rcx
	movq	%r8, %rdx
	movq	%r8, %r9
	callq	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
.Ltmp199:
	jmp	.LBB54_20
.LBB54_12:
	cmpq	$16, -8(%rbp)
	jb	.LBB54_16
# %bb.13:
	movq	-32(%rbp), %rbx
	movq	%rsi, -16(%rbp)
	jmp	.LBB54_19
.LBB54_14:
	movq	%rsi, -16(%rbp)
	cmpq	$16, %rax
	jb	.LBB54_17
# %bb.15:
	movq	-32(%rbp), %rbx
	jmp	.LBB54_18
.LBB54_16:
	leaq	-32(%rbp), %rbx
	movq	%rsi, -16(%rbp)
	jmp	.LBB54_19
.LBB54_17:
	leaq	-32(%rbp), %rbx
.LBB54_18:
	addq	%rbx, %rcx
	xorl	%edx, %edx
	callq	memset
.LBB54_19:
	movb	$0, (%rbx,%rsi)
.LBB54_20:
	movl	24(%rdi), %ecx
	movb	$37, -40(%rbp)
	testb	$32, %cl
	jne	.LBB54_22
# %bb.21:
	leaq	-39(%rbp), %rax
	testb	$16, %cl
	jne	.LBB54_23
	jmp	.LBB54_24
.LBB54_22:
	leaq	-38(%rbp), %rax
	movb	$43, -39(%rbp)
	testb	$16, %cl
	je	.LBB54_24
.LBB54_23:
	movb	$35, (%rax)
	incq	%rax
.LBB54_24:
	movw	$10798, (%rax)                  # imm = 0x2A2E
	movl	%ecx, %edx
	andl	$12288, %edx                    # imm = 0x3000
	testb	$4, %cl
	jne	.LBB54_29
# %bb.25:
	cmpl	$4096, %edx                     # imm = 0x1000
	je	.LBB54_35
# %bb.26:
	cmpl	$8192, %edx                     # imm = 0x2000
	je	.LBB54_34
# %bb.27:
	cmpl	$12288, %edx                    # imm = 0x3000
	jne	.LBB54_37
# %bb.28:
	movb	$97, %cl
	jmp	.LBB54_39
.LBB54_29:
	cmpl	$4096, %edx                     # imm = 0x1000
	je	.LBB54_36
# %bb.30:
	cmpl	$8192, %edx                     # imm = 0x2000
	je	.LBB54_34
# %bb.31:
	cmpl	$12288, %edx                    # imm = 0x3000
	jne	.LBB54_38
# %bb.32:
	movb	$65, %cl
	jmp	.LBB54_39
.LBB54_34:
	movb	$102, %cl
	jmp	.LBB54_39
.LBB54_35:
	movb	$101, %cl
	jmp	.LBB54_39
.LBB54_36:
	movb	$69, %cl
	jmp	.LBB54_39
.LBB54_37:
	movb	$103, %cl
	jmp	.LBB54_39
.LBB54_38:
	movb	$71, %cl
.LBB54_39:
	movb	%cl, 2(%rax)
	movb	$0, 3(%rax)
	movq	-16(%rbp), %rdx
	cmpq	$16, -8(%rbp)
	jb	.LBB54_41
# %bb.40:
	movq	-32(%rbp), %rcx
	jmp	.LBB54_42
.LBB54_41:
	leaq	-32(%rbp), %rcx
.LBB54_42:
.Ltmp200:
	movsd	%xmm6, 32(%rsp)
	leaq	-40(%rbp), %r8
	movl	%r13d, %r9d
	callq	sprintf_s
.Ltmp201:
# %bb.43:
	movzbl	144(%rbp), %ecx
	cltq
	cmpq	$16, -8(%rbp)
	jb	.LBB54_45
# %bb.44:
	movq	-32(%rbp), %rdx
	jmp	.LBB54_46
.LBB54_45:
	leaq	-32(%rbp), %rdx
.LBB54_46:
	movupd	(%r15), %xmm0
	movapd	%xmm0, -64(%rbp)
.Ltmp202:
	movq	%rax, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 32(%rsp)
	leaq	-64(%rbp), %r8
	movq	%r14, %rcx
	movq	%r12, %rdx
	movq	%rdi, %r9
	callq	"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
.Ltmp203:
# %bb.47:
	movq	-8(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB54_52
# %bb.48:
	movq	-32(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB54_51
# %bb.49:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB54_53
# %bb.50:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB54_51:
	callq	"??3@YAXPEAX_K@Z"
.LBB54_52:
	movq	%r12, %rax
	movaps	16(%rbp), %xmm6                 # 16-byte Reload
	addq	$168, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB54_53:
.Ltmp204:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp205:
# %bb.54:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z")@IMGREL
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
	.seh_endproc
	.def	"?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA":
.seh_proc "?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA"
.LBB54_55:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movapd	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
	.seh_endproc
	.def	"?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA":
.seh_proc "?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA"
.LBB54_56:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	128(%rdx), %rbp
	movapd	%xmm6, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 48
	.seh_endprologue
	leaq	-32(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	movaps	48(%rsp), %xmm6                 # 16-byte Reload
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end36:
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
	.p2align	2
"$cppxdata$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	6                               # IPMapEntries
	.long	("$ip2state$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z")@IMGREL # IPToStateXData
	.long	136                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z":
	.long	-1                              # ToState
	.long	"?dtor$55@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$56@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z@4HA"@IMGREL # Action
"$ip2state$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z":
	.long	.Lfunc_begin36@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp198@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp199@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp200@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp204@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp205@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z" # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z"
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	.seh_endprologue
	movq	%r9, %rdi
	movq	%r8, %r15
	movq	%rdx, %rsi
	movq	%rcx, %r14
	movl	24(%r9), %ecx
	movb	$37, 56(%rsp)
	testb	$32, %cl
	jne	.LBB55_2
# %bb.1:
	leaq	57(%rsp), %rax
	testb	$8, %cl
	jne	.LBB55_4
	jmp	.LBB55_5
.LBB55_2:
	leaq	58(%rsp), %rax
	movb	$43, 57(%rsp)
	testb	$8, %cl
	je	.LBB55_5
.LBB55_4:
	movb	$35, (%rax)
	incq	%rax
.LBB55_5:
	movq	248(%rsp), %r9
	movzbl	240(%rsp), %ebp
	movw	$13897, (%rax)                  # imm = 0x3649
	movb	$52, 2(%rax)
	movl	%ecx, %edx
	andl	$3584, %edx                     # imm = 0xE00
	cmpl	$1024, %edx                     # imm = 0x400
	je	.LBB55_6
# %bb.7:
	cmpl	$2048, %edx                     # imm = 0x800
	jne	.LBB55_8
# %bb.9:
	testb	$4, %cl
	sete	%cl
	shlb	$5, %cl
	orb	$88, %cl
	jmp	.LBB55_10
.LBB55_6:
	movb	$111, %cl
	jmp	.LBB55_10
.LBB55_8:
	movb	$117, %cl
.LBB55_10:
	movb	%cl, 3(%rax)
	movb	$0, 4(%rax)
	leaq	80(%rsp), %rbx
	leaq	56(%rsp), %r8
	movl	$64, %edx
	movq	%rbx, %rcx
	callq	sprintf_s
	cltq
	movups	(%r15), %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rbx, 40(%rsp)
	movb	%bpl, 32(%rsp)
	leaq	64(%rsp), %r8
	movq	%r14, %rcx
	movq	%rsi, %rdx
	movq	%rdi, %r9
	callq	"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z" # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z"
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	.seh_endprologue
	movq	%r9, %rdi
	movq	%r8, %r15
	movq	%rdx, %rsi
	movq	%rcx, %r14
	movl	24(%r9), %ecx
	movb	$37, 56(%rsp)
	testb	$32, %cl
	jne	.LBB56_2
# %bb.1:
	leaq	57(%rsp), %rax
	testb	$8, %cl
	jne	.LBB56_4
	jmp	.LBB56_5
.LBB56_2:
	leaq	58(%rsp), %rax
	movb	$43, 57(%rsp)
	testb	$8, %cl
	je	.LBB56_5
.LBB56_4:
	movb	$35, (%rax)
	incq	%rax
.LBB56_5:
	movq	248(%rsp), %r9
	movzbl	240(%rsp), %ebp
	movw	$13897, (%rax)                  # imm = 0x3649
	movb	$52, 2(%rax)
	movl	%ecx, %edx
	andl	$3584, %edx                     # imm = 0xE00
	cmpl	$1024, %edx                     # imm = 0x400
	je	.LBB56_6
# %bb.7:
	cmpl	$2048, %edx                     # imm = 0x800
	jne	.LBB56_8
# %bb.9:
	testb	$4, %cl
	sete	%cl
	shlb	$5, %cl
	orb	$88, %cl
	jmp	.LBB56_10
.LBB56_6:
	movb	$111, %cl
	jmp	.LBB56_10
.LBB56_8:
	movb	$100, %cl
.LBB56_10:
	movb	%cl, 3(%rax)
	movb	$0, 4(%rax)
	leaq	80(%rsp), %rbx
	leaq	56(%rsp), %r8
	movl	$64, %edx
	movq	%rbx, %rcx
	callq	sprintf_s
	cltq
	movups	(%r15), %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rbx, 40(%rsp)
	movb	%bpl, 32(%rsp)
	leaq	64(%rsp), %r8
	movq	%r14, %rcx
	movq	%rsi, %rdx
	movq	%rdi, %r9
	callq	"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z" # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z"
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	.seh_endprologue
	movq	%r9, %rdi
	movq	%r8, %r15
	movq	%rdx, %rsi
	movq	%rcx, %r14
	movl	24(%r9), %ecx
	movb	$37, 58(%rsp)
	testb	$32, %cl
	jne	.LBB57_2
# %bb.1:
	leaq	59(%rsp), %rax
	testb	$8, %cl
	jne	.LBB57_4
	jmp	.LBB57_5
.LBB57_2:
	leaq	60(%rsp), %rax
	movb	$43, 59(%rsp)
	testb	$8, %cl
	je	.LBB57_5
.LBB57_4:
	movb	$35, (%rax)
	incq	%rax
.LBB57_5:
	movl	248(%rsp), %r9d
	movzbl	240(%rsp), %ebp
	movb	$108, (%rax)
	movl	%ecx, %edx
	andl	$3584, %edx                     # imm = 0xE00
	cmpl	$1024, %edx                     # imm = 0x400
	je	.LBB57_6
# %bb.7:
	cmpl	$2048, %edx                     # imm = 0x800
	jne	.LBB57_8
# %bb.9:
	testb	$4, %cl
	sete	%cl
	shlb	$5, %cl
	orb	$88, %cl
	jmp	.LBB57_10
.LBB57_6:
	movb	$111, %cl
	jmp	.LBB57_10
.LBB57_8:
	movb	$117, %cl
.LBB57_10:
	movb	%cl, 1(%rax)
	movb	$0, 2(%rax)
	leaq	80(%rsp), %rbx
	leaq	58(%rsp), %r8
	movl	$64, %edx
	movq	%rbx, %rcx
	callq	sprintf_s
	cltq
	movups	(%r15), %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rbx, 40(%rsp)
	movb	%bpl, 32(%rsp)
	leaq	64(%rsp), %r8
	movq	%r14, %rcx
	movq	%rsi, %rdx
	movq	%rdi, %r9
	callq	"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z" # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z"
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	.seh_endprologue
	movq	%r9, %rdi
	movq	%r8, %r15
	movq	%rdx, %rsi
	movq	%rcx, %r14
	movl	24(%r9), %ecx
	movb	$37, 58(%rsp)
	testb	$32, %cl
	jne	.LBB58_2
# %bb.1:
	leaq	59(%rsp), %rax
	testb	$8, %cl
	jne	.LBB58_4
	jmp	.LBB58_5
.LBB58_2:
	leaq	60(%rsp), %rax
	movb	$43, 59(%rsp)
	testb	$8, %cl
	je	.LBB58_5
.LBB58_4:
	movb	$35, (%rax)
	incq	%rax
.LBB58_5:
	movl	248(%rsp), %r9d
	movzbl	240(%rsp), %ebp
	movb	$108, (%rax)
	movl	%ecx, %edx
	andl	$3584, %edx                     # imm = 0xE00
	cmpl	$1024, %edx                     # imm = 0x400
	je	.LBB58_6
# %bb.7:
	cmpl	$2048, %edx                     # imm = 0x800
	jne	.LBB58_8
# %bb.9:
	testb	$4, %cl
	sete	%cl
	shlb	$5, %cl
	orb	$88, %cl
	jmp	.LBB58_10
.LBB58_6:
	movb	$111, %cl
	jmp	.LBB58_10
.LBB58_8:
	movb	$100, %cl
.LBB58_10:
	movb	%cl, 1(%rax)
	movb	$0, 2(%rax)
	leaq	80(%rsp), %rbx
	leaq	58(%rsp), %r8
	movl	$64, %edx
	movq	%rbx, %rcx
	callq	sprintf_s
	cltq
	movups	(%r15), %xmm0
	movaps	%xmm0, 64(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rbx, 40(%rsp)
	movb	%bpl, 32(%rsp)
	leaq	64(%rsp), %r8
	movq	%r14, %rcx
	movq	%rsi, %rdx
	movq	%rdi, %r9
	callq	"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.globl	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z" # -- Begin function ?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z
	.p2align	4, 0x90
"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z": # @"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
.Lfunc_begin37:
.seh_proc "?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 64(%rbp)
	movq	%r9, %rsi
	movq	%r8, %rbx
	movq	%rdx, %rdi
	movzbl	184(%rbp), %r14d
	movzbl	176(%rbp), %edx
	testb	$64, 25(%r9)
	jne	.LBB59_2
# %bb.1:
	movzbl	%r14b, %eax
	movups	(%rbx), %xmm0
	movaps	%xmm0, -80(%rbp)
	movq	(%rcx), %rbx
	movl	%eax, 40(%rsp)
	movb	%dl, 32(%rsp)
	leaq	-80(%rbp), %r8
	movq	%rdi, %rdx
	movq	%rsi, %r9
	callq	*72(%rbx)
	jmp	.LBB59_68
.LBB59_2:
	movq	64(%rsi), %rax
	movq	8(%rax), %rcx
	movq	%rcx, 24(%rbp)
	movq	(%rcx), %rax
	callq	*8(%rax)
.Ltmp206:
	leaq	16(%rbp), %r12
	movq	%r12, %rcx
	callq	"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
.Ltmp207:
# %bb.3:
	movq	%rax, %r15
	movq	24(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB59_6
# %bb.4:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB59_6
# %bb.5:
	movq	(%rax), %r8
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%r8)
.LBB59_6:
	movq	%rbx, 8(%rbp)                   # 8-byte Spill
	movq	%rsi, -24(%rbp)                 # 8-byte Spill
	movq	%rdi, -32(%rbp)                 # 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 32(%rbp)
	movaps	%xmm0, 16(%rbp)
	movq	$15, 40(%rbp)
	movb	$0, 16(%rbp)
	testb	%r14b, %r14b
	je	.LBB59_18
# %bb.7:
	movq	(%r15), %rax
.Ltmp212:
	leaq	-64(%rbp), %rdx
	movq	%r15, %rcx
	callq	*56(%rax)
.Ltmp213:
# %bb.8:
	movq	40(%rbp), %rax
	cmpq	$16, %rax
	movq	-24(%rbp), %rsi                 # 8-byte Reload
	jb	.LBB59_27
# %bb.9:
	movq	16(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB59_26
# %bb.10:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jb	.LBB59_25
# %bb.11:
.Ltmp214:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp215:
# %bb.12:
.LBB59_18:
	movq	(%r15), %rax
.Ltmp208:
	leaq	-64(%rbp), %rdx
	movq	%r15, %rcx
	callq	*48(%rax)
.Ltmp209:
# %bb.19:
	movq	40(%rbp), %rax
	cmpq	$16, %rax
	movq	-24(%rbp), %rsi                 # 8-byte Reload
	jb	.LBB59_27
# %bb.20:
	movq	16(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB59_26
# %bb.21:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB59_22
.LBB59_25:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB59_26:
	callq	"??3@YAXPEAX_K@Z"
.LBB59_27:
	movups	-64(%rbp), %xmm0
	movups	-48(%rbp), %xmm1
	movaps	%xmm0, 16(%rbp)
	movaps	%xmm1, 32(%rbp)
	movq	40(%rsi), %rax
	xorl	%ecx, %ecx
	movq	%rax, %r13
	subq	32(%rbp), %r13
	cmovbq	%rcx, %r13
	testq	%rax, %rax
	cmovleq	%rcx, %r13
	movl	$448, %eax                      # imm = 0x1C0
	andl	24(%rsi), %eax
	cmpl	$64, %eax
	jne	.LBB59_29
# %bb.28:
	movq	8(%rbp), %rbx                   # 8-byte Reload
	jmp	.LBB59_40
.LBB59_29:
	movq	8(%rbp), %rcx                   # 8-byte Reload
	movzbl	(%rcx), %r14d
	movl	4(%rcx), %eax
	movl	%eax, -13(%rbp)
	movl	1(%rcx), %eax
	movl	%eax, -16(%rbp)
	movq	8(%rcx), %rdi
	testq	%r13, %r13
	je	.LBB59_39
# %bb.30:
	movzbl	176(%rbp), %ebx
	jmp	.LBB59_31
	.p2align	4, 0x90
.LBB59_37:                              #   in Loop: Header=BB59_31 Depth=1
	movb	$1, %r14b
.LBB59_38:                              #   in Loop: Header=BB59_31 Depth=1
	decq	%r13
	je	.LBB59_39
.LBB59_31:                              # =>This Inner Loop Header: Depth=1
	testq	%rdi, %rdi
	je	.LBB59_37
# %bb.32:                               #   in Loop: Header=BB59_31 Depth=1
	movq	64(%rdi), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB59_35
# %bb.33:                               #   in Loop: Header=BB59_31 Depth=1
	movq	88(%rdi), %rdx
	movl	(%rdx), %esi
	testl	%esi, %esi
	jle	.LBB59_35
# %bb.34:                               #   in Loop: Header=BB59_31 Depth=1
	decl	%esi
	movl	%esi, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	176(%rbp), %eax
	movb	%al, (%rcx)
	movl	%ebx, %eax
	jmp	.LBB59_36
	.p2align	4, 0x90
.LBB59_35:                              #   in Loop: Header=BB59_31 Depth=1
	movq	(%rdi), %rax
.Ltmp216:
	movq	%rdi, %rcx
	movl	%ebx, %edx
	callq	*24(%rax)
.Ltmp217:
.LBB59_36:                              #   in Loop: Header=BB59_31 Depth=1
	cmpl	$-1, %eax
	jne	.LBB59_38
	jmp	.LBB59_37
.LBB59_39:
	movq	8(%rbp), %rbx                   # 8-byte Reload
	leaq	1(%rbx), %rax
	movb	%r14b, (%rbx)
	movl	-16(%rbp), %ecx
	movl	-13(%rbp), %edx
	movl	%edx, 3(%rax)
	movl	%ecx, (%rax)
	movq	%rdi, 8(%rbx)
	xorl	%r13d, %r13d
.LBB59_40:
	movq	16(%rbp), %rax
	movq	32(%rbp), %r14
	movq	40(%rbp), %rcx
	movzbl	(%rbx), %edx
	movb	%dl, 63(%rbp)                   # 1-byte Spill
	movl	4(%rbx), %edx
	movl	%edx, -5(%rbp)
	movl	1(%rbx), %edx
	movl	%edx, -8(%rbp)
	movq	8(%rbx), %r15
	testq	%r14, %r14
	je	.LBB59_50
# %bb.41:
	cmpq	$16, %rcx
	cmovaeq	%rax, %r12
	jmp	.LBB59_42
	.p2align	4, 0x90
.LBB59_48:                              #   in Loop: Header=BB59_42 Depth=1
	movb	$1, 63(%rbp)                    # 1-byte Folded Spill
.LBB59_49:                              #   in Loop: Header=BB59_42 Depth=1
	incq	%r12
	decq	%r14
	je	.LBB59_50
.LBB59_42:                              # =>This Inner Loop Header: Depth=1
	testq	%r15, %r15
	je	.LBB59_48
# %bb.43:                               #   in Loop: Header=BB59_42 Depth=1
	movzbl	(%r12), %ecx
	movzbl	%cl, %eax
	movq	64(%r15), %rdx
	movq	(%rdx), %rbx
	testq	%rbx, %rbx
	je	.LBB59_46
# %bb.44:                               #   in Loop: Header=BB59_42 Depth=1
	movq	88(%r15), %rsi
	movl	(%rsi), %edi
	testl	%edi, %edi
	jle	.LBB59_46
# %bb.45:                               #   in Loop: Header=BB59_42 Depth=1
	decl	%edi
	movl	%edi, (%rsi)
	leaq	1(%rbx), %rdi
	movq	%rdi, (%rdx)
	movb	%cl, (%rbx)
	jmp	.LBB59_47
	.p2align	4, 0x90
.LBB59_46:                              #   in Loop: Header=BB59_42 Depth=1
	movq	(%r15), %rbx
.Ltmp218:
	movq	%r15, %rcx
	movl	%eax, %edx
	callq	*24(%rbx)
.Ltmp219:
.LBB59_47:                              #   in Loop: Header=BB59_42 Depth=1
	cmpl	$-1, %eax
	jne	.LBB59_49
	jmp	.LBB59_48
.LBB59_50:
	movq	8(%rbp), %rbx                   # 8-byte Reload
	leaq	1(%rbx), %rax
	movzbl	63(%rbp), %ecx                  # 1-byte Folded Reload
	movb	%cl, (%rbx)
	movl	-8(%rbp), %ecx
	movl	-5(%rbp), %edx
	movl	%edx, 3(%rax)
	movl	%ecx, (%rax)
	movq	%r15, 8(%rbx)
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	movq	$0, 40(%rcx)
	movzbl	(%rbx), %r14d
	movl	(%rax), %ecx
	movl	3(%rax), %eax
	movl	%eax, 3(%rbp)
	movl	%ecx, (%rbp)
	movq	8(%rbx), %rsi
	testq	%r13, %r13
	je	.LBB59_60
# %bb.51:
	movzbl	176(%rbp), %edi
	jmp	.LBB59_52
	.p2align	4, 0x90
.LBB59_58:                              #   in Loop: Header=BB59_52 Depth=1
	movb	$1, %r14b
.LBB59_59:                              #   in Loop: Header=BB59_52 Depth=1
	decq	%r13
	je	.LBB59_60
.LBB59_52:                              # =>This Inner Loop Header: Depth=1
	testq	%rsi, %rsi
	je	.LBB59_58
# %bb.53:                               #   in Loop: Header=BB59_52 Depth=1
	movq	64(%rsi), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB59_56
# %bb.54:                               #   in Loop: Header=BB59_52 Depth=1
	movq	88(%rsi), %rdx
	movl	(%rdx), %ebx
	testl	%ebx, %ebx
	jle	.LBB59_56
# %bb.55:                               #   in Loop: Header=BB59_52 Depth=1
	decl	%ebx
	movl	%ebx, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	176(%rbp), %eax
	movb	%al, (%rcx)
	movl	%edi, %eax
	jmp	.LBB59_57
	.p2align	4, 0x90
.LBB59_56:                              #   in Loop: Header=BB59_52 Depth=1
	movq	(%rsi), %rax
.Ltmp220:
	movq	%rsi, %rcx
	movl	%edi, %edx
	callq	*24(%rax)
.Ltmp221:
.LBB59_57:                              #   in Loop: Header=BB59_52 Depth=1
	cmpl	$-1, %eax
	jne	.LBB59_59
	jmp	.LBB59_58
.LBB59_60:
	movq	-32(%rbp), %rdi                 # 8-byte Reload
	movb	%r14b, (%rdi)
	movl	(%rbp), %eax
	movl	3(%rbp), %ecx
	movl	%eax, 1(%rdi)
	movl	%ecx, 4(%rdi)
	movq	%rsi, 8(%rdi)
	movq	40(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB59_68
# %bb.61:
	movq	16(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB59_67
# %bb.62:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB59_63
# %bb.66:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB59_67:
	callq	"??3@YAXPEAX_K@Z"
.LBB59_68:
	movq	%rdi, %rax
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB59_63:
.Ltmp222:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp223:
# %bb.64:
.LBB59_22:
.Ltmp210:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp211:
# %bb.23:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z")@IMGREL
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.seh_endproc
	.def	"?dtor$13@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$13@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA":
.seh_proc "?dtor$13@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"
.LBB59_13:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.seh_endproc
	.def	"?dtor$14@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$14@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA":
.seh_proc "?dtor$14@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"
.LBB59_14:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	24(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB59_17
# %bb.15:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB59_17
# %bb.16:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB59_17:
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.seh_endproc
	.def	"?dtor$24@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$24@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA":
.seh_proc "?dtor$24@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"
.LBB59_24:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.seh_endproc
	.def	"?dtor$65@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$65@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA":
.seh_proc "?dtor$65@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"
.LBB59_65:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.seh_endproc
	.def	"?dtor$69@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$69@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA":
.seh_proc "?dtor$69@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"
.LBB59_69:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	16(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end37:
	.seh_handlerdata
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
	.p2align	2
"$cppxdata$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z":
	.long	429065506                       # MagicNumber
	.long	5                               # MaxState
	.long	("$stateUnwindMap$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	9                               # IPMapEntries
	.long	("$ip2state$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z")@IMGREL # IPToStateXData
	.long	192                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z":
	.long	-1                              # ToState
	.long	"?dtor$13@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$14@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$24@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$65@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$69@?0??do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z@4HA"@IMGREL # Action
"$ip2state$?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z":
	.long	.Lfunc_begin37@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp206@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp207@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp212@IMGREL+1               # IP
	.long	4                               # ToState
	.long	.Ltmp214@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp208@IMGREL+1               # IP
	.long	4                               # ToState
	.long	.Ltmp222@IMGREL+1               # IP
	.long	3                               # ToState
	.long	.Ltmp210@IMGREL+1               # IP
	.long	2                               # ToState
	.long	.Ltmp211@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"
                                        # -- End function
	.def	"??_Gfacet@locale@std@@MEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gfacet@locale@std@@MEAAPEAXI@Z"
	.globl	"??_Gfacet@locale@std@@MEAAPEAXI@Z" # -- Begin function ??_Gfacet@locale@std@@MEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gfacet@locale@std@@MEAAPEAXI@Z":    # @"??_Gfacet@locale@std@@MEAAPEAXI@Z"
.seh_proc "??_Gfacet@locale@std@@MEAAPEAXI@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rcx, %rsi
	testl	%edx, %edx
	je	.LBB60_2
# %bb.1:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB60_2:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"??_G_Facet_base@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_G_Facet_base@std@@UEAAPEAXI@Z"
	.globl	"??_G_Facet_base@std@@UEAAPEAXI@Z" # -- Begin function ??_G_Facet_base@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_G_Facet_base@std@@UEAAPEAXI@Z":     # @"??_G_Facet_base@std@@UEAAPEAXI@Z"
# %bb.0:
	ud2
                                        # -- End function
	.def	"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.globl	"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z" # -- Begin function ?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z
	.p2align	4, 0x90
"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z": # @"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
.Lfunc_begin38:
.seh_proc "?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 64(%rbp)
	movq	%rdx, %r14
	movq	192(%rbp), %rsi
	movq	184(%rbp), %r12
	testq	%rsi, %rsi
	je	.LBB62_1
# %bb.2:
	movzbl	(%r12), %eax
	addb	$-43, %al
	testb	$-3, %al
	sete	%al
	jmp	.LBB62_3
.LBB62_1:
	xorl	%eax, %eax
.LBB62_3:
	movzbl	%al, %ebx
	movl	$3584, %eax                     # imm = 0xE00
	andl	24(%r9), %eax
	cmpl	$2048, %eax                     # imm = 0x800
	movq	%r8, 48(%rbp)                   # 8-byte Spill
	jne	.LBB62_8
# %bb.4:
	leaq	2(%rbx), %rax
	cmpq	%rsi, %rax
	ja	.LBB62_8
# %bb.5:
	cmpb	$48, (%r12,%rbx)
	jne	.LBB62_8
# %bb.6:
	movzbl	1(%rbx,%r12), %ecx
	orl	$32, %ecx
	cmpl	$120, %ecx
	jne	.LBB62_8
# %bb.7:
	movq	%rax, %rbx
.LBB62_8:
	movq	%r9, -40(%rbp)                  # 8-byte Spill
	movq	64(%r9), %rax
	movq	8(%rax), %rcx
	movq	%rcx, 24(%rbp)
	movq	(%rcx), %rax
	callq	*8(%rax)
.Ltmp224:
	leaq	16(%rbp), %r13
	movq	%r13, %rcx
	callq	"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
.Ltmp225:
# %bb.9:
	movq	%rax, %r15
	movq	24(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB62_12
# %bb.10:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB62_12
# %bb.11:
	movq	(%rax), %rdi
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rdi)
.LBB62_12:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 32(%rbp)
	movaps	%xmm0, 16(%rbp)
	testq	%rsi, %rsi
	js	.LBB62_151
# %bb.13:
	cmpq	$15, %rsi
	movq	%r14, -80(%rbp)                 # 8-byte Spill
	ja	.LBB62_15
# %bb.14:
	movq	%rsi, 32(%rbp)
	movq	$15, 40(%rbp)
	leaq	16(%rbp), %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	memset
	leaq	(%rsi,%rbp), %r14
	addq	$16, %r14
	jmp	.LBB62_20
.LBB62_15:
	movq	$15, 40(%rbp)
	movq	%rsi, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %rdi      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %rdi
	leaq	1(%rdi), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB62_18
# %bb.16:
	cmpq	$-39, %rcx
	jae	.LBB62_152
# %bb.17:
	leaq	40(%rdi), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %r14
	andq	$-32, %r14
	movq	%rax, -8(%r14)
	jmp	.LBB62_19
.LBB62_18:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %r14
.LBB62_19:
	movq	%r14, 16(%rbp)
	movq	%rsi, 32(%rbp)
	movq	%rdi, 40(%rbp)
	movq	%r14, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	memset
	addq	%rsi, %r14
.LBB62_20:
	movb	$0, (%r14)
	cmpq	$16, 40(%rbp)
	jb	.LBB62_22
# %bb.21:
	movq	16(%rbp), %r13
.LBB62_22:
	leaq	(%r12,%rsi), %r8
	movq	(%r15), %rax
.Ltmp226:
	movq	%r15, %rcx
	movq	%r12, %rdx
	movq	%r13, %r9
	callq	*56(%rax)
.Ltmp227:
	movq	-40(%rbp), %rax                 # 8-byte Reload
# %bb.23:
	movq	64(%rax), %rax
	movq	8(%rax), %rcx
	movq	%rcx, -64(%rbp)
	movq	(%rcx), %rax
	callq	*8(%rax)
.Ltmp228:
	leaq	-72(%rbp), %rcx
	callq	"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
.Ltmp229:
# %bb.24:
	movq	%rax, %r14
	movq	-64(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB62_27
# %bb.25:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB62_27
# %bb.26:
	movq	(%rax), %rdi
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rdi)
.LBB62_27:
	movq	(%r14), %rax
.Ltmp230:
	leaq	-72(%rbp), %rdi
	movq	%r14, %rcx
	movq	%rdi, %rdx
	callq	*40(%rax)
.Ltmp231:
# %bb.28:
	cmpq	$16, -48(%rbp)
	jb	.LBB62_30
# %bb.29:
	movq	-72(%rbp), %rdi
.LBB62_30:
	movzbl	(%rdi), %eax
	decb	%al
	cmpb	$125, %al
	movq	%rbx, 8(%rbp)                   # 8-byte Spill
	ja	.LBB62_53
# %bb.31:
	movq	(%r14), %rax
.Ltmp232:
	movq	%r14, %rcx
	callq	*32(%rax)
.Ltmp233:
# %bb.32:
	movl	%eax, %r14d
	leaq	16(%rbp), %r12
	.p2align	4, 0x90
.LBB62_33:                              # =>This Inner Loop Header: Depth=1
	movq	8(%rbp), %rbx                   # 8-byte Reload
	movsbq	(%rdi), %rax
	leal	-1(%rax), %ecx
	cmpb	$125, %cl
	ja	.LBB62_53
# %bb.34:                               #   in Loop: Header=BB62_33 Depth=1
	movq	%rsi, %rcx
	subq	%rbx, %rcx
	cmpq	%rax, %rcx
	jbe	.LBB62_53
# %bb.35:                               #   in Loop: Header=BB62_33 Depth=1
	subq	%rax, %rsi
	movq	32(%rbp), %rax
	movq	%rax, %r8
	subq	%rsi, %r8
	jb	.LBB62_36
# %bb.38:                               #   in Loop: Header=BB62_33 Depth=1
	movq	40(%rbp), %rcx
	cmpq	%rax, %rcx
	jne	.LBB62_39
# %bb.42:                               #   in Loop: Header=BB62_33 Depth=1
.Ltmp252:
	movb	%r14b, 40(%rsp)
	movq	$1, 32(%rsp)
	movl	$1, %edx
	movq	%r12, %rcx
	movq	%rsi, %r9
	callq	"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
.Ltmp253:
# %bb.43:                               #   in Loop: Header=BB62_33 Depth=1
	cmpb	$0, 1(%rdi)
	jle	.LBB62_33
	jmp	.LBB62_44
	.p2align	4, 0x90
.LBB62_39:                              #   in Loop: Header=BB62_33 Depth=1
	incq	%rax
	movq	%rax, 32(%rbp)
	movq	%r12, %rbx
	cmpq	$16, %rcx
	jb	.LBB62_41
# %bb.40:                               #   in Loop: Header=BB62_33 Depth=1
	movq	16(%rbp), %rbx
.LBB62_41:                              #   in Loop: Header=BB62_33 Depth=1
	leaq	(%rbx,%rsi), %rdx
	incq	%r8
	leaq	(%rbx,%rsi), %rcx
	incq	%rcx
	callq	memmove
	movb	%r14b, (%rbx,%rsi)
	cmpb	$0, 1(%rdi)
	jle	.LBB62_33
.LBB62_44:                              #   in Loop: Header=BB62_33 Depth=1
	incq	%rdi
	jmp	.LBB62_33
.LBB62_53:
	movq	32(%rbp), %r15
	movq	-40(%rbp), %rdx                 # 8-byte Reload
	movq	40(%rdx), %rax
	xorl	%ecx, %ecx
	movq	%rax, %r14
	subq	%r15, %r14
	cmovbeq	%rcx, %r14
	testq	%rax, %rax
	cmovleq	%rcx, %r14
	movl	$448, %eax                      # imm = 0x1C0
	andl	24(%rdx), %eax
	cmpl	$64, %eax
	je	.LBB62_101
# %bb.54:
	cmpl	$256, %eax                      # imm = 0x100
	jne	.LBB62_55
# %bb.80:
	movq	16(%rbp), %rax
	movq	40(%rbp), %rcx
	movq	48(%rbp), %rbx                  # 8-byte Reload
	movzbl	(%rbx), %edx
	movb	%dl, 63(%rbp)                   # 1-byte Spill
	movl	4(%rbx), %edx
	movl	%edx, 3(%rbp)
	movl	1(%rbx), %edx
	movl	%edx, (%rbp)
	movq	8(%rbx), %r13
	movq	8(%rbp), %rsi                   # 8-byte Reload
	testq	%rsi, %rsi
	je	.LBB62_90
# %bb.81:
	cmpq	$16, %rcx
	leaq	16(%rbp), %rbx
	cmovaeq	%rax, %rbx
	jmp	.LBB62_82
	.p2align	4, 0x90
.LBB62_88:                              #   in Loop: Header=BB62_82 Depth=1
	movb	$1, 63(%rbp)                    # 1-byte Folded Spill
.LBB62_89:                              #   in Loop: Header=BB62_82 Depth=1
	incq	%rbx
	decq	%rsi
	je	.LBB62_90
.LBB62_82:                              # =>This Inner Loop Header: Depth=1
	testq	%r13, %r13
	je	.LBB62_88
# %bb.83:                               #   in Loop: Header=BB62_82 Depth=1
	movzbl	(%rbx), %r8d
	movzbl	%r8b, %eax
	movq	64(%r13), %rdx
	movq	(%rdx), %rcx
	testq	%rcx, %rcx
	je	.LBB62_86
# %bb.84:                               #   in Loop: Header=BB62_82 Depth=1
	movq	88(%r13), %r9
	movl	(%r9), %edi
	testl	%edi, %edi
	jle	.LBB62_86
# %bb.85:                               #   in Loop: Header=BB62_82 Depth=1
	decl	%edi
	movl	%edi, (%r9)
	leaq	1(%rcx), %rdi
	movq	%rdi, (%rdx)
	movb	%r8b, (%rcx)
	jmp	.LBB62_87
	.p2align	4, 0x90
.LBB62_86:                              #   in Loop: Header=BB62_82 Depth=1
	movq	(%r13), %rdi
.Ltmp236:
	movq	%r13, %rcx
	movl	%eax, %edx
	callq	*24(%rdi)
.Ltmp237:
.LBB62_87:                              #   in Loop: Header=BB62_82 Depth=1
	cmpl	$-1, %eax
	jne	.LBB62_89
	jmp	.LBB62_88
.LBB62_101:
	movq	16(%rbp), %rax
	movq	40(%rbp), %rcx
	movq	48(%rbp), %rdi                  # 8-byte Reload
	movzbl	(%rdi), %r13d
	movl	4(%rdi), %edx
	movl	%edx, -29(%rbp)
	movl	1(%rdi), %edx
	movl	%edx, -32(%rbp)
	movq	8(%rdi), %r12
	testq	%rbx, %rbx
	je	.LBB62_111
# %bb.102:
	movq	%rbx, %rsi
	cmpq	$16, %rcx
	leaq	16(%rbp), %rbx
	cmovaeq	%rax, %rbx
	jmp	.LBB62_103
	.p2align	4, 0x90
.LBB62_109:                             #   in Loop: Header=BB62_103 Depth=1
	movb	$1, %r13b
.LBB62_110:                             #   in Loop: Header=BB62_103 Depth=1
	incq	%rbx
	decq	%rsi
	je	.LBB62_111
.LBB62_103:                             # =>This Inner Loop Header: Depth=1
	testq	%r12, %r12
	je	.LBB62_109
# %bb.104:                              #   in Loop: Header=BB62_103 Depth=1
	movzbl	(%rbx), %r8d
	movzbl	%r8b, %eax
	movq	64(%r12), %rdx
	movq	(%rdx), %rcx
	testq	%rcx, %rcx
	je	.LBB62_107
# %bb.105:                              #   in Loop: Header=BB62_103 Depth=1
	movq	88(%r12), %r9
	movl	(%r9), %edi
	testl	%edi, %edi
	jle	.LBB62_107
# %bb.106:                              #   in Loop: Header=BB62_103 Depth=1
	decl	%edi
	movl	%edi, (%r9)
	leaq	1(%rcx), %rdi
	movq	%rdi, (%rdx)
	movb	%r8b, (%rcx)
	jmp	.LBB62_108
	.p2align	4, 0x90
.LBB62_107:                             #   in Loop: Header=BB62_103 Depth=1
	movq	(%r12), %rdi
.Ltmp234:
	movq	%r12, %rcx
	movl	%eax, %edx
	callq	*24(%rdi)
.Ltmp235:
.LBB62_108:                             #   in Loop: Header=BB62_103 Depth=1
	cmpl	$-1, %eax
	jne	.LBB62_110
	jmp	.LBB62_109
.LBB62_55:
	movq	48(%rbp), %rcx                  # 8-byte Reload
	movzbl	(%rcx), %esi
	movl	4(%rcx), %eax
	movl	%eax, -5(%rbp)
	movl	1(%rcx), %eax
	movl	%eax, -8(%rbp)
	movq	8(%rcx), %r13
	testq	%r14, %r14
	je	.LBB62_65
# %bb.56:
	movzbl	176(%rbp), %r12d
	jmp	.LBB62_57
	.p2align	4, 0x90
.LBB62_63:                              #   in Loop: Header=BB62_57 Depth=1
	movb	$1, %sil
.LBB62_64:                              #   in Loop: Header=BB62_57 Depth=1
	decq	%r14
	je	.LBB62_65
.LBB62_57:                              # =>This Inner Loop Header: Depth=1
	testq	%r13, %r13
	je	.LBB62_63
# %bb.58:                               #   in Loop: Header=BB62_57 Depth=1
	movq	64(%r13), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB62_61
# %bb.59:                               #   in Loop: Header=BB62_57 Depth=1
	movq	88(%r13), %rdx
	movl	(%rdx), %ebx
	testl	%ebx, %ebx
	jle	.LBB62_61
# %bb.60:                               #   in Loop: Header=BB62_57 Depth=1
	decl	%ebx
	movl	%ebx, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	176(%rbp), %eax
	movb	%al, (%rcx)
	movl	%r12d, %eax
	jmp	.LBB62_62
	.p2align	4, 0x90
.LBB62_61:                              #   in Loop: Header=BB62_57 Depth=1
	movq	(%r13), %rax
.Ltmp240:
	movq	%r13, %rcx
	movl	%r12d, %edx
	callq	*24(%rax)
.Ltmp241:
.LBB62_62:                              #   in Loop: Header=BB62_57 Depth=1
	cmpl	$-1, %eax
	jne	.LBB62_64
	jmp	.LBB62_63
.LBB62_90:
	movq	48(%rbp), %rdx                  # 8-byte Reload
	leaq	1(%rdx), %rbx
	movzbl	63(%rbp), %eax                  # 1-byte Folded Reload
	movb	%al, (%rdx)
	movl	(%rbp), %eax
	movl	3(%rbp), %ecx
	movl	%ecx, 3(%rbx)
	movl	%eax, (%rbx)
	movq	%r13, 8(%rdx)
	testq	%r14, %r14
	je	.LBB62_100
# %bb.91:
	movzbl	176(%rbp), %r12d
	jmp	.LBB62_92
	.p2align	4, 0x90
.LBB62_98:                              #   in Loop: Header=BB62_92 Depth=1
	movb	$1, 63(%rbp)                    # 1-byte Folded Spill
.LBB62_99:                              #   in Loop: Header=BB62_92 Depth=1
	decq	%r14
	je	.LBB62_100
.LBB62_92:                              # =>This Inner Loop Header: Depth=1
	testq	%r13, %r13
	je	.LBB62_98
# %bb.93:                               #   in Loop: Header=BB62_92 Depth=1
	movq	64(%r13), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB62_96
# %bb.94:                               #   in Loop: Header=BB62_92 Depth=1
	movq	88(%r13), %rdx
	movl	(%rdx), %edi
	testl	%edi, %edi
	jle	.LBB62_96
# %bb.95:                               #   in Loop: Header=BB62_92 Depth=1
	decl	%edi
	movl	%edi, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	176(%rbp), %eax
	movb	%al, (%rcx)
	movl	%r12d, %eax
	jmp	.LBB62_97
	.p2align	4, 0x90
.LBB62_96:                              #   in Loop: Header=BB62_92 Depth=1
	movq	(%r13), %rax
.Ltmp238:
	movq	%r13, %rcx
	movl	%r12d, %edx
	callq	*24(%rax)
.Ltmp239:
.LBB62_97:                              #   in Loop: Header=BB62_92 Depth=1
	cmpl	$-1, %eax
	jne	.LBB62_99
	jmp	.LBB62_98
.LBB62_111:
	movq	48(%rbp), %rdi                  # 8-byte Reload
	leaq	1(%rdi), %rax
	movb	%r13b, (%rdi)
	movl	-32(%rbp), %ecx
	movl	-29(%rbp), %edx
	movl	%edx, 3(%rax)
	movl	%ecx, (%rax)
	movq	%r12, 8(%rdi)
	jmp	.LBB62_112
.LBB62_65:
	movq	48(%rbp), %rdx                  # 8-byte Reload
	leaq	1(%rdx), %r12
	movb	%sil, (%rdx)
	movl	-8(%rbp), %eax
	movl	-5(%rbp), %ecx
	movl	%ecx, 3(%r12)
	movl	%eax, (%r12)
	movq	%r13, 8(%rdx)
	cmpq	$0, 8(%rbp)                     # 8-byte Folded Reload
	je	.LBB62_78
# %bb.66:
	cmpq	$16, 40(%rbp)
	jb	.LBB62_67
# %bb.68:
	movq	16(%rbp), %rdi
	jmp	.LBB62_69
.LBB62_100:
	movq	48(%rbp), %rdi                  # 8-byte Reload
	movzbl	63(%rbp), %eax                  # 1-byte Folded Reload
	movb	%al, (%rdi)
	movl	(%rbp), %eax
	movl	3(%rbp), %ecx
	movl	%ecx, 3(%rbx)
	movl	%eax, (%rbx)
	jmp	.LBB62_79
.LBB62_67:
	leaq	16(%rbp), %rdi
.LBB62_69:
	movq	8(%rbp), %rbx                   # 8-byte Reload
	jmp	.LBB62_70
	.p2align	4, 0x90
.LBB62_76:                              #   in Loop: Header=BB62_70 Depth=1
	movb	$1, %sil
.LBB62_77:                              #   in Loop: Header=BB62_70 Depth=1
	incq	%rdi
	decq	%rbx
	je	.LBB62_78
.LBB62_70:                              # =>This Inner Loop Header: Depth=1
	testq	%r13, %r13
	je	.LBB62_76
# %bb.71:                               #   in Loop: Header=BB62_70 Depth=1
	movl	%esi, %r14d
	movzbl	(%rdi), %r9d
	movzbl	%r9b, %eax
	movq	64(%r13), %rdx
	movq	(%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB62_74
# %bb.72:                               #   in Loop: Header=BB62_70 Depth=1
	movq	88(%r13), %r8
	movl	(%r8), %ecx
	testl	%ecx, %ecx
	jle	.LBB62_74
# %bb.73:                               #   in Loop: Header=BB62_70 Depth=1
	decl	%ecx
	movl	%ecx, (%r8)
	leaq	1(%rsi), %rcx
	movq	%rcx, (%rdx)
	movb	%r9b, (%rsi)
	jmp	.LBB62_75
	.p2align	4, 0x90
.LBB62_74:                              #   in Loop: Header=BB62_70 Depth=1
	movq	(%r13), %rsi
.Ltmp242:
	movq	%r13, %rcx
	movl	%eax, %edx
	callq	*24(%rsi)
.Ltmp243:
.LBB62_75:                              #   in Loop: Header=BB62_70 Depth=1
	movl	%r14d, %esi
	cmpl	$-1, %eax
	jne	.LBB62_77
	jmp	.LBB62_76
.LBB62_78:
	movq	48(%rbp), %rdi                  # 8-byte Reload
	movb	%sil, (%rdi)
	movl	-8(%rbp), %eax
	movl	-5(%rbp), %ecx
	movl	%ecx, 3(%r12)
	movl	%eax, (%r12)
.LBB62_79:
	movq	%r13, 8(%rdi)
	xorl	%r14d, %r14d
.LBB62_112:
	movq	16(%rbp), %rax
	movq	40(%rbp), %rcx
	movzbl	(%rdi), %r12d
	movl	4(%rdi), %edx
	movl	%edx, -21(%rbp)
	movl	1(%rdi), %edx
	movl	%edx, -24(%rbp)
	movq	8(%rdi), %r13
	movq	8(%rbp), %rdx                   # 8-byte Reload
	subq	%rdx, %r15
	je	.LBB62_122
# %bb.113:
	cmpq	$16, %rcx
	leaq	16(%rbp), %rbx
	cmovaeq	%rax, %rbx
	addq	%rdx, %rbx
	jmp	.LBB62_114
	.p2align	4, 0x90
.LBB62_120:                             #   in Loop: Header=BB62_114 Depth=1
	movb	$1, %r12b
.LBB62_121:                             #   in Loop: Header=BB62_114 Depth=1
	incq	%rbx
	decq	%r15
	je	.LBB62_122
.LBB62_114:                             # =>This Inner Loop Header: Depth=1
	testq	%r13, %r13
	je	.LBB62_120
# %bb.115:                              #   in Loop: Header=BB62_114 Depth=1
	movzbl	(%rbx), %ecx
	movzbl	%cl, %eax
	movq	64(%r13), %rdx
	movq	(%rdx), %rdi
	testq	%rdi, %rdi
	je	.LBB62_118
# %bb.116:                              #   in Loop: Header=BB62_114 Depth=1
	movq	88(%r13), %r8
	movl	(%r8), %esi
	testl	%esi, %esi
	jle	.LBB62_118
# %bb.117:                              #   in Loop: Header=BB62_114 Depth=1
	decl	%esi
	movl	%esi, (%r8)
	leaq	1(%rdi), %rsi
	movq	%rsi, (%rdx)
	movb	%cl, (%rdi)
	jmp	.LBB62_119
	.p2align	4, 0x90
.LBB62_118:                             #   in Loop: Header=BB62_114 Depth=1
	movq	(%r13), %rdi
.Ltmp244:
	movq	%r13, %rcx
	movl	%eax, %edx
	callq	*24(%rdi)
.Ltmp245:
.LBB62_119:                             #   in Loop: Header=BB62_114 Depth=1
	cmpl	$-1, %eax
	jne	.LBB62_121
	jmp	.LBB62_120
.LBB62_122:
	movq	48(%rbp), %rbx                  # 8-byte Reload
	leaq	1(%rbx), %rax
	movb	%r12b, (%rbx)
	movl	-24(%rbp), %ecx
	movl	-21(%rbp), %edx
	movl	%edx, 3(%rax)
	movl	%ecx, (%rax)
	movq	%r13, 8(%rbx)
	movq	-40(%rbp), %rcx                 # 8-byte Reload
	movq	$0, 40(%rcx)
	movzbl	(%rbx), %r15d
	movl	(%rax), %ecx
	movl	3(%rax), %eax
	movl	%eax, -13(%rbp)
	movl	%ecx, -16(%rbp)
	movq	8(%rbx), %rsi
	testq	%r14, %r14
	je	.LBB62_132
# %bb.123:
	movzbl	176(%rbp), %ebx
	jmp	.LBB62_124
	.p2align	4, 0x90
.LBB62_130:                             #   in Loop: Header=BB62_124 Depth=1
	movb	$1, %r15b
.LBB62_131:                             #   in Loop: Header=BB62_124 Depth=1
	decq	%r14
	je	.LBB62_132
.LBB62_124:                             # =>This Inner Loop Header: Depth=1
	testq	%rsi, %rsi
	je	.LBB62_130
# %bb.125:                              #   in Loop: Header=BB62_124 Depth=1
	movq	64(%rsi), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB62_128
# %bb.126:                              #   in Loop: Header=BB62_124 Depth=1
	movq	88(%rsi), %rdx
	movl	(%rdx), %edi
	testl	%edi, %edi
	jle	.LBB62_128
# %bb.127:                              #   in Loop: Header=BB62_124 Depth=1
	decl	%edi
	movl	%edi, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	176(%rbp), %eax
	movb	%al, (%rcx)
	movl	%ebx, %eax
	jmp	.LBB62_129
	.p2align	4, 0x90
.LBB62_128:                             #   in Loop: Header=BB62_124 Depth=1
	movq	(%rsi), %rax
.Ltmp246:
	movq	%rsi, %rcx
	movl	%ebx, %edx
	callq	*24(%rax)
.Ltmp247:
.LBB62_129:                             #   in Loop: Header=BB62_124 Depth=1
	cmpl	$-1, %eax
	jne	.LBB62_131
	jmp	.LBB62_130
.LBB62_132:
	movq	-80(%rbp), %rdi                 # 8-byte Reload
	movb	%r15b, (%rdi)
	movl	-16(%rbp), %eax
	movl	-13(%rbp), %ecx
	movl	%eax, 1(%rdi)
	movl	%ecx, 4(%rdi)
	movq	%rsi, 8(%rdi)
	movq	-48(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB62_140
# %bb.133:
	movq	-72(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB62_139
# %bb.134:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB62_135
# %bb.138:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB62_139:
	callq	"??3@YAXPEAX_K@Z"
.LBB62_140:
	movq	40(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB62_148
# %bb.141:
	movq	16(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB62_147
# %bb.142:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB62_143
# %bb.146:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB62_147:
	callq	"??3@YAXPEAX_K@Z"
.LBB62_148:
	movq	%rdi, %rax
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB62_36:
.Ltmp254:
	callq	"?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ"
.Ltmp255:
# %bb.37:
.LBB62_151:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB62_152:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB62_135:
.Ltmp248:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp249:
# %bb.136:
.LBB62_143:
.Ltmp250:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp251:
# %bb.144:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z")@IMGREL
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_endproc
	.def	"?dtor$45@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$45@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA":
.seh_proc "?dtor$45@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"
.LBB62_45:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	24(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB62_48
# %bb.46:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB62_48
# %bb.47:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB62_48:
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_endproc
	.def	"?dtor$49@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$49@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA":
.seh_proc "?dtor$49@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"
.LBB62_49:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	-64(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB62_52
# %bb.50:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB62_52
# %bb.51:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB62_52:
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_endproc
	.def	"?dtor$137@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$137@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA":
.seh_proc "?dtor$137@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"
.LBB62_137:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_endproc
	.def	"?dtor$145@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$145@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA":
.seh_proc "?dtor$145@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"
.LBB62_145:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_endproc
	.def	"?dtor$149@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$149@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA":
.seh_proc "?dtor$149@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"
.LBB62_149:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-72(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_endproc
	.def	"?dtor$150@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$150@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA":
.seh_proc "?dtor$150@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"
.LBB62_150:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	16(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end38:
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
	.p2align	2
"$cppxdata$?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z":
	.long	429065506                       # MagicNumber
	.long	6                               # MaxState
	.long	("$stateUnwindMap$?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	15                              # IPMapEntries
	.long	("$ip2state$?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z")@IMGREL # IPToStateXData
	.long	192                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z":
	.long	-1                              # ToState
	.long	"?dtor$45@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$137@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$145@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$150@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	"?dtor$49@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	"?dtor$149@?0??_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z@4HA"@IMGREL # Action
"$ip2state$?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z":
	.long	.Lfunc_begin38@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp224@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp225@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp226@IMGREL+1               # IP
	.long	3                               # ToState
	.long	.Ltmp227@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp228@IMGREL+1               # IP
	.long	4                               # ToState
	.long	.Ltmp229@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp230@IMGREL+1               # IP
	.long	3                               # ToState
	.long	.Ltmp232@IMGREL+1               # IP
	.long	5                               # ToState
	.long	.Ltmp253@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp236@IMGREL+1               # IP
	.long	5                               # ToState
	.long	.Ltmp255@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp248@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp250@IMGREL+1               # IP
	.long	2                               # ToState
	.long	.Ltmp251@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?_Iput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEAD_K@Z"
                                        # -- End function
	.def	sprintf_s;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,sprintf_s
	.globl	sprintf_s                       # -- Begin function sprintf_s
	.p2align	4, 0x90
sprintf_s:                              # @sprintf_s
.seh_proc sprintf_s
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, %rsi
	movq	%rdx, %rdi
	movq	%rcx, %rbx
	movq	%r9, 120(%rsp)
	leaq	120(%rsp), %r14
	movq	%r14, 48(%rsp)
	callq	__local_stdio_printf_options
	movq	(%rax), %rcx
	movq	%r14, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	%rbx, %rdx
	movq	%rdi, %r8
	movq	%rsi, %r9
	callq	__stdio_common_vsprintf_s
	testl	%eax, %eax
	movl	$-1, %ecx
	cmovsl	%ecx, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
	.globl	"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z" # -- Begin function ??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z
	.p2align	4, 0x90
"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z": # @"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
.Lfunc_begin39:
.seh_proc "??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	64(%rsp), %rbp
	.seh_setframe %rbp, 64
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	leaq	-8(%rbp), %rcx
	xorl	%edx, %edx
	callq	"??0_Lockit@std@@QEAA@H@Z"
	movq	"?_Psave@?$_Facetptr@V?$ctype@D@std@@@std@@2PEBVfacet@locale@2@EB"(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, "?id@?$ctype@D@std@@2V0locale@2@A"(%rip)
	jne	.LBB64_4
# %bb.1:
	leaq	-32(%rbp), %rcx
	xorl	%edx, %edx
	callq	"??0_Lockit@std@@QEAA@H@Z"
	cmpq	$0, "?id@?$ctype@D@std@@2V0locale@2@A"(%rip)
	jne	.LBB64_3
# %bb.2:
	movslq	"?_Id_cnt@id@locale@std@@0HA"(%rip), %rax
	incq	%rax
	movl	%eax, "?_Id_cnt@id@locale@std@@0HA"(%rip)
	movq	%rax, "?id@?$ctype@D@std@@2V0locale@2@A"(%rip)
.LBB64_3:
	leaq	-32(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
.LBB64_4:
	movq	"?id@?$ctype@D@std@@2V0locale@2@A"(%rip), %rbx
	movq	8(%rsi), %rax
	cmpq	%rbx, 24(%rax)
	jbe	.LBB64_5
# %bb.6:
	movq	16(%rax), %rcx
	movq	(%rcx,%rbx,8), %rdi
	testq	%rdi, %rdi
	jne	.LBB64_13
	jmp	.LBB64_8
.LBB64_5:
	xorl	%edi, %edi
	testq	%rdi, %rdi
	jne	.LBB64_13
.LBB64_8:
	cmpb	$0, 36(%rax)
	je	.LBB64_13
# %bb.9:
.Ltmp256:
	callq	"?_Getgloballocale@locale@std@@CAPEAV_Locimp@12@XZ"
.Ltmp257:
# %bb.10:
	cmpq	%rbx, 24(%rax)
	jbe	.LBB64_11
# %bb.12:
	movq	16(%rax), %rax
	movq	(%rax,%rbx,8), %rdi
.LBB64_13:
	testq	%rdi, %rdi
	jne	.LBB64_21
.LBB64_14:
	movq	-16(%rbp), %rdi
	testq	%rdi, %rdi
	jne	.LBB64_21
# %bb.15:
.Ltmp258:
	leaq	-16(%rbp), %rcx
	movq	%rsi, %rdx
	callq	"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
.Ltmp259:
# %bb.16:
	cmpq	$-1, %rax
	je	.LBB64_17
# %bb.19:
	movq	-16(%rbp), %rcx
.Ltmp260:
	movq	%rcx, -24(%rbp)                 # 8-byte Spill
	callq	"?_Facet_Register@std@@YAXPEAV_Facet_base@1@@Z"
.Ltmp261:
# %bb.20:
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	movq	(%rcx), %rax
	callq	*8(%rax)
	movq	-16(%rbp), %rdi
	movq	%rdi, "?_Psave@?$_Facetptr@V?$ctype@D@std@@@std@@2PEBVfacet@locale@2@EB"(%rip)
	jmp	.LBB64_21
.LBB64_11:
	xorl	%edi, %edi
	testq	%rdi, %rdi
	je	.LBB64_14
.LBB64_21:
	leaq	-8(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
	movq	%rdi, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
.LBB64_17:
.Ltmp262:
	callq	"?_Throw_bad_cast@std@@YAXXZ"
.Ltmp263:
# %bb.18:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z")@IMGREL
	.section	.text,"xr",discard,"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
	.seh_endproc
	.def	"?dtor$22@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$22@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA":
.seh_proc "?dtor$22@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA"
.LBB64_22:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	64(%rdx), %rbp
	.seh_endprologue
	cmpq	$0, -24(%rbp)                   # 8-byte Folded Reload
	je	.LBB64_24
# %bb.23:
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	movq	(%rcx), %rax
	movl	$1, %edx
	callq	*(%rax)
.LBB64_24:
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
	.seh_endproc
	.def	"?dtor$25@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$25@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA":
.seh_proc "?dtor$25@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA"
.LBB64_25:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	64(%rdx), %rbp
	.seh_endprologue
	leaq	-8(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end39:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
	.p2align	2
"$cppxdata$??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	6                               # IPMapEntries
	.long	("$ip2state$??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z")@IMGREL # IPToStateXData
	.long	64                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z":
	.long	-1                              # ToState
	.long	"?dtor$25@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA"@IMGREL # Action
	.long	0                               # ToState
	.long	"?dtor$22@?0???$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z@4HA"@IMGREL # Action
"$ip2state$??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z":
	.long	.Lfunc_begin39@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp256@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp260@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp261@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp262@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp263@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
                                        # -- End function
	.def	"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
	.globl	"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z" # -- Begin function ??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z
	.p2align	4, 0x90
"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z": # @"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
.Lfunc_begin40:
.seh_proc "??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	64(%rsp), %rbp
	.seh_setframe %rbp, 64
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	leaq	-8(%rbp), %rcx
	xorl	%edx, %edx
	callq	"??0_Lockit@std@@QEAA@H@Z"
	movq	"?_Psave@?$_Facetptr@V?$numpunct@D@std@@@std@@2PEBVfacet@locale@2@EB"(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, "?id@?$numpunct@D@std@@2V0locale@2@A"(%rip)
	jne	.LBB65_4
# %bb.1:
	leaq	-32(%rbp), %rcx
	xorl	%edx, %edx
	callq	"??0_Lockit@std@@QEAA@H@Z"
	cmpq	$0, "?id@?$numpunct@D@std@@2V0locale@2@A"(%rip)
	jne	.LBB65_3
# %bb.2:
	movslq	"?_Id_cnt@id@locale@std@@0HA"(%rip), %rax
	incq	%rax
	movl	%eax, "?_Id_cnt@id@locale@std@@0HA"(%rip)
	movq	%rax, "?id@?$numpunct@D@std@@2V0locale@2@A"(%rip)
.LBB65_3:
	leaq	-32(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
.LBB65_4:
	movq	"?id@?$numpunct@D@std@@2V0locale@2@A"(%rip), %rbx
	movq	8(%rsi), %rax
	cmpq	%rbx, 24(%rax)
	jbe	.LBB65_5
# %bb.6:
	movq	16(%rax), %rcx
	movq	(%rcx,%rbx,8), %rdi
	testq	%rdi, %rdi
	jne	.LBB65_13
	jmp	.LBB65_8
.LBB65_5:
	xorl	%edi, %edi
	testq	%rdi, %rdi
	jne	.LBB65_13
.LBB65_8:
	cmpb	$0, 36(%rax)
	je	.LBB65_13
# %bb.9:
.Ltmp264:
	callq	"?_Getgloballocale@locale@std@@CAPEAV_Locimp@12@XZ"
.Ltmp265:
# %bb.10:
	cmpq	%rbx, 24(%rax)
	jbe	.LBB65_11
# %bb.12:
	movq	16(%rax), %rax
	movq	(%rax,%rbx,8), %rdi
.LBB65_13:
	testq	%rdi, %rdi
	jne	.LBB65_21
.LBB65_14:
	movq	-16(%rbp), %rdi
	testq	%rdi, %rdi
	jne	.LBB65_21
# %bb.15:
.Ltmp266:
	leaq	-16(%rbp), %rcx
	movq	%rsi, %rdx
	callq	"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
.Ltmp267:
# %bb.16:
	cmpq	$-1, %rax
	je	.LBB65_17
# %bb.19:
	movq	-16(%rbp), %rcx
.Ltmp268:
	movq	%rcx, -24(%rbp)                 # 8-byte Spill
	callq	"?_Facet_Register@std@@YAXPEAV_Facet_base@1@@Z"
.Ltmp269:
# %bb.20:
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	movq	(%rcx), %rax
	callq	*8(%rax)
	movq	-16(%rbp), %rdi
	movq	%rdi, "?_Psave@?$_Facetptr@V?$numpunct@D@std@@@std@@2PEBVfacet@locale@2@EB"(%rip)
	jmp	.LBB65_21
.LBB65_11:
	xorl	%edi, %edi
	testq	%rdi, %rdi
	je	.LBB65_14
.LBB65_21:
	leaq	-8(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
	movq	%rdi, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
.LBB65_17:
.Ltmp270:
	callq	"?_Throw_bad_cast@std@@YAXXZ"
.Ltmp271:
# %bb.18:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z")@IMGREL
	.section	.text,"xr",discard,"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
	.seh_endproc
	.def	"?dtor$22@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$22@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA":
.seh_proc "?dtor$22@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA"
.LBB65_22:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	64(%rdx), %rbp
	.seh_endprologue
	cmpq	$0, -24(%rbp)                   # 8-byte Folded Reload
	je	.LBB65_24
# %bb.23:
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	movq	(%rcx), %rax
	movl	$1, %edx
	callq	*(%rax)
.LBB65_24:
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
	.seh_endproc
	.def	"?dtor$25@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$25@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA":
.seh_proc "?dtor$25@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA"
.LBB65_25:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	64(%rdx), %rbp
	.seh_endprologue
	leaq	-8(%rbp), %rcx
	callq	"??1_Lockit@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end40:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
	.p2align	2
"$cppxdata$??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	6                               # IPMapEntries
	.long	("$ip2state$??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z")@IMGREL # IPToStateXData
	.long	64                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z":
	.long	-1                              # ToState
	.long	"?dtor$25@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA"@IMGREL # Action
	.long	0                               # ToState
	.long	"?dtor$22@?0???$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z@4HA"@IMGREL # Action
"$ip2state$??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z":
	.long	.Lfunc_begin40@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp264@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp268@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp269@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp270@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp271@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
                                        # -- End function
	.def	"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.globl	"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z" # -- Begin function ?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z
	.p2align	4, 0x90
"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z": # @"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
.Lfunc_begin41:
.seh_proc "?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$192, %rsp
	.seh_stackalloc 192
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 56(%rbp)
	testq	%rcx, %rcx
	je	.LBB66_8
# %bb.1:
	movq	%rcx, %rsi
	cmpq	$0, (%rcx)
	jne	.LBB66_8
# %bb.2:
	movq	%rdx, %rdi
	movl	$48, %ecx
	callq	"??2@YAPEAX_K@Z"
	movq	8(%rdi), %rdx
	testq	%rdx, %rdx
	movq	%rax, 48(%rbp)                  # 8-byte Spill
	je	.LBB66_3
# %bb.4:
	movq	40(%rdx), %rax
	addq	$48, %rdx
	testq	%rax, %rax
	cmovneq	%rax, %rdx
	jmp	.LBB66_5
.LBB66_3:
	leaq	"??_C@_00CNPNBAHC@?$AA@"(%rip), %rdx
.LBB66_5:
.Ltmp272:
	leaq	-88(%rbp), %rcx
	callq	"??0_Locinfo@std@@QEAA@PEBD@Z"
.Ltmp273:
# %bb.6:
	movq	48(%rbp), %rdi                  # 8-byte Reload
	movl	$0, 8(%rdi)
	leaq	"??_7?$ctype@D@std@@6B@"(%rip), %rax
	movq	%rax, (%rdi)
.Ltmp274:
	leaq	16(%rbp), %rcx
	callq	_Getctype
.Ltmp275:
# %bb.7:
	movups	16(%rbp), %xmm0
	movups	32(%rbp), %xmm1
	movups	%xmm1, 32(%rdi)
	movups	%xmm0, 16(%rdi)
	movq	%rdi, (%rsi)
	leaq	-88(%rbp), %rcx
	callq	"??1_Locinfo@std@@QEAA@XZ"
.LBB66_8:
	movl	$2, %eax
	addq	$192, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z")@IMGREL
	.section	.text,"xr",discard,"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_endproc
	.def	"?dtor$9@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$9@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA":
.seh_proc "?dtor$9@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"
.LBB66_9:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-88(%rbp), %rcx
	callq	"??1_Locinfo@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_endproc
	.def	"?dtor$10@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$10@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA":
.seh_proc "?dtor$10@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"
.LBB66_10:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	48(%rbp), %rcx                  # 8-byte Reload
	callq	"??3@YAXPEAX@Z"
	nop
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end41:
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.p2align	2
"$cppxdata$?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	4                               # IPMapEntries
	.long	("$ip2state$?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z")@IMGREL # IPToStateXData
	.long	184                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z":
	.long	-1                              # ToState
	.long	"?dtor$10@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"@IMGREL # Action
	.long	0                               # ToState
	.long	"?dtor$9@?0??_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"@IMGREL # Action
"$ip2state$?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z":
	.long	.Lfunc_begin41@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp272@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp274@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp275@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?_Getcat@?$ctype@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
                                        # -- End function
	.def	"??_G?$ctype@D@std@@MEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_G?$ctype@D@std@@MEAAPEAXI@Z"
	.globl	"??_G?$ctype@D@std@@MEAAPEAXI@Z" # -- Begin function ??_G?$ctype@D@std@@MEAAPEAXI@Z
	.p2align	4, 0x90
"??_G?$ctype@D@std@@MEAAPEAXI@Z":       # @"??_G?$ctype@D@std@@MEAAPEAXI@Z"
.seh_proc "??_G?$ctype@D@std@@MEAAPEAXI@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7?$ctype@D@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	cmpl	$0, 32(%rcx)
	jle	.LBB67_2
# %bb.1:
	movq	24(%rsi), %rcx
	callq	free
	jmp	.LBB67_5
.LBB67_2:
	jns	.LBB67_5
# %bb.3:
	movq	24(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB67_5
# %bb.4:
	callq	"??_V@YAXPEAX@Z"
.LBB67_5:
	movq	40(%rsi), %rcx
	callq	free
	testl	%edi, %edi
	je	.LBB67_7
# %bb.6:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB67_7:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
	.globl	"?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z" # -- Begin function ?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z
	.p2align	4, 0x90
"?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z": # @"?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
.seh_proc "?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, %rsi
	cmpq	%r8, %rdx
	je	.LBB68_3
# %bb.1:
	movq	%r8, %rdi
	movq	%rcx, %rbx
	addq	$16, %rbx
	.p2align	4, 0x90
.LBB68_2:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi), %ecx
	movq	%rbx, %rdx
	callq	_Tolower
	movb	%al, (%rsi)
	incq	%rsi
	cmpq	%rdi, %rsi
	jne	.LBB68_2
.LBB68_3:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_tolower@?$ctype@D@std@@MEBADD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_tolower@?$ctype@D@std@@MEBADD@Z"
	.globl	"?do_tolower@?$ctype@D@std@@MEBADD@Z" # -- Begin function ?do_tolower@?$ctype@D@std@@MEBADD@Z
	.p2align	4, 0x90
"?do_tolower@?$ctype@D@std@@MEBADD@Z":  # @"?do_tolower@?$ctype@D@std@@MEBADD@Z"
# %bb.0:
	leaq	16(%rcx), %rax
	movzbl	%dl, %ecx
	movq	%rax, %rdx
	jmp	_Tolower                        # TAILCALL
                                        # -- End function
	.def	"?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
	.globl	"?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z" # -- Begin function ?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z
	.p2align	4, 0x90
"?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z": # @"?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
.seh_proc "?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, %rsi
	cmpq	%r8, %rdx
	je	.LBB70_3
# %bb.1:
	movq	%r8, %rdi
	movq	%rcx, %rbx
	addq	$16, %rbx
	.p2align	4, 0x90
.LBB70_2:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi), %ecx
	movq	%rbx, %rdx
	callq	_Toupper
	movb	%al, (%rsi)
	incq	%rsi
	cmpq	%rdi, %rsi
	jne	.LBB70_2
.LBB70_3:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_toupper@?$ctype@D@std@@MEBADD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_toupper@?$ctype@D@std@@MEBADD@Z"
	.globl	"?do_toupper@?$ctype@D@std@@MEBADD@Z" # -- Begin function ?do_toupper@?$ctype@D@std@@MEBADD@Z
	.p2align	4, 0x90
"?do_toupper@?$ctype@D@std@@MEBADD@Z":  # @"?do_toupper@?$ctype@D@std@@MEBADD@Z"
# %bb.0:
	leaq	16(%rcx), %rax
	movzbl	%dl, %ecx
	movq	%rax, %rdx
	jmp	_Toupper                        # TAILCALL
                                        # -- End function
	.def	"?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z"
	.globl	"?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z" # -- Begin function ?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z
	.p2align	4, 0x90
"?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z": # @"?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z"
.seh_proc "?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%r9, %rcx
	movq	%r8, %rsi
	subq	%rdx, %r8
	callq	memcpy
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_widen@?$ctype@D@std@@MEBADD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_widen@?$ctype@D@std@@MEBADD@Z"
	.globl	"?do_widen@?$ctype@D@std@@MEBADD@Z" # -- Begin function ?do_widen@?$ctype@D@std@@MEBADD@Z
	.p2align	4, 0x90
"?do_widen@?$ctype@D@std@@MEBADD@Z":    # @"?do_widen@?$ctype@D@std@@MEBADD@Z"
# %bb.0:
	movl	%edx, %eax
	retq
                                        # -- End function
	.def	"?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z"
	.globl	"?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z" # -- Begin function ?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z
	.p2align	4, 0x90
"?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z": # @"?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z"
.seh_proc "?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%r8, %rsi
	movq	80(%rsp), %rcx
	subq	%rdx, %r8
	callq	memcpy
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_narrow@?$ctype@D@std@@MEBADDD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_narrow@?$ctype@D@std@@MEBADDD@Z"
	.globl	"?do_narrow@?$ctype@D@std@@MEBADDD@Z" # -- Begin function ?do_narrow@?$ctype@D@std@@MEBADDD@Z
	.p2align	4, 0x90
"?do_narrow@?$ctype@D@std@@MEBADDD@Z":  # @"?do_narrow@?$ctype@D@std@@MEBADDD@Z"
# %bb.0:
	movl	%edx, %eax
	retq
                                        # -- End function
	.def	"??_Gctype_base@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gctype_base@std@@UEAAPEAXI@Z"
	.globl	"??_Gctype_base@std@@UEAAPEAXI@Z" # -- Begin function ??_Gctype_base@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gctype_base@std@@UEAAPEAXI@Z":      # @"??_Gctype_base@std@@UEAAPEAXI@Z"
.seh_proc "??_Gctype_base@std@@UEAAPEAXI@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rcx, %rsi
	testl	%edx, %edx
	je	.LBB76_2
# %bb.1:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB76_2:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.globl	"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z" # -- Begin function ?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z
	.p2align	4, 0x90
"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z": # @"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
.Lfunc_begin42:
.seh_proc "?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$160, %rsp
	.seh_stackalloc 160
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 24(%rbp)
	testq	%rcx, %rcx
	je	.LBB77_8
# %bb.1:
	movq	%rcx, %rsi
	cmpq	$0, (%rcx)
	jne	.LBB77_8
# %bb.2:
	movq	%rdx, %rdi
	movl	$48, %ecx
	callq	"??2@YAPEAX_K@Z"
	movq	8(%rdi), %rdx
	testq	%rdx, %rdx
	movq	%rax, 16(%rbp)                  # 8-byte Spill
	je	.LBB77_3
# %bb.4:
	movq	40(%rdx), %rax
	addq	$48, %rdx
	testq	%rax, %rax
	cmovneq	%rax, %rdx
	jmp	.LBB77_5
.LBB77_3:
	leaq	"??_C@_00CNPNBAHC@?$AA@"(%rip), %rdx
.LBB77_5:
.Ltmp276:
	leaq	-88(%rbp), %rcx
	callq	"??0_Locinfo@std@@QEAA@PEBD@Z"
.Ltmp277:
# %bb.6:
	movq	16(%rbp), %rdi                  # 8-byte Reload
	movl	$0, 8(%rdi)
	leaq	"??_7?$numpunct@D@std@@6B@"(%rip), %rax
	movq	%rax, (%rdi)
.Ltmp278:
	leaq	-88(%rbp), %rdx
	movq	%rdi, %rcx
	movb	$1, %r8b
	callq	"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
.Ltmp279:
# %bb.7:
	movq	%rdi, (%rsi)
	leaq	-88(%rbp), %rcx
	callq	"??1_Locinfo@std@@QEAA@XZ"
.LBB77_8:
	movl	$4, %eax
	addq	$160, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z")@IMGREL
	.section	.text,"xr",discard,"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_endproc
	.def	"?dtor$9@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$9@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA":
.seh_proc "?dtor$9@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"
.LBB77_9:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-88(%rbp), %rcx
	callq	"??1_Locinfo@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_endproc
	.def	"?dtor$10@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$10@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA":
.seh_proc "?dtor$10@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"
.LBB77_10:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	16(%rbp), %rcx                  # 8-byte Reload
	callq	"??3@YAXPEAX@Z"
	nop
	addq	$32, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end42:
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
	.p2align	2
"$cppxdata$?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	4                               # IPMapEntries
	.long	("$ip2state$?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z")@IMGREL # IPToStateXData
	.long	152                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z":
	.long	-1                              # ToState
	.long	"?dtor$10@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"@IMGREL # Action
	.long	0                               # ToState
	.long	"?dtor$9@?0??_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z@4HA"@IMGREL # Action
"$ip2state$?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z":
	.long	.Lfunc_begin42@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp276@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp278@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp279@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?_Getcat@?$numpunct@D@std@@SA_KPEAPEBVfacet@locale@2@PEBV42@@Z"
                                        # -- End function
	.def	"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
	.globl	"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z" # -- Begin function ?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z
	.p2align	4, 0x90
"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z": # @"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
.Lfunc_begin43:
.seh_proc "?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$144, %rsp
	.seh_stackalloc 144
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 8(%rbp)
	movb	%r8b, %r15b
	movq	%rcx, %rsi
	callq	localeconv
	movq	%rax, %r14
	leaq	-96(%rbp), %rcx
	callq	_Getcvt
	movq	$0, 16(%rsi)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 32(%rsi)
	movq	%rsi, (%rbp)
.Ltmp280:
	leaq	-48(%rbp), %rcx
	callq	_Getcvt
.Ltmp281:
# %bb.1:
	testb	%r15b, %r15b
	je	.LBB78_3
# %bb.2:
	leaq	"??_C@_00CNPNBAHC@?$AA@"(%rip), %r12
	jmp	.LBB78_4
.LBB78_3:
	movq	16(%r14), %r12
.LBB78_4:
	movq	%r12, %rcx
	callq	strlen
	movq	%rax, %rbx
	incq	%rbx
	movl	$1, %edx
	movq	%rbx, %rcx
	callq	calloc
	testq	%rax, %rax
	je	.LBB78_11
# %bb.5:
	movq	%rax, %rdi
	testq	%rbx, %rbx
	je	.LBB78_7
# %bb.6:
	movq	%rdi, %rcx
	movq	%r12, %rdx
	movq	%rbx, %r8
	callq	memcpy
.LBB78_7:
	movq	%rdi, 16(%rsi)
	movl	$6, %ecx
	movl	$1, %edx
	callq	calloc
	testq	%rax, %rax
	je	.LBB78_13
# %bb.8:
	leaq	32(%rsi), %rcx
	movw	$101, 4(%rax)
	movl	$1936482662, (%rax)             # imm = 0x736C6166
	movq	%rax, (%rcx)
	movl	$5, %ecx
	movl	$1, %edx
	callq	calloc
	testq	%rax, %rax
	je	.LBB78_15
# %bb.9:
	movb	$0, 4(%rax)
	movl	$1702195828, (%rax)             # imm = 0x65757274
	movq	%rax, 40(%rsi)
	movq	$0, (%rbp)
	testb	%r15b, %r15b
	je	.LBB78_17
# %bb.10:
	movb	$46, 24(%rsi)
	movb	$44, %al
	jmp	.LBB78_18
.LBB78_17:
	movq	(%r14), %rax
	movzbl	(%rax), %eax
	movb	%al, 24(%rsi)
	movq	8(%r14), %rax
	movzbl	(%rax), %eax
.LBB78_18:
	movb	%al, 25(%rsi)
	addq	$144, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB78_11:
.Ltmp286:
	callq	"?_Xbad_alloc@std@@YAXXZ"
.Ltmp287:
# %bb.12:
.LBB78_13:
.Ltmp284:
	callq	"?_Xbad_alloc@std@@YAXXZ"
.Ltmp285:
# %bb.14:
.LBB78_15:
.Ltmp282:
	callq	"?_Xbad_alloc@std@@YAXXZ"
.Ltmp283:
# %bb.16:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z")@IMGREL
	.section	.text,"xr",discard,"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
	.seh_endproc
	.def	"?dtor$19@?0??_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$19@?0??_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z@4HA":
.seh_proc "?dtor$19@?0??_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z@4HA"
.LBB78_19:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	%rbp, %rcx
	callq	"??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ"
	nop
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end43:
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
	.p2align	2
"$cppxdata$?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	5                               # IPMapEntries
	.long	("$ip2state$?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z")@IMGREL # IPToStateXData
	.long	136                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z":
	.long	-1                              # ToState
	.long	"?dtor$19@?0??_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z@4HA"@IMGREL # Action
"$ip2state$?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z":
	.long	.Lfunc_begin43@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp280@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp281@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp286@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp283@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?_Init@?$numpunct@D@std@@IEAAXAEBV_Locinfo@2@_N@Z"
                                        # -- End function
	.def	"??_G?$numpunct@D@std@@MEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_G?$numpunct@D@std@@MEAAPEAXI@Z"
	.globl	"??_G?$numpunct@D@std@@MEAAPEAXI@Z" # -- Begin function ??_G?$numpunct@D@std@@MEAAPEAXI@Z
	.p2align	4, 0x90
"??_G?$numpunct@D@std@@MEAAPEAXI@Z":    # @"??_G?$numpunct@D@std@@MEAAPEAXI@Z"
.seh_proc "??_G?$numpunct@D@std@@MEAAPEAXI@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7?$numpunct@D@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	movq	16(%rcx), %rcx
	callq	free
	movq	32(%rsi), %rcx
	callq	free
	movq	40(%rsi), %rcx
	callq	free
	testl	%edi, %edi
	je	.LBB79_2
# %bb.1:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB79_2:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"?do_decimal_point@?$numpunct@D@std@@MEBADXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_decimal_point@?$numpunct@D@std@@MEBADXZ"
	.globl	"?do_decimal_point@?$numpunct@D@std@@MEBADXZ" # -- Begin function ?do_decimal_point@?$numpunct@D@std@@MEBADXZ
	.p2align	4, 0x90
"?do_decimal_point@?$numpunct@D@std@@MEBADXZ": # @"?do_decimal_point@?$numpunct@D@std@@MEBADXZ"
# %bb.0:
	movzbl	24(%rcx), %eax
	retq
                                        # -- End function
	.def	"?do_thousands_sep@?$numpunct@D@std@@MEBADXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_thousands_sep@?$numpunct@D@std@@MEBADXZ"
	.globl	"?do_thousands_sep@?$numpunct@D@std@@MEBADXZ" # -- Begin function ?do_thousands_sep@?$numpunct@D@std@@MEBADXZ
	.p2align	4, 0x90
"?do_thousands_sep@?$numpunct@D@std@@MEBADXZ": # @"?do_thousands_sep@?$numpunct@D@std@@MEBADXZ"
# %bb.0:
	movzbl	25(%rcx), %eax
	retq
                                        # -- End function
	.def	"?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
	.globl	"?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ" # -- Begin function ?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ
	.p2align	4, 0x90
"?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ": # @"?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
.seh_proc "?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, %rsi
	movq	16(%rcx), %r14
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rdx)
	movups	%xmm0, (%rdx)
	movq	%r14, %rcx
	callq	strlen
	testq	%rax, %rax
	js	.LBB82_9
# %bb.1:
	movq	%rax, %rdi
	cmpq	$15, %rax
	ja	.LBB82_3
# %bb.2:
	movq	%rdi, 16(%rsi)
	movq	$15, 24(%rsi)
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rsi, %rdi
	jmp	.LBB82_8
.LBB82_3:
	movq	$15, 24(%rsi)
	movq	%rdi, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %r15      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %r15
	leaq	1(%r15), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB82_6
# %bb.4:
	cmpq	$-39, %rcx
	jae	.LBB82_10
# %bb.5:
	leaq	40(%r15), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rbx
	andq	$-32, %rbx
	movq	%rax, -8(%rbx)
	jmp	.LBB82_7
.LBB82_6:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rbx
.LBB82_7:
	movq	%rbx, (%rsi)
	movq	%rdi, 16(%rsi)
	movq	%r15, 24(%rsi)
	movq	%rbx, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rbx, %rdi
.LBB82_8:
	movb	$0, (%rdi)
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
.LBB82_9:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB82_10:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
	int3
	.seh_endproc
                                        # -- End function
	.def	"?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
	.globl	"?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ" # -- Begin function ?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ
	.p2align	4, 0x90
"?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ": # @"?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
.seh_proc "?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, %rsi
	movq	32(%rcx), %r14
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rdx)
	movups	%xmm0, (%rdx)
	movq	%r14, %rcx
	callq	strlen
	testq	%rax, %rax
	js	.LBB83_9
# %bb.1:
	movq	%rax, %rdi
	cmpq	$15, %rax
	ja	.LBB83_3
# %bb.2:
	movq	%rdi, 16(%rsi)
	movq	$15, 24(%rsi)
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rsi, %rdi
	jmp	.LBB83_8
.LBB83_3:
	movq	$15, 24(%rsi)
	movq	%rdi, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %r15      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %r15
	leaq	1(%r15), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB83_6
# %bb.4:
	cmpq	$-39, %rcx
	jae	.LBB83_10
# %bb.5:
	leaq	40(%r15), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rbx
	andq	$-32, %rbx
	movq	%rax, -8(%rbx)
	jmp	.LBB83_7
.LBB83_6:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rbx
.LBB83_7:
	movq	%rbx, (%rsi)
	movq	%rdi, 16(%rsi)
	movq	%r15, 24(%rsi)
	movq	%rbx, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rbx, %rdi
.LBB83_8:
	movb	$0, (%rdi)
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
.LBB83_9:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB83_10:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
	int3
	.seh_endproc
                                        # -- End function
	.def	"?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
	.globl	"?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ" # -- Begin function ?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ
	.p2align	4, 0x90
"?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ": # @"?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
.seh_proc "?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
# %bb.0:
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, %rsi
	movq	40(%rcx), %r14
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rdx)
	movups	%xmm0, (%rdx)
	movq	%r14, %rcx
	callq	strlen
	testq	%rax, %rax
	js	.LBB84_9
# %bb.1:
	movq	%rax, %rdi
	cmpq	$15, %rax
	ja	.LBB84_3
# %bb.2:
	movq	%rdi, 16(%rsi)
	movq	$15, 24(%rsi)
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rsi, %rdi
	jmp	.LBB84_8
.LBB84_3:
	movq	$15, 24(%rsi)
	movq	%rdi, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %r15      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %r15
	leaq	1(%r15), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB84_6
# %bb.4:
	cmpq	$-39, %rcx
	jae	.LBB84_10
# %bb.5:
	leaq	40(%r15), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rbx
	andq	$-32, %rbx
	movq	%rax, -8(%rbx)
	jmp	.LBB84_7
.LBB84_6:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rbx
.LBB84_7:
	movq	%rbx, (%rsi)
	movq	%rdi, 16(%rsi)
	movq	%r15, 24(%rsi)
	movq	%rbx, %rcx
	movq	%r14, %rdx
	movq	%rdi, %r8
	callq	memcpy
	addq	%rbx, %rdi
.LBB84_8:
	movb	$0, (%rdi)
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
.LBB84_9:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB84_10:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
	int3
	.seh_endproc
                                        # -- End function
	.def	"??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ"
	.globl	"??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ" # -- Begin function ??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ
	.p2align	4, 0x90
"??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ": # @"??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ"
.seh_proc "??1?$_Tidy_guard@V?$numpunct@D@std@@@std@@QEAA@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	(%rcx), %rsi
	testq	%rsi, %rsi
	je	.LBB85_1
# %bb.2:
	movq	16(%rsi), %rcx
	callq	free
	movq	32(%rsi), %rcx
	callq	free
	movq	40(%rsi), %rcx
	addq	$32, %rsp
	popq	%rsi
	jmp	free                            # TAILCALL
.LBB85_1:
	nop
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
	.globl	"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z" # -- Begin function ??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z
	.p2align	4, 0x90
"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z": # @"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
.Lfunc_begin44:
.seh_proc "??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	16(%rcx), %rbx
	movabsq	$9223372036854775807, %rdi      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rbx, %rax
	xorq	%rdi, %rax
	cmpq	%rdx, %rax
	jb	.LBB86_20
# %bb.1:
	movq	%r9, %r12
	movq	%rdx, %rsi
	movq	%rcx, %r15
	addq	%rbx, %rsi
	movq	24(%rcx), %r13
	movq	%rsi, %rax
	orq	$15, %rax
	js	.LBB86_4
# %bb.2:
	movq	%r13, %rcx
	shrq	%rcx
	movabsq	$9223372036854775807, %rdi      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rcx, %rdx
	xorq	%rdi, %rdx
	cmpq	%r13, %rdx
	jb	.LBB86_4
# %bb.3:
	addq	%r13, %rcx
	cmpq	%rcx, %rax
	cmovaq	%rax, %rcx
	movq	%rcx, %rdi
.LBB86_4:
	leaq	1(%rdi), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB86_7
# %bb.5:
	cmpq	$-39, %rcx
	jae	.LBB86_21
# %bb.6:
	leaq	40(%rdi), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %r14
	andq	$-32, %r14
	movq	%rax, -8(%r14)
	jmp	.LBB86_10
.LBB86_7:
	testq	%rcx, %rcx
	je	.LBB86_8
# %bb.9:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %r14
	jmp	.LBB86_10
.LBB86_8:
	xorl	%r14d, %r14d
.LBB86_10:
	movq	%rsi, 16(%r15)
	movq	%rdi, 24(%r15)
	cmpq	$16, %r13
	jb	.LBB86_18
# %bb.11:
	movq	(%r15), %rsi
	movq	%r14, %rcx
	movq	%rsi, %rdx
	movq	%r12, %r8
	callq	memcpy
	movq	%r13, %rdi
	leaq	(%r14,%r12), %r13
	movq	%r13, %rcx
	movzbl	120(%rbp), %edx
	movq	112(%rbp), %r8
	callq	memset
	subq	%r12, %rbx
	incq	%rbx
	addq	%rsi, %r12
	addq	112(%rbp), %r13
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rbx, %r8
	callq	memcpy
	leaq	1(%rdi), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB86_17
# %bb.12:
	movq	-8(%rsi), %rax
	addq	$-8, %rsi
	subq	%rax, %rsi
	cmpq	$32, %rsi
	jae	.LBB86_13
# %bb.16:
	addq	$40, %rdi
	movq	%rdi, %rdx
	movq	%rax, %rsi
.LBB86_17:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX_K@Z"
	jmp	.LBB86_19
.LBB86_18:
	movq	%r14, %rcx
	movq	%r15, %rdx
	movq	%r12, %r8
	callq	memcpy
	leaq	(%r14,%r12), %rsi
	movq	%rsi, %rcx
	movzbl	120(%rbp), %edx
	movq	112(%rbp), %rdi
	movq	%rdi, %r8
	callq	memset
	subq	%r12, %rbx
	incq	%rbx
	addq	%r15, %r12
	addq	%rdi, %rsi
	movq	%rsi, %rcx
	movq	%r12, %rdx
	movq	%rbx, %r8
	callq	memcpy
.LBB86_19:
	movq	%r14, (%r15)
	movq	%r15, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB86_20:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB86_21:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB86_13:
.Ltmp288:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp289:
# %bb.14:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
	.seh_endproc
	.def	"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z@4HA":
.seh_proc "?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z@4HA"
.LBB86_15:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end44:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
	.p2align	2
"$cppxdata$??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z":
	.long	-1                              # ToState
	.long	"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z@4HA"@IMGREL # Action
"$ip2state$??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z":
	.long	.Lfunc_begin44@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp288@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp289@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
                                        # -- End function
	.def	"?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ"
	.globl	"?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ" # -- Begin function ?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ
	.p2align	4, 0x90
"?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ": # @"?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ"
.seh_proc "?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	leaq	"??_C@_0BI@CFPLBAOH@invalid?5string?5position?$AA@"(%rip), %rcx
	callq	"?_Xout_of_range@std@@YAXPEBD@Z"
	int3
	.seh_endproc
                                        # -- End function
	.def	__local_stdio_printf_options;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,__local_stdio_printf_options
	.globl	__local_stdio_printf_options    # -- Begin function __local_stdio_printf_options
	.p2align	4, 0x90
__local_stdio_printf_options:           # @__local_stdio_printf_options
# %bb.0:
	leaq	"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"(%rip), %rax
	retq
                                        # -- End function
	.def	"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.globl	"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z" # -- Begin function ?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z
	.p2align	4, 0x90
"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z": # @"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
.Lfunc_begin45:
.seh_proc "?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$216, %rsp
	.seh_stackalloc 216
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 80(%rbp)
	movq	%r9, %r12
	movq	%rdx, %rbx
	movq	208(%rbp), %rcx
	movq	200(%rbp), %r13
	testq	%rcx, %rcx
	je	.LBB89_1
# %bb.2:
	movzbl	(%r13), %eax
	addb	$-43, %al
	testb	$-3, %al
	sete	%al
	jmp	.LBB89_3
.LBB89_1:
	xorl	%eax, %eax
.LBB89_3:
	movzbl	%al, %edi
	movl	24(%r12), %eax
	notl	%eax
	testl	$12288, %eax                    # imm = 0x3000
	movq	%r8, 24(%rbp)                   # 8-byte Spill
	movq	%rbx, -72(%rbp)                 # 8-byte Spill
	movq	%rdi, 16(%rbp)                  # 8-byte Spill
	jne	.LBB89_4
# %bb.5:
	leaq	2(%rdi), %rax
	leaq	"??_C@_02OOPEBDOJ@pP?$AA@"(%rip), %rdx
	cmpq	%rcx, %rax
	ja	.LBB89_9
# %bb.6:
	cmpb	$48, (%r13,%rdi)
	jne	.LBB89_9
# %bb.7:
	movzbl	1(%rdi,%r13), %ecx
	orl	$32, %ecx
	cmpl	$120, %ecx
	jne	.LBB89_9
# %bb.8:
	movq	%rax, 16(%rbp)                  # 8-byte Spill
	jmp	.LBB89_9
.LBB89_4:
	leaq	"??_C@_02MDKMJEGG@eE?$AA@"(%rip), %rdx
.LBB89_9:
	movq	%r13, %rcx
	callq	strcspn
	movq	%rax, %rsi
	movw	$46, 78(%rbp)
	callq	localeconv
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movb	%al, 78(%rbp)
	leaq	78(%rbp), %rdx
	movq	%r13, %rcx
	callq	strcspn
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	movq	64(%r12), %rax
	movq	8(%rax), %rcx
	movq	%rcx, 40(%rbp)
	movq	(%rcx), %rax
	callq	*8(%rax)
.Ltmp290:
	leaq	32(%rbp), %r14
	movq	%r14, %rcx
	callq	"??$use_facet@V?$ctype@D@std@@@std@@YAAEBV?$ctype@D@0@AEBVlocale@0@@Z"
.Ltmp291:
# %bb.10:
	movq	%rax, %r15
	movq	40(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB89_13
# %bb.11:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB89_13
# %bb.12:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB89_13:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 48(%rbp)
	movaps	%xmm0, 32(%rbp)
	movq	208(%rbp), %r8
	testq	%r8, %r8
	js	.LBB89_157
# %bb.14:
	cmpq	$15, %r8
	movq	%r12, -32(%rbp)                 # 8-byte Spill
	ja	.LBB89_16
# %bb.15:
	movq	%r13, %r12
	movq	%r8, 48(%rbp)
	movq	$15, 56(%rbp)
	leaq	32(%rbp), %rcx
	xorl	%edx, %edx
	callq	memset
	movq	208(%rbp), %r13
	leaq	32(,%r13), %rdi
	addq	%rbp, %rdi
	jmp	.LBB89_21
.LBB89_16:
	movq	$15, 56(%rbp)
	movq	%r8, %rax
	orq	$15, %rax
	cmpq	$23, %rax
	movl	$22, %ecx
	cmovaeq	%rax, %rcx
	testq	%rax, %rax
	movabsq	$9223372036854775807, %rbx      # imm = 0x7FFFFFFFFFFFFFFF
	cmovnsq	%rcx, %rbx
	leaq	1(%rbx), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB89_19
# %bb.17:
	cmpq	$-39, %rcx
	jae	.LBB89_158
# %bb.18:
	movq	%r13, %r12
	leaq	40(%rbx), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rdi
	andq	$-32, %rdi
	movq	%rax, -8(%rdi)
	jmp	.LBB89_20
.LBB89_19:
	movq	%r13, %r12
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rdi
.LBB89_20:
	movq	%rdi, 32(%rbp)
	movq	208(%rbp), %r13
	movq	%r13, 48(%rbp)
	movq	%rbx, 56(%rbp)
	movq	%rdi, %rcx
	xorl	%edx, %edx
	movq	%r13, %r8
	callq	memset
	addq	%r13, %rdi
.LBB89_21:
	movb	$0, (%rdi)
	cmpq	$16, 56(%rbp)
	jb	.LBB89_23
# %bb.22:
	movq	32(%rbp), %r14
.LBB89_23:
	leaq	(%r12,%r13), %r8
	movq	(%r15), %rax
.Ltmp292:
	movq	%r15, %rcx
	movq	%r12, %rdx
	movq	%r14, %r9
	callq	*56(%rax)
.Ltmp293:
	movq	-32(%rbp), %rax                 # 8-byte Reload
# %bb.24:
	movq	64(%rax), %rax
	movq	8(%rax), %rcx
	movq	%rcx, -56(%rbp)
	movq	(%rcx), %rax
	callq	*8(%rax)
.Ltmp294:
	leaq	-64(%rbp), %rcx
	callq	"??$use_facet@V?$numpunct@D@std@@@std@@YAAEBV?$numpunct@D@0@AEBVlocale@0@@Z"
.Ltmp295:
# %bb.25:
	movq	%rax, %rdi
	movq	-56(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB89_28
# %bb.26:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB89_28
# %bb.27:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB89_28:
	movq	(%rdi), %rax
.Ltmp296:
	leaq	-64(%rbp), %rbx
	movq	%rdi, %rcx
	movq	%rbx, %rdx
	callq	*40(%rax)
.Ltmp297:
# %bb.29:
	movq	(%rdi), %rax
.Ltmp298:
	movq	%rdi, %rcx
	callq	*32(%rax)
.Ltmp299:
	movq	-80(%rbp), %r14                 # 8-byte Reload
# %bb.30:
	movl	%eax, %r13d
	cmpq	208(%rbp), %r14
	je	.LBB89_36
# %bb.31:
	movq	(%rdi), %rax
.Ltmp300:
	movq	%rdi, %rcx
	callq	*24(%rax)
.Ltmp301:
# %bb.32:
	cmpq	$16, 56(%rbp)
	jb	.LBB89_33
# %bb.34:
	movq	32(%rbp), %rcx
	jmp	.LBB89_35
.LBB89_33:
	leaq	32(%rbp), %rcx
.LBB89_35:
	movb	%al, (%rcx,%r14)
	movq	%r14, %rsi
.LBB89_36:
	cmpq	$16, -40(%rbp)
	jb	.LBB89_38
# %bb.37:
	movq	-64(%rbp), %rbx
.LBB89_38:
	leaq	32(%rbp), %r14
	.p2align	4, 0x90
.LBB89_39:                              # =>This Inner Loop Header: Depth=1
	movsbq	(%rbx), %rax
	leal	-1(%rax), %ecx
	cmpb	$125, %cl
	ja	.LBB89_59
# %bb.40:                               #   in Loop: Header=BB89_39 Depth=1
	movq	%rsi, %rcx
	subq	16(%rbp), %rcx                  # 8-byte Folded Reload
	cmpq	%rax, %rcx
	jbe	.LBB89_59
# %bb.41:                               #   in Loop: Header=BB89_39 Depth=1
	subq	%rax, %rsi
	movq	48(%rbp), %rax
	movq	%rax, %r8
	subq	%rsi, %r8
	jb	.LBB89_42
# %bb.52:                               #   in Loop: Header=BB89_39 Depth=1
	movq	56(%rbp), %rcx
	cmpq	%rax, %rcx
	jne	.LBB89_53
# %bb.56:                               #   in Loop: Header=BB89_39 Depth=1
.Ltmp320:
	movb	%r13b, 40(%rsp)
	movq	$1, 32(%rsp)
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%rsi, %r9
	callq	"??$_Reallocate_grow_by@V<lambda_1>@?0??insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_K0D@Z@_K_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??insert@01@QEAAAEAV01@00D@Z@_K2D@Z"
.Ltmp321:
# %bb.57:                               #   in Loop: Header=BB89_39 Depth=1
	cmpb	$0, 1(%rbx)
	jle	.LBB89_39
	jmp	.LBB89_58
	.p2align	4, 0x90
.LBB89_53:                              #   in Loop: Header=BB89_39 Depth=1
	incq	%rax
	movq	%rax, 48(%rbp)
	movq	%r14, %rdi
	cmpq	$16, %rcx
	jb	.LBB89_55
# %bb.54:                               #   in Loop: Header=BB89_39 Depth=1
	movq	32(%rbp), %rdi
.LBB89_55:                              #   in Loop: Header=BB89_39 Depth=1
	leaq	(%rdi,%rsi), %rdx
	incq	%r8
	leaq	(%rdi,%rsi), %rcx
	incq	%rcx
	callq	memmove
	movb	%r13b, (%rdi,%rsi)
	cmpb	$0, 1(%rbx)
	jle	.LBB89_39
.LBB89_58:                              #   in Loop: Header=BB89_39 Depth=1
	incq	%rbx
	jmp	.LBB89_39
.LBB89_59:
	movq	48(%rbp), %r12
	movq	-32(%rbp), %rdx                 # 8-byte Reload
	movq	40(%rdx), %rax
	xorl	%ecx, %ecx
	movq	%rax, %r13
	subq	%r12, %r13
	cmovbeq	%rcx, %r13
	testq	%rax, %rax
	cmovleq	%rcx, %r13
	movl	$448, %eax                      # imm = 0x1C0
	andl	24(%rdx), %eax
	cmpl	$64, %eax
	je	.LBB89_107
# %bb.60:
	cmpl	$256, %eax                      # imm = 0x100
	movq	24(%rbp), %rbx                  # 8-byte Reload
	jne	.LBB89_61
# %bb.86:
	movq	32(%rbp), %rax
	movq	56(%rbp), %rcx
	movzbl	(%rbx), %r15d
	movl	4(%rbx), %edx
	movl	%edx, 11(%rbp)
	movl	1(%rbx), %edx
	movl	%edx, 8(%rbp)
	movq	8(%rbx), %r14
	movq	16(%rbp), %rsi                  # 8-byte Reload
	testq	%rsi, %rsi
	je	.LBB89_96
# %bb.87:
	cmpq	$16, %rcx
	leaq	32(%rbp), %rbx
	cmovaeq	%rax, %rbx
	jmp	.LBB89_88
	.p2align	4, 0x90
.LBB89_94:                              #   in Loop: Header=BB89_88 Depth=1
	movb	$1, %r15b
.LBB89_95:                              #   in Loop: Header=BB89_88 Depth=1
	incq	%rbx
	decq	%rsi
	je	.LBB89_96
.LBB89_88:                              # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	je	.LBB89_94
# %bb.89:                               #   in Loop: Header=BB89_88 Depth=1
	movzbl	(%rbx), %r8d
	movzbl	%r8b, %eax
	movq	64(%r14), %rdx
	movq	(%rdx), %rcx
	testq	%rcx, %rcx
	je	.LBB89_92
# %bb.90:                               #   in Loop: Header=BB89_88 Depth=1
	movq	88(%r14), %r9
	movl	(%r9), %edi
	testl	%edi, %edi
	jle	.LBB89_92
# %bb.91:                               #   in Loop: Header=BB89_88 Depth=1
	decl	%edi
	movl	%edi, (%r9)
	leaq	1(%rcx), %rdi
	movq	%rdi, (%rdx)
	movb	%r8b, (%rcx)
	jmp	.LBB89_93
	.p2align	4, 0x90
.LBB89_92:                              #   in Loop: Header=BB89_88 Depth=1
	movq	(%r14), %rdi
.Ltmp304:
	movq	%r14, %rcx
	movl	%eax, %edx
	callq	*24(%rdi)
.Ltmp305:
.LBB89_93:                              #   in Loop: Header=BB89_88 Depth=1
	cmpl	$-1, %eax
	jne	.LBB89_95
	jmp	.LBB89_94
.LBB89_107:
	movq	32(%rbp), %rax
	movq	56(%rbp), %rcx
	movq	24(%rbp), %rbx                  # 8-byte Reload
	movzbl	(%rbx), %r15d
	movl	4(%rbx), %edx
	movl	%edx, -21(%rbp)
	movl	1(%rbx), %edx
	movl	%edx, -24(%rbp)
	movq	8(%rbx), %r14
	movq	16(%rbp), %rsi                  # 8-byte Reload
	testq	%rsi, %rsi
	je	.LBB89_117
# %bb.108:
	cmpq	$16, %rcx
	leaq	32(%rbp), %rbx
	cmovaeq	%rax, %rbx
	jmp	.LBB89_109
	.p2align	4, 0x90
.LBB89_115:                             #   in Loop: Header=BB89_109 Depth=1
	movb	$1, %r15b
.LBB89_116:                             #   in Loop: Header=BB89_109 Depth=1
	incq	%rbx
	decq	%rsi
	je	.LBB89_117
.LBB89_109:                             # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	je	.LBB89_115
# %bb.110:                              #   in Loop: Header=BB89_109 Depth=1
	movzbl	(%rbx), %r8d
	movzbl	%r8b, %eax
	movq	64(%r14), %rdx
	movq	(%rdx), %rcx
	testq	%rcx, %rcx
	je	.LBB89_113
# %bb.111:                              #   in Loop: Header=BB89_109 Depth=1
	movq	88(%r14), %r9
	movl	(%r9), %edi
	testl	%edi, %edi
	jle	.LBB89_113
# %bb.112:                              #   in Loop: Header=BB89_109 Depth=1
	decl	%edi
	movl	%edi, (%r9)
	leaq	1(%rcx), %rdi
	movq	%rdi, (%rdx)
	movb	%r8b, (%rcx)
	jmp	.LBB89_114
	.p2align	4, 0x90
.LBB89_113:                             #   in Loop: Header=BB89_109 Depth=1
	movq	(%r14), %rdi
.Ltmp302:
	movq	%r14, %rcx
	movl	%eax, %edx
	callq	*24(%rdi)
.Ltmp303:
.LBB89_114:                             #   in Loop: Header=BB89_109 Depth=1
	cmpl	$-1, %eax
	jne	.LBB89_116
	jmp	.LBB89_115
.LBB89_61:
	movzbl	(%rbx), %r15d
	movl	4(%rbx), %eax
	movl	%eax, 3(%rbp)
	movl	1(%rbx), %eax
	movl	%eax, (%rbp)
	movq	8(%rbx), %r14
	testq	%r13, %r13
	je	.LBB89_71
# %bb.62:
	movzbl	192(%rbp), %esi
	jmp	.LBB89_63
	.p2align	4, 0x90
.LBB89_69:                              #   in Loop: Header=BB89_63 Depth=1
	movb	$1, %r15b
.LBB89_70:                              #   in Loop: Header=BB89_63 Depth=1
	decq	%r13
	je	.LBB89_71
.LBB89_63:                              # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	je	.LBB89_69
# %bb.64:                               #   in Loop: Header=BB89_63 Depth=1
	movq	64(%r14), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB89_67
# %bb.65:                               #   in Loop: Header=BB89_63 Depth=1
	movq	88(%r14), %rdx
	movl	(%rdx), %ebx
	testl	%ebx, %ebx
	jle	.LBB89_67
# %bb.66:                               #   in Loop: Header=BB89_63 Depth=1
	decl	%ebx
	movl	%ebx, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	192(%rbp), %eax
	movb	%al, (%rcx)
	movl	%esi, %eax
	jmp	.LBB89_68
	.p2align	4, 0x90
.LBB89_67:                              #   in Loop: Header=BB89_63 Depth=1
	movq	(%r14), %rax
.Ltmp308:
	movq	%r14, %rcx
	movl	%esi, %edx
	callq	*24(%rax)
.Ltmp309:
.LBB89_68:                              #   in Loop: Header=BB89_63 Depth=1
	cmpl	$-1, %eax
	jne	.LBB89_70
	jmp	.LBB89_69
.LBB89_96:
	movq	24(%rbp), %rdx                  # 8-byte Reload
	leaq	1(%rdx), %rdi
	movb	%r15b, (%rdx)
	movl	8(%rbp), %eax
	movl	11(%rbp), %ecx
	movl	%ecx, 3(%rdi)
	movl	%eax, (%rdi)
	movq	%r14, 8(%rdx)
	testq	%r13, %r13
	je	.LBB89_106
# %bb.97:
	movzbl	192(%rbp), %esi
	jmp	.LBB89_98
	.p2align	4, 0x90
.LBB89_104:                             #   in Loop: Header=BB89_98 Depth=1
	movb	$1, %r15b
.LBB89_105:                             #   in Loop: Header=BB89_98 Depth=1
	decq	%r13
	je	.LBB89_106
.LBB89_98:                              # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	je	.LBB89_104
# %bb.99:                               #   in Loop: Header=BB89_98 Depth=1
	movq	64(%r14), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB89_102
# %bb.100:                              #   in Loop: Header=BB89_98 Depth=1
	movq	88(%r14), %rdx
	movl	(%rdx), %ebx
	testl	%ebx, %ebx
	jle	.LBB89_102
# %bb.101:                              #   in Loop: Header=BB89_98 Depth=1
	decl	%ebx
	movl	%ebx, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	192(%rbp), %eax
	movb	%al, (%rcx)
	movl	%esi, %eax
	jmp	.LBB89_103
	.p2align	4, 0x90
.LBB89_102:                             #   in Loop: Header=BB89_98 Depth=1
	movq	(%r14), %rax
.Ltmp306:
	movq	%r14, %rcx
	movl	%esi, %edx
	callq	*24(%rax)
.Ltmp307:
.LBB89_103:                             #   in Loop: Header=BB89_98 Depth=1
	cmpl	$-1, %eax
	jne	.LBB89_105
	jmp	.LBB89_104
.LBB89_117:
	movq	24(%rbp), %rbx                  # 8-byte Reload
	leaq	1(%rbx), %rax
	movb	%r15b, (%rbx)
	movl	-24(%rbp), %ecx
	movl	-21(%rbp), %edx
	movl	%edx, 3(%rax)
	movl	%ecx, (%rax)
	movq	%r14, 8(%rbx)
	jmp	.LBB89_118
.LBB89_71:
	movq	24(%rbp), %rdx                  # 8-byte Reload
	leaq	1(%rdx), %r13
	movb	%r15b, (%rdx)
	movl	(%rbp), %eax
	movl	3(%rbp), %ecx
	movl	%ecx, 3(%r13)
	movl	%eax, (%r13)
	movq	%r14, 8(%rdx)
	cmpq	$0, 16(%rbp)                    # 8-byte Folded Reload
	je	.LBB89_84
# %bb.72:
	cmpq	$16, 56(%rbp)
	jb	.LBB89_73
# %bb.74:
	movq	32(%rbp), %rdi
	jmp	.LBB89_75
.LBB89_106:
	movq	24(%rbp), %rbx                  # 8-byte Reload
	movb	%r15b, (%rbx)
	movl	8(%rbp), %eax
	movl	11(%rbp), %ecx
	movl	%ecx, 3(%rdi)
	movl	%eax, (%rdi)
	jmp	.LBB89_85
.LBB89_73:
	leaq	32(%rbp), %rdi
.LBB89_75:
	movq	16(%rbp), %rbx                  # 8-byte Reload
	jmp	.LBB89_76
	.p2align	4, 0x90
.LBB89_82:                              #   in Loop: Header=BB89_76 Depth=1
	movb	$1, %r15b
.LBB89_83:                              #   in Loop: Header=BB89_76 Depth=1
	incq	%rdi
	decq	%rbx
	je	.LBB89_84
.LBB89_76:                              # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	je	.LBB89_82
# %bb.77:                               #   in Loop: Header=BB89_76 Depth=1
	movzbl	(%rdi), %r9d
	movzbl	%r9b, %eax
	movq	64(%r14), %rdx
	movq	(%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB89_80
# %bb.78:                               #   in Loop: Header=BB89_76 Depth=1
	movq	88(%r14), %r8
	movl	(%r8), %ecx
	testl	%ecx, %ecx
	jle	.LBB89_80
# %bb.79:                               #   in Loop: Header=BB89_76 Depth=1
	decl	%ecx
	movl	%ecx, (%r8)
	leaq	1(%rsi), %rcx
	movq	%rcx, (%rdx)
	movb	%r9b, (%rsi)
	jmp	.LBB89_81
	.p2align	4, 0x90
.LBB89_80:                              #   in Loop: Header=BB89_76 Depth=1
	movq	(%r14), %rsi
.Ltmp310:
	movq	%r14, %rcx
	movl	%eax, %edx
	callq	*24(%rsi)
.Ltmp311:
.LBB89_81:                              #   in Loop: Header=BB89_76 Depth=1
	cmpl	$-1, %eax
	jne	.LBB89_83
	jmp	.LBB89_82
.LBB89_84:
	movq	24(%rbp), %rbx                  # 8-byte Reload
	movb	%r15b, (%rbx)
	movl	(%rbp), %eax
	movl	3(%rbp), %ecx
	movl	%ecx, 3(%r13)
	movl	%eax, (%r13)
.LBB89_85:
	movq	%r14, 8(%rbx)
	xorl	%r13d, %r13d
.LBB89_118:
	movq	32(%rbp), %rax
	movq	56(%rbp), %rcx
	movzbl	(%rbx), %r15d
	movl	4(%rbx), %edx
	movl	%edx, -13(%rbp)
	movl	1(%rbx), %edx
	movl	%edx, -16(%rbp)
	movq	8(%rbx), %r14
	movq	16(%rbp), %rdx                  # 8-byte Reload
	subq	%rdx, %r12
	je	.LBB89_128
# %bb.119:
	cmpq	$16, %rcx
	leaq	32(%rbp), %rbx
	cmovaeq	%rax, %rbx
	addq	%rdx, %rbx
	jmp	.LBB89_120
	.p2align	4, 0x90
.LBB89_126:                             #   in Loop: Header=BB89_120 Depth=1
	movb	$1, %r15b
.LBB89_127:                             #   in Loop: Header=BB89_120 Depth=1
	incq	%rbx
	decq	%r12
	je	.LBB89_128
.LBB89_120:                             # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	je	.LBB89_126
# %bb.121:                              #   in Loop: Header=BB89_120 Depth=1
	movzbl	(%rbx), %ecx
	movzbl	%cl, %eax
	movq	64(%r14), %rdx
	movq	(%rdx), %rdi
	testq	%rdi, %rdi
	je	.LBB89_124
# %bb.122:                              #   in Loop: Header=BB89_120 Depth=1
	movq	88(%r14), %r8
	movl	(%r8), %esi
	testl	%esi, %esi
	jle	.LBB89_124
# %bb.123:                              #   in Loop: Header=BB89_120 Depth=1
	decl	%esi
	movl	%esi, (%r8)
	leaq	1(%rdi), %rsi
	movq	%rsi, (%rdx)
	movb	%cl, (%rdi)
	jmp	.LBB89_125
	.p2align	4, 0x90
.LBB89_124:                             #   in Loop: Header=BB89_120 Depth=1
	movq	(%r14), %rdi
.Ltmp312:
	movq	%r14, %rcx
	movl	%eax, %edx
	callq	*24(%rdi)
.Ltmp313:
.LBB89_125:                             #   in Loop: Header=BB89_120 Depth=1
	cmpl	$-1, %eax
	jne	.LBB89_127
	jmp	.LBB89_126
.LBB89_128:
	movq	24(%rbp), %rbx                  # 8-byte Reload
	leaq	1(%rbx), %rax
	movb	%r15b, (%rbx)
	movl	-16(%rbp), %ecx
	movl	-13(%rbp), %edx
	movl	%edx, 3(%rax)
	movl	%ecx, (%rax)
	movq	%r14, 8(%rbx)
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	movq	$0, 40(%rcx)
	movzbl	(%rbx), %r14d
	movl	(%rax), %ecx
	movl	3(%rax), %eax
	movl	%eax, -5(%rbp)
	movl	%ecx, -8(%rbp)
	movq	8(%rbx), %rsi
	testq	%r13, %r13
	je	.LBB89_138
# %bb.129:
	movzbl	192(%rbp), %ebx
	jmp	.LBB89_130
	.p2align	4, 0x90
.LBB89_136:                             #   in Loop: Header=BB89_130 Depth=1
	movb	$1, %r14b
.LBB89_137:                             #   in Loop: Header=BB89_130 Depth=1
	decq	%r13
	je	.LBB89_138
.LBB89_130:                             # =>This Inner Loop Header: Depth=1
	testq	%rsi, %rsi
	je	.LBB89_136
# %bb.131:                              #   in Loop: Header=BB89_130 Depth=1
	movq	64(%rsi), %rax
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB89_134
# %bb.132:                              #   in Loop: Header=BB89_130 Depth=1
	movq	88(%rsi), %rdx
	movl	(%rdx), %edi
	testl	%edi, %edi
	jle	.LBB89_134
# %bb.133:                              #   in Loop: Header=BB89_130 Depth=1
	decl	%edi
	movl	%edi, (%rdx)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movzbl	192(%rbp), %eax
	movb	%al, (%rcx)
	movl	%ebx, %eax
	jmp	.LBB89_135
	.p2align	4, 0x90
.LBB89_134:                             #   in Loop: Header=BB89_130 Depth=1
	movq	(%rsi), %rax
.Ltmp314:
	movq	%rsi, %rcx
	movl	%ebx, %edx
	callq	*24(%rax)
.Ltmp315:
.LBB89_135:                             #   in Loop: Header=BB89_130 Depth=1
	cmpl	$-1, %eax
	jne	.LBB89_137
	jmp	.LBB89_136
.LBB89_138:
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	movb	%r14b, (%rdi)
	movl	-8(%rbp), %eax
	movl	-5(%rbp), %ecx
	movl	%eax, 1(%rdi)
	movl	%ecx, 4(%rdi)
	movq	%rsi, 8(%rdi)
	movq	-40(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB89_146
# %bb.139:
	movq	-64(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB89_145
# %bb.140:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB89_141
# %bb.144:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB89_145:
	callq	"??3@YAXPEAX_K@Z"
.LBB89_146:
	movq	56(%rbp), %rax
	cmpq	$16, %rax
	jb	.LBB89_154
# %bb.147:
	movq	32(%rbp), %rcx
	leaq	1(%rax), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB89_153
# %bb.148:
	movq	-8(%rcx), %rbx
	addq	$-8, %rcx
	subq	%rbx, %rcx
	cmpq	$32, %rcx
	jae	.LBB89_149
# %bb.152:
	addq	$40, %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
.LBB89_153:
	callq	"??3@YAXPEAX_K@Z"
.LBB89_154:
	movq	%rdi, %rax
	addq	$216, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB89_42:
.Ltmp322:
	callq	"?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ"
.Ltmp323:
# %bb.51:
.LBB89_157:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB89_158:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB89_141:
.Ltmp316:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp317:
# %bb.142:
.LBB89_149:
.Ltmp318:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp319:
# %bb.150:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z")@IMGREL
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_endproc
	.def	"?dtor$43@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$43@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA":
.seh_proc "?dtor$43@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"
.LBB89_43:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	40(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB89_46
# %bb.44:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB89_46
# %bb.45:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB89_46:
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_endproc
	.def	"?dtor$47@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$47@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA":
.seh_proc "?dtor$47@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"
.LBB89_47:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	-56(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB89_50
# %bb.48:
	movq	(%rcx), %rax
	callq	*16(%rax)
	testq	%rax, %rax
	je	.LBB89_50
# %bb.49:
	movq	(%rax), %rbx
	movq	%rax, %rcx
	movl	$1, %edx
	callq	*(%rbx)
.LBB89_50:
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_endproc
	.def	"?dtor$143@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$143@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA":
.seh_proc "?dtor$143@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"
.LBB89_143:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_endproc
	.def	"?dtor$151@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$151@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA":
.seh_proc "?dtor$151@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"
.LBB89_151:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_endproc
	.def	"?dtor$155@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$155@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA":
.seh_proc "?dtor$155@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"
.LBB89_155:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-64(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_endproc
	.def	"?dtor$156@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$156@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA":
.seh_proc "?dtor$156@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"
.LBB89_156:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	32(%rbp), %rcx
	callq	"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end45:
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
	.p2align	2
"$cppxdata$?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z":
	.long	429065506                       # MagicNumber
	.long	6                               # MaxState
	.long	("$stateUnwindMap$?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	15                              # IPMapEntries
	.long	("$ip2state$?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z")@IMGREL # IPToStateXData
	.long	208                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z":
	.long	-1                              # ToState
	.long	"?dtor$43@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$143@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$151@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$156@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	"?dtor$47@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	"?dtor$155@?0??_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z@4HA"@IMGREL # Action
"$ip2state$?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z":
	.long	.Lfunc_begin45@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp290@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp291@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp292@IMGREL+1               # IP
	.long	3                               # ToState
	.long	.Ltmp293@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp294@IMGREL+1               # IP
	.long	4                               # ToState
	.long	.Ltmp295@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp296@IMGREL+1               # IP
	.long	3                               # ToState
	.long	.Ltmp298@IMGREL+1               # IP
	.long	5                               # ToState
	.long	.Ltmp321@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp304@IMGREL+1               # IP
	.long	5                               # ToState
	.long	.Ltmp323@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp316@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp318@IMGREL+1               # IP
	.long	2                               # ToState
	.long	.Ltmp319@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?_Fput@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@AEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBD_K@Z"
                                        # -- End function
	.def	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
	.globl	"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z" # -- Begin function ??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z
	.p2align	4, 0x90
"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z": # @"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
.Lfunc_begin46:
.seh_proc "??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	16(%rcx), %rbx
	movabsq	$9223372036854775807, %r12      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rbx, %rax
	xorq	%r12, %rax
	cmpq	%rdx, %rax
	jb	.LBB90_20
# %bb.1:
	movq	%r9, %r14
	movq	%rdx, %rsi
	movq	%rcx, %r15
	addq	%rbx, %rsi
	movq	24(%rcx), %r13
	movq	%rsi, %rax
	orq	$15, %rax
	js	.LBB90_4
# %bb.2:
	movq	%r13, %rcx
	shrq	%rcx
	movabsq	$9223372036854775807, %r12      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rcx, %rdx
	xorq	%r12, %rdx
	cmpq	%r13, %rdx
	jb	.LBB90_4
# %bb.3:
	addq	%r13, %rcx
	cmpq	%rcx, %rax
	cmovaq	%rax, %rcx
	movq	%rcx, %r12
.LBB90_4:
	leaq	1(%r12), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB90_7
# %bb.5:
	cmpq	$-39, %rcx
	jae	.LBB90_21
# %bb.6:
	leaq	40(%r12), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rdi
	andq	$-32, %rdi
	movq	%rax, -8(%rdi)
	jmp	.LBB90_10
.LBB90_7:
	testq	%rcx, %rcx
	je	.LBB90_8
# %bb.9:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rdi
	jmp	.LBB90_10
.LBB90_8:
	xorl	%edi, %edi
.LBB90_10:
	movq	%rsi, 16(%r15)
	movq	%r12, 24(%r15)
	cmpq	$16, %r13
	jb	.LBB90_18
# %bb.11:
	movq	(%r15), %rsi
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	movq	%rbx, %r8
	callq	memcpy
	leaq	(%rdi,%rbx), %rcx
	movzbl	112(%rbp), %edx
	movq	%r14, %r8
	callq	memset
	addq	%r14, %rbx
	movb	$0, (%rdi,%rbx)
	leaq	1(%r13), %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB90_17
# %bb.12:
	movq	-8(%rsi), %rax
	addq	$-8, %rsi
	subq	%rax, %rsi
	cmpq	$32, %rsi
	jae	.LBB90_13
# %bb.16:
	addq	$40, %r13
	movq	%r13, %rdx
	movq	%rax, %rsi
.LBB90_17:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX_K@Z"
	jmp	.LBB90_19
.LBB90_18:
	movq	%rdi, %rcx
	movq	%r15, %rdx
	movq	%rbx, %r8
	callq	memcpy
	leaq	(%rdi,%rbx), %rcx
	movzbl	112(%rbp), %edx
	movq	%r14, %r8
	callq	memset
	addq	%r14, %rbx
	movb	$0, (%rdi,%rbx)
.LBB90_19:
	movq	%rdi, (%r15)
	movq	%r15, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB90_20:
	callq	"?_Xlen_string@std@@YAXXZ"
.LBB90_21:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB90_13:
.Ltmp324:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp325:
# %bb.14:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
	.seh_endproc
	.def	"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z@4HA":
.seh_proc "?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z@4HA"
.LBB90_15:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end46:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
	.p2align	2
"$cppxdata$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z":
	.long	-1                              # ToState
	.long	"?dtor$15@?0???$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z@4HA"@IMGREL # Action
"$ip2state$??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z":
	.long	.Lfunc_begin46@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp324@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp325@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$_Reallocate_grow_by@V<lambda_1>@?0??append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV34@_KD@Z@_KD@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0??append@01@QEAAAEAV01@0D@Z@_KD@Z"
                                        # -- End function
	.def	"??0bad_cast@std@@QEAA@AEBV01@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0bad_cast@std@@QEAA@AEBV01@@Z"
	.globl	"??0bad_cast@std@@QEAA@AEBV01@@Z" # -- Begin function ??0bad_cast@std@@QEAA@AEBV01@@Z
	.p2align	4, 0x90
"??0bad_cast@std@@QEAA@AEBV01@@Z":      # @"??0bad_cast@std@@QEAA@AEBV01@@Z"
.Lfunc_begin47:
.seh_proc "??0bad_cast@std@@QEAA@AEBV01@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rcx)
	leaq	8(%rdx), %rcx
.Ltmp326:
	movq	%rax, %rdx
	callq	__std_exception_copy
.Ltmp327:
# %bb.1:
	leaq	"??_7bad_cast@std@@6B@"(%rip), %rax
	movq	%rax, (%rsi)
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??0bad_cast@std@@QEAA@AEBV01@@Z")@IMGREL
	.section	.text,"xr",discard,"??0bad_cast@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.def	"?dtor$2@?0???0bad_cast@std@@QEAA@AEBV01@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???0bad_cast@std@@QEAA@AEBV01@@Z@4HA":
.seh_proc "?dtor$2@?0???0bad_cast@std@@QEAA@AEBV01@@Z@4HA"
.LBB91_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end47:
	.seh_handlerdata
	.section	.text,"xr",discard,"??0bad_cast@std@@QEAA@AEBV01@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??0bad_cast@std@@QEAA@AEBV01@@Z"
	.p2align	2
"$cppxdata$??0bad_cast@std@@QEAA@AEBV01@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??0bad_cast@std@@QEAA@AEBV01@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??0bad_cast@std@@QEAA@AEBV01@@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??0bad_cast@std@@QEAA@AEBV01@@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???0bad_cast@std@@QEAA@AEBV01@@Z@4HA"@IMGREL # Action
"$ip2state$??0bad_cast@std@@QEAA@AEBV01@@Z":
	.long	.Lfunc_begin47@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp326@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp327@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??0bad_cast@std@@QEAA@AEBV01@@Z"
                                        # -- End function
	.def	"??1exception@std@@UEAA@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??1exception@std@@UEAA@XZ"
	.globl	"??1exception@std@@UEAA@XZ"     # -- Begin function ??1exception@std@@UEAA@XZ
	.p2align	4, 0x90
"??1exception@std@@UEAA@XZ":            # @"??1exception@std@@UEAA@XZ"
.Lfunc_begin48:
.seh_proc "??1exception@std@@UEAA@XZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp328:
	callq	__std_exception_destroy
.Ltmp329:
# %bb.1:
	nop
	addq	$48, %rsp
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??1exception@std@@UEAA@XZ")@IMGREL
	.section	.text,"xr",discard,"??1exception@std@@UEAA@XZ"
	.seh_endproc
	.def	"?dtor$2@?0???1exception@std@@UEAA@XZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???1exception@std@@UEAA@XZ@4HA":
.seh_proc "?dtor$2@?0???1exception@std@@UEAA@XZ@4HA"
.LBB92_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end48:
	.seh_handlerdata
	.section	.text,"xr",discard,"??1exception@std@@UEAA@XZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??1exception@std@@UEAA@XZ"
	.p2align	2
"$cppxdata$??1exception@std@@UEAA@XZ":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??1exception@std@@UEAA@XZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??1exception@std@@UEAA@XZ")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??1exception@std@@UEAA@XZ":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???1exception@std@@UEAA@XZ@4HA"@IMGREL # Action
"$ip2state$??1exception@std@@UEAA@XZ":
	.long	.Lfunc_begin48@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp328@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp329@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??1exception@std@@UEAA@XZ"
                                        # -- End function
	.def	"??_Gbad_cast@std@@UEAAPEAXI@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??_Gbad_cast@std@@UEAAPEAXI@Z"
	.globl	"??_Gbad_cast@std@@UEAAPEAXI@Z" # -- Begin function ??_Gbad_cast@std@@UEAAPEAXI@Z
	.p2align	4, 0x90
"??_Gbad_cast@std@@UEAAPEAXI@Z":        # @"??_Gbad_cast@std@@UEAAPEAXI@Z"
.Lfunc_begin49:
.seh_proc "??_Gbad_cast@std@@UEAAPEAXI@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movl	%edx, %edi
	movq	%rcx, %rsi
	leaq	"??_7exception@std@@6B@"(%rip), %rax
	movq	%rax, (%rcx)
	addq	$8, %rcx
.Ltmp330:
	callq	__std_exception_destroy
.Ltmp331:
# %bb.1:
	testl	%edi, %edi
	je	.LBB93_3
# %bb.2:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
.LBB93_3:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??_Gbad_cast@std@@UEAAPEAXI@Z")@IMGREL
	.section	.text,"xr",discard,"??_Gbad_cast@std@@UEAAPEAXI@Z"
	.seh_endproc
	.def	"?dtor$4@?0???_Gbad_cast@std@@UEAAPEAXI@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0???_Gbad_cast@std@@UEAAPEAXI@Z@4HA":
.seh_proc "?dtor$4@?0???_Gbad_cast@std@@UEAAPEAXI@Z@4HA"
.LBB93_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end49:
	.seh_handlerdata
	.section	.text,"xr",discard,"??_Gbad_cast@std@@UEAAPEAXI@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??_Gbad_cast@std@@UEAAPEAXI@Z"
	.p2align	2
"$cppxdata$??_Gbad_cast@std@@UEAAPEAXI@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??_Gbad_cast@std@@UEAAPEAXI@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??_Gbad_cast@std@@UEAAPEAXI@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??_Gbad_cast@std@@UEAAPEAXI@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0???_Gbad_cast@std@@UEAAPEAXI@Z@4HA"@IMGREL # Action
"$ip2state$??_Gbad_cast@std@@UEAAPEAXI@Z":
	.long	.Lfunc_begin49@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp330@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp331@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??_Gbad_cast@std@@UEAAPEAXI@Z"
                                        # -- End function
	.def	"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
	.globl	"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z" # -- Begin function ??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z
	.p2align	4, 0x90
"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z": # @"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
.Lfunc_begin50:
.seh_proc "??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %r12
	movq	(%rcx), %r14
	movq	8(%rcx), %rbx
	subq	%r14, %rbx
	sarq	$3, %rbx
	movabsq	$-3689348814741910323, %rcx     # imm = 0xCCCCCCCCCCCCCCCD
	imulq	%rcx, %rbx
	incq	%rbx
	movq	16(%r12), %rax
	subq	%r14, %rax
	sarq	$3, %rax
	imulq	%rcx, %rax
	movq	%rax, %r15
	shrq	%r15
	movabsq	$461168601842738790, %rdi       # imm = 0x666666666666666
	movq	%rdi, %rcx
	subq	%r15, %rcx
	addq	%rax, %r15
	cmpq	%rbx, %r15
	cmovbeq	%rbx, %r15
	cmpq	%rcx, %rax
	cmovaq	%rdi, %r15
	movabsq	$461168601842738791, %rax       # imm = 0x666666666666667
	cmpq	%rax, %r15
	jae	.LBB94_17
# %bb.1:
	movq	%r8, %rsi
	movq	%rdx, %r13
	leaq	(,%r15,8), %rax
	leaq	(%rax,%rax,4), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	movq	%r9, -8(%rbp)                   # 8-byte Spill
	jb	.LBB94_4
# %bb.2:
	cmpq	$-39, %rcx
	jae	.LBB94_17
# %bb.3:
	addq	$39, %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rdi
	andq	$-32, %rdi
	movq	%rax, -8(%rdi)
	jmp	.LBB94_5
.LBB94_4:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rdi
.LBB94_5:
	movq	112(%rbp), %rax
	movq	%r13, %rcx
	subq	%r14, %rcx
	sarq	$3, %rcx
	movabsq	$-3689348814741910323, %rdx     # imm = 0xCCCCCCCCCCCCCCCD
	imulq	%rdx, %rcx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%rdi,%rcx,8), %r14
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	movq	(%rdx), %rdx
	movq	%rsi, (%rdi,%rcx,8)
	movq	%rdx, 8(%rdi,%rcx,8)
	movq	%rax, 16(%rdi,%rcx,8)
	movq	8(%rsi), %rsi
	shrq	$3, %rsi
	imulq	%rsi, %rdx
	movq	%rdx, 24(%rdi,%rcx,8)
	imulq	%rax, %rsi
	movq	%rsi, 32(%rdi,%rcx,8)
	movq	8(%r12), %r8
	cmpq	%r13, %r8
	je	.LBB94_6
# %bb.7:
	movq	%r14, %rsi
	addq	$40, %r14
	movq	(%r12), %rdx
	movq	%r13, %r8
	subq	%rdx, %r8
	movq	%rdi, %rcx
	callq	memmove
	movq	8(%r12), %r8
	subq	%r13, %r8
	movq	%r14, %rcx
	movq	%rsi, %r14
	movq	%r13, %rdx
	jmp	.LBB94_8
.LBB94_6:
	movq	(%r12), %rdx
	subq	%rdx, %r8
	movq	%rdi, %rcx
.LBB94_8:
	callq	memmove
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB94_16
# %bb.9:
	movq	16(%r12), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB94_15
# %bb.10:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB94_11
# %bb.14:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB94_15:
	callq	"??3@YAXPEAX_K@Z"
.LBB94_16:
	movq	%rdi, (%r12)
	leaq	(%rbx,%rbx,4), %rax
	leaq	(%rdi,%rax,8), %rax
	movq	%rax, 8(%r12)
	leaq	(%r15,%r15,4), %rax
	leaq	(%rdi,%rax,8), %rax
	movq	%rax, 16(%r12)
	movq	%r14, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB94_17:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB94_11:
.Ltmp332:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp333:
# %bb.12:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
	.seh_endproc
	.def	"?dtor$13@?0???$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$13@?0???$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z@4HA":
.seh_proc "?dtor$13@?0???$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z@4HA"
.LBB94_13:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end50:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
	.p2align	2
"$cppxdata$??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z")@IMGREL # IPToStateXData
	.long	48                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z":
	.long	-1                              # ToState
	.long	"?dtor$13@?0???$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z@4HA"@IMGREL # Action
"$ip2state$??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z":
	.long	.Lfunc_begin50@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp332@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp333@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEAVPortableBinaryBitmap@@AEA_KAEA_K@?$vector@VInterlacedCanvas@PortableBinaryBitmap@@V?$allocator@VInterlacedCanvas@PortableBinaryBitmap@@@std@@@std@@AEAAPEAVInterlacedCanvas@PortableBinaryBitmap@@QEAV23@AEAV3@AEA_K2@Z"
                                        # -- End function
	.def	"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
	.globl	"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z" # -- Begin function ??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z
	.p2align	4, 0x90
"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z": # @"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
.Lfunc_begin51:
.seh_proc "??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$104, %rsp
	.seh_stackalloc 104
	leaq	96(%rsp), %rbp
	.seh_setframe %rbp, 96
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	(%rcx), %r12
	movq	8(%rcx), %r15
	subq	%r12, %r15
	sarq	$4, %r15
	incq	%r15
	movq	16(%rcx), %rax
	subq	%r12, %rax
	sarq	$4, %rax
	movq	%rax, %rdi
	shrq	%rdi
	movabsq	$1152921504606846975, %rsi      # imm = 0xFFFFFFFFFFFFFFF
	movq	%rsi, %rbx
	subq	%rdi, %rbx
	addq	%rax, %rdi
	cmpq	%r15, %rdi
	cmovbeq	%r15, %rdi
	cmpq	%rbx, %rax
	cmovaq	%rsi, %rdi
	movq	%rdi, %rax
	shrq	$60, %rax
	jne	.LBB95_37
# %bb.1:
	movq	%r8, %rsi
	movq	%rdx, %rbx
	movq	%rdi, %r14
	shlq	$4, %r14
	cmpq	$4096, %r14                     # imm = 0x1000
	movq	%rcx, -24(%rbp)                 # 8-byte Spill
	movq	%rdi, -40(%rbp)                 # 8-byte Spill
	jb	.LBB95_4
# %bb.2:
	cmpq	$-39, %r14
	jae	.LBB95_37
# %bb.3:
	leaq	39(%r14), %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rcx
	andq	$-32, %rcx
	movq	%rax, -8(%rcx)
	jmp	.LBB95_7
.LBB95_4:
	testq	%r14, %r14
	je	.LBB95_5
# %bb.6:
	movq	%r14, %rcx
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rcx
	jmp	.LBB95_7
.LBB95_5:
	xorl	%ecx, %ecx
.LBB95_7:
	movq	%rcx, -8(%rbp)                  # 8-byte Spill
	movq	%rbx, %r13
	subq	%r12, %r13
	sarq	$4, %r13
	shlq	$4, %r13
	leaq	(%rcx,%r13), %rax
	addq	$16, %rax
	movq	%rax, -16(%rbp)                 # 8-byte Spill
.Ltmp334:
	movl	$88, %ecx
	callq	"??2@YAPEAX_K@Z"
.Ltmp335:
# %bb.8:
	addq	-8(%rbp), %r13                  # 8-byte Folded Reload
	movq	80(%rsi), %rcx
	movq	%rcx, 80(%rax)
	movups	64(%rsi), %xmm0
	movups	%xmm0, 64(%rax)
	movups	(%rsi), %xmm0
	movups	16(%rsi), %xmm1
	movups	32(%rsi), %xmm2
	movups	48(%rsi), %xmm3
	movups	%xmm3, 48(%rax)
	movups	%xmm2, 32(%rax)
	movups	%xmm1, 16(%rax)
	movups	%xmm0, (%rax)
	leaq	8(%r13), %rsi
.Ltmp336:
	movq	%rsi, 40(%rsp)
	movl	$0, 32(%rsp)
	leaq	"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"(%rip), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, -32(%rbp)                 # 8-byte Spill
	movq	%rax, %r9
	callq	_beginthreadex
.Ltmp337:
# %bb.9:
	movq	%rax, (%r13)
	testq	%rax, %rax
	je	.LBB95_10
# %bb.13:
	movq	-24(%rbp), %r12                 # 8-byte Reload
	movq	(%r12), %rax
	movq	8(%r12), %rcx
	cmpq	%rbx, %rcx
	movq	-16(%rbp), %rdi                 # 8-byte Reload
	je	.LBB95_14
# %bb.17:
	cmpq	%rbx, %rax
	movq	-8(%rbp), %rsi                  # 8-byte Reload
	je	.LBB95_20
# %bb.18:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB95_19:                              # =>This Inner Loop Header: Depth=1
	movups	(%rax,%rcx), %xmm0
	movups	%xmm0, (%rsi,%rcx)
	movq	$0, (%rax,%rcx)
	movl	$0, 8(%rax,%rcx)
	leaq	(%rax,%rcx), %rdx
	addq	$16, %rdx
	addq	$16, %rcx
	cmpq	%rbx, %rdx
	jne	.LBB95_19
.LBB95_20:
	movq	8(%r12), %rax
	cmpq	%rbx, %rax
	je	.LBB95_23
# %bb.21:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB95_22:                              # =>This Inner Loop Header: Depth=1
	movups	(%rbx,%rcx), %xmm0
	movups	%xmm0, (%rdi,%rcx)
	movq	$0, (%rbx,%rcx)
	movl	$0, 8(%rbx,%rcx)
	leaq	(%rbx,%rcx), %rdx
	addq	$16, %rdx
	addq	$16, %rcx
	cmpq	%rax, %rdx
	jne	.LBB95_22
	jmp	.LBB95_23
.LBB95_14:
	cmpq	%rcx, %rax
	movq	-8(%rbp), %rsi                  # 8-byte Reload
	je	.LBB95_23
# %bb.15:
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB95_16:                              # =>This Inner Loop Header: Depth=1
	movups	(%rax,%rdx), %xmm0
	movups	%xmm0, (%rsi,%rdx)
	movq	$0, (%rax,%rdx)
	movl	$0, 8(%rax,%rdx)
	leaq	(%rax,%rdx), %rbx
	addq	$16, %rbx
	addq	$16, %rdx
	cmpq	%rcx, %rbx
	jne	.LBB95_16
.LBB95_23:
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB95_36
# %bb.24:
	movq	8(%r12), %rax
	cmpq	%rax, %rcx
	je	.LBB95_29
# %bb.25:
	movq	%rcx, %rdx
	.p2align	4, 0x90
.LBB95_27:                              # =>This Inner Loop Header: Depth=1
	cmpl	$0, 8(%rdx)
	jne	.LBB95_28
# %bb.26:                               #   in Loop: Header=BB95_27 Depth=1
	addq	$16, %rdx
	cmpq	%rax, %rdx
	jne	.LBB95_27
.LBB95_29:
	movq	16(%r12), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB95_35
# %bb.30:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB95_31
# %bb.34:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB95_35:
	callq	"??3@YAXPEAX_K@Z"
.LBB95_36:
	movq	%rsi, (%r12)
	shlq	$4, %r15
	addq	%rsi, %r15
	movq	%r15, 8(%r12)
	addq	%rsi, %r14
	movq	%r14, 16(%r12)
	movq	%r13, %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB95_28:
	callq	terminate
.LBB95_37:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB95_10:
	movl	$0, (%rsi)
.Ltmp340:
	movl	$6, %ecx
	callq	"?_Throw_Cpp_error@std@@YAXH@Z"
.Ltmp341:
# %bb.11:
.LBB95_31:
.Ltmp338:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp339:
# %bb.32:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
	.seh_endproc
	.def	"?dtor$12@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$12@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA":
.seh_proc "?dtor$12@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA"
.LBB95_12:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	96(%rdx), %rbp
	.seh_endprologue
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	callq	"??3@YAXPEAX@Z"
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
	.seh_endproc
	.def	"?dtor$33@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$33@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA":
.seh_proc "?dtor$33@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA"
.LBB95_33:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	96(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
	.seh_endproc
	.def	"?catch$38@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?catch$38@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA":
.seh_proc "?catch$38@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA"
	.seh_handler __CxxFrameHandler3, @unwind, @except
.LBB95_38:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	96(%rdx), %rbp
	.seh_endprologue
	movq	-16(%rbp), %rcx                 # 8-byte Reload
	movq	%rcx, %rdx
	movq	-24(%rbp), %rsi                 # 8-byte Reload
	movq	%rsi, %r8
	callq	"??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z"
	movq	%rsi, %rcx
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	movq	-40(%rbp), %r8                  # 8-byte Reload
	callq	"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	callq	_CxxThrowException
	int3
.Lfunc_end51:
	.seh_handlerdata
	.long	("$cppxdata$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
	.p2align	2
"$cppxdata$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z":
	.long	429065506                       # MagicNumber
	.long	4                               # MaxState
	.long	("$stateUnwindMap$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z")@IMGREL # UnwindMap
	.long	1                               # NumTryBlocks
	.long	("$tryMap$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z")@IMGREL # TryBlockMap
	.long	8                               # IPMapEntries
	.long	("$ip2state$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z")@IMGREL # IPToStateXData
	.long	96                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z":
	.long	-1                              # ToState
	.long	0                               # Action
	.long	0                               # ToState
	.long	"?dtor$12@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	0                               # Action
	.long	-1                              # ToState
	.long	"?dtor$33@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA"@IMGREL # Action
"$tryMap$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z":
	.long	0                               # TryLow
	.long	1                               # TryHigh
	.long	2                               # CatchHigh
	.long	1                               # NumCatches
	.long	("$handlerMap$0$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z")@IMGREL # HandlerArray
"$handlerMap$0$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z":
	.long	64                              # Adjectives
	.long	0                               # Type
	.long	0                               # CatchObjOffset
	.long	"?catch$38@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA"@IMGREL # Handler
	.long	136                             # ParentFrameOffset
"$ip2state$??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z":
	.long	.Lfunc_begin51@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp334@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp336@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp337@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	.Ltmp340@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp338@IMGREL+1               # IP
	.long	3                               # ToState
	.long	.Ltmp339@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	"?catch$38@?0???$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z@4HA"@IMGREL # IP
	.long	2                               # ToState
	.section	.text,"xr",discard,"??$_Emplace_reallocate@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@?$vector@Vthread@std@@V?$allocator@Vthread@std@@@2@@std@@AEAAPEAVthread@1@QEAV21@$$QEAV?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@Z"
                                        # -- End function
	.def	"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
	.globl	"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z" # -- Begin function ??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z
	.p2align	4, 0x90
"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z": # @"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
.Lfunc_begin52:
.seh_proc "??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	callq	"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
.Ltmp342:
	callq	_Cnd_do_broadcast_at_thread_exit
.Ltmp343:
# %bb.1:
	movq	%rsi, %rcx
	callq	"??3@YAXPEAX@Z"
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_handlerdata
	.long	("$cppxdata$??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
	.seh_endproc
	.def	"?dtor$2@?0???$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0???$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z@4HA":
.seh_proc "?dtor$2@?0???$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z@4HA"
.LBB96_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end52:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
	.p2align	2
"$cppxdata$??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z":
	.long	-1                              # ToState
	.long	"?dtor$2@?0???$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z@4HA"@IMGREL # Action
"$ip2state$??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z":
	.long	.Lfunc_begin52@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp342@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp343@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
                                        # -- End function
	.def	"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ";
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000000000000004530000043300000 # -- Begin function ??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ
	.section	.rdata,"dr",discard,__xmm@00000000000000004530000043300000
	.p2align	4
__xmm@00000000000000004530000043300000:
	.long	1127219200                      # 0x43300000
	.long	1160773632                      # 0x45300000
	.long	0                               # 0x0
	.long	0                               # 0x0
	.globl	__xmm@45300000000000004330000000000000
	.section	.rdata,"dr",discard,__xmm@45300000000000004330000000000000
	.p2align	4
__xmm@45300000000000004330000000000000:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4530000000000000              # double 1.9342813113834067E+25
	.section	.text,"xr",discard,"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
	.globl	"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
	.p2align	4, 0x90
"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ": # @"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
.Lfunc_begin53:
.seh_proc "??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$360, %rsp                      # imm = 0x168
	.seh_stackalloc 360
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	movaps	%xmm10, 208(%rbp)               # 16-byte Spill
	.seh_savexmm %xmm10, 336
	movapd	%xmm9, 192(%rbp)                # 16-byte Spill
	.seh_savexmm %xmm9, 320
	movaps	%xmm8, 176(%rbp)                # 16-byte Spill
	.seh_savexmm %xmm8, 304
	movaps	%xmm7, 160(%rbp)                # 16-byte Spill
	.seh_savexmm %xmm7, 288
	movaps	%xmm6, 144(%rbp)                # 16-byte Spill
	.seh_savexmm %xmm6, 272
	.seh_endprologue
	movq	$-2, 136(%rbp)
	movq	%rcx, %r14
	movsd	16(%rcx), %xmm7                 # xmm7 = mem[0],zero
	movsd	24(%rcx), %xmm8                 # xmm8 = mem[0],zero
	subsd	(%rcx), %xmm7
	subsd	8(%rcx), %xmm8
	movq	32(%rcx), %rax
	movsd	8(%rax), %xmm6                  # xmm6 = mem[0],zero
	movsd	16(%rax), %xmm10                # xmm10 = mem[0],zero
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 96(%rbp)
	movq	$0, 112(%rbp)
	movq	8(%rax), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	xorl	%ecx, %ecx
	subq	96(%rbp), %rcx
	sarq	$3, %rcx
	movabsq	$-8198552921648689607, %rbx     # imm = 0x8E38E38E38E38E39
	imulq	%rcx, %rbx
	cmpq	%rdx, %rbx
	jae	.LBB97_5
# %bb.1:
	movabsq	$2049638230412172408, %rcx      # imm = 0x1C71C71C71C71C78
	cmpq	%rcx, %rax
	jae	.LBB97_2
# %bb.4:
.Ltmp344:
	leaq	96(%rbp), %rcx
	callq	"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
.Ltmp345:
.LBB97_5:
	movapd	__xmm@00000000000000004530000043300000(%rip), %xmm9 # xmm9 = [1127219200,1160773632,0,0]
	unpcklps	%xmm9, %xmm6                    # xmm6 = xmm6[0],xmm9[0],xmm6[1],xmm9[1]
	movapd	__xmm@45300000000000004330000000000000(%rip), %xmm0 # xmm0 = [4.503599627370496E+15,1.9342813113834067E+25]
	subpd	%xmm0, %xmm6
	movapd	%xmm6, %xmm1
	unpckhpd	%xmm6, %xmm1                    # xmm1 = xmm1[1],xmm6[1]
	addsd	%xmm6, %xmm1
	divsd	%xmm1, %xmm7
	unpcklps	%xmm9, %xmm10                   # xmm10 = xmm10[0],xmm9[0],xmm10[1],xmm9[1]
	subpd	%xmm0, %xmm10
	movapd	%xmm10, %xmm0
	unpckhpd	%xmm10, %xmm0                   # xmm0 = xmm0[1],xmm10[1]
	addsd	%xmm10, %xmm0
	divsd	%xmm0, %xmm8
	xorl	%esi, %esi
	leaq	-88(%rbp), %rdi
	movapd	__xmm@45300000000000004330000000000000(%rip), %xmm10 # xmm10 = [4.503599627370496E+15,1.9342813113834067E+25]
	leaq	96(%rbp), %rbx
	.p2align	4, 0x90
.LBB97_6:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB97_21 Depth 2
                                        #     Child Loop BB97_18 Depth 2
	movq	32(%r14), %rax
	cmpq	8(%rax), %rsi
	jae	.LBB97_7
# %bb.20:                               #   in Loop: Header=BB97_6 Depth=1
	movq	%rdi, -24(%rbp)
	movsd	(%r14), %xmm0                   # xmm0 = mem[0],zero
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB97_21:                              #   Parent Loop BB97_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%rsi,%rax), %rcx
	movq	%rcx, %xmm1
	punpckldq	%xmm9, %xmm1            # xmm1 = xmm1[0],xmm9[0],xmm1[1],xmm9[1]
	subpd	%xmm10, %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm2                    # xmm2 = xmm2[1],xmm1[1]
	addsd	%xmm1, %xmm2
	mulsd	%xmm7, %xmm2
	addsd	%xmm0, %xmm2
	movsd	%xmm2, -88(%rbp,%rax,8)
	incq	%rax
	cmpq	$8, %rax
	jne	.LBB97_21
# %bb.16:                               #   in Loop: Header=BB97_6 Depth=1
	movq	104(%rbp), %rdx
	cmpq	112(%rbp), %rdx
	je	.LBB97_22
# %bb.17:                               #   in Loop: Header=BB97_6 Depth=1
	movq	%rdx, 64(%rdx)
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB97_18:                              #   Parent Loop BB97_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	-88(%rbp,%rax,8), %xmm0         # xmm0 = mem[0],zero
	movsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpq	$8, %rax
	jne	.LBB97_18
# %bb.19:                               #   in Loop: Header=BB97_6 Depth=1
	addq	$72, %rdx
	movq	%rdx, 104(%rbp)
	addq	$8, %rsi
	jmp	.LBB97_6
	.p2align	4, 0x90
.LBB97_22:                              #   in Loop: Header=BB97_6 Depth=1
.Ltmp348:
	movq	%rbx, %rcx
	movq	%rdi, %r8
	callq	"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
.Ltmp349:
# %bb.23:                               #   in Loop: Header=BB97_6 Depth=1
	addq	$8, %rsi
	jmp	.LBB97_6
.LBB97_7:
	movq	%r14, 88(%rbp)                  # 8-byte Spill
	movq	24(%rax), %rcx
	movq	32(%rax), %rax
	movq	%rcx, 128(%rbp)                 # 8-byte Spill
	movq	%rax, 80(%rbp)                  # 8-byte Spill
	cmpq	%rcx, %rax
	je	.LBB97_24
# %bb.8:
	movq	88(%rbp), %rcx                  # 8-byte Reload
	movq	64(%rcx), %rax
	movq	%rax, 64(%rbp)                  # 8-byte Spill
	movq	48(%rcx), %rax
	movq	%rax, 72(%rbp)                  # 8-byte Spill
	movq	56(%rcx), %rax
	addq	%rax, 80(%rbp)                  # 8-byte Folded Spill
	addq	%rax, 128(%rbp)                 # 8-byte Folded Spill
	movq	40(%rcx), %rdx
	leaq	-16(%rbp), %r13
	leaq	72(%rcx), %rbx
	xorpd	%xmm7, %xmm7
	jmp	.LBB97_9
	.p2align	4, 0x90
.LBB97_35:                              #   in Loop: Header=BB97_9 Depth=1
	movq	56(%rbp), %rdx                  # 8-byte Reload
	addq	72(%rbp), %rdx                  # 8-byte Folded Reload
	movq	128(%rbp), %rax                 # 8-byte Reload
	addq	64(%rbp), %rax                  # 8-byte Folded Reload
	movq	%rax, 128(%rbp)                 # 8-byte Spill
	cmpq	80(%rbp), %rax                  # 8-byte Folded Reload
	je	.LBB97_24
.LBB97_9:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB97_11 Depth 2
                                        #       Child Loop BB97_12 Depth 3
                                        #       Child Loop BB97_15 Depth 3
	movq	%rdx, 56(%rbp)                  # 8-byte Spill
	movq	%rdx, %xmm0
	punpckldq	%xmm9, %xmm0            # xmm0 = xmm0[0],xmm9[0],xmm0[1],xmm9[1]
	subpd	%xmm10, %xmm0
	movq	96(%rbp), %r15
	movq	104(%rbp), %r14
	cmpq	%r14, %r15
	je	.LBB97_35
# %bb.10:                               #   in Loop: Header=BB97_9 Depth=1
	movapd	%xmm0, %xmm6
	unpckhpd	%xmm0, %xmm6                    # xmm6 = xmm6[1],xmm0[1]
	addsd	%xmm0, %xmm6
	mulsd	%xmm8, %xmm6
	movq	88(%rbp), %rax                  # 8-byte Reload
	addsd	8(%rax), %xmm6
	movq	%xmm6, %r12
	xorl	%eax, %eax
	movq	128(%rbp), %rsi                 # 8-byte Reload
	jmp	.LBB97_11
	.p2align	4, 0x90
.LBB97_33:                              #   in Loop: Header=BB97_11 Depth=2
	movupd	%xmm7, 48(%r13)
	movupd	%xmm7, 32(%r13)
	movupd	%xmm7, 16(%r13)
	movupd	%xmm7, (%r13)
.LBB97_34:                              #   in Loop: Header=BB97_11 Depth=2
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movl	%eax, %r8d
	callq	"??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z"
                                        # kill: def $al killed $al def $eax
	movb	%al, (%rsi)
	incq	%rsi
	addq	$72, %r15
	cmpq	%r14, %r15
	je	.LBB97_35
.LBB97_11:                              #   Parent Loop BB97_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB97_12 Depth 3
                                        #       Child Loop BB97_15 Depth 3
	movq	%rdi, -24(%rbp)
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB97_12:                              #   Parent Loop BB97_9 Depth=1
                                        #     Parent Loop BB97_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movsd	(%r15,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, -88(%rbp,%rcx,8)
	incq	%rcx
	cmpq	$8, %rcx
	jne	.LBB97_12
# %bb.13:                               #   in Loop: Header=BB97_11 Depth=2
	movq	%r13, 48(%rbp)
	testq	%r12, %r12
	je	.LBB97_33
# %bb.14:                               #   in Loop: Header=BB97_11 Depth=2
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB97_15:                              #   Parent Loop BB97_9 Depth=1
                                        #     Parent Loop BB97_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movsd	%xmm6, -16(%rbp,%rcx,8)
	incq	%rcx
	cmpq	$8, %rcx
	jne	.LBB97_15
	jmp	.LBB97_34
.LBB97_24:
	movq	96(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB97_32
# %bb.25:
	movq	112(%rbp), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB97_31
# %bb.26:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB97_27
# %bb.30:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB97_31:
	callq	"??3@YAXPEAX_K@Z"
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 96(%rbp)
	movq	$0, 112(%rbp)
.LBB97_32:
	movaps	144(%rbp), %xmm6                # 16-byte Reload
	movaps	160(%rbp), %xmm7                # 16-byte Reload
	movaps	176(%rbp), %xmm8                # 16-byte Reload
	movaps	192(%rbp), %xmm9                # 16-byte Reload
	movaps	208(%rbp), %xmm10               # 16-byte Reload
	addq	$360, %rsp                      # imm = 0x168
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB97_2:
.Ltmp350:
	callq	"?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ"
.Ltmp351:
# %bb.3:
.LBB97_27:
.Ltmp346:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp347:
# %bb.28:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ")@IMGREL
	.section	.text,"xr",discard,"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
	.seh_endproc
	.def	"?dtor$29@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$29@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA":
.seh_proc "?dtor$29@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA"
.LBB97_29:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$120, %rsp
	.seh_stackalloc 120
	leaq	128(%rdx), %rbp
	movapd	%xmm10, 32(%rsp)                # 16-byte Spill
	.seh_savexmm %xmm10, 32
	movaps	%xmm9, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm9, 48
	movapd	%xmm8, 64(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm8, 64
	movapd	%xmm7, 80(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm7, 80
	movapd	%xmm6, 96(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 96
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
	.seh_endproc
	.def	"?dtor$36@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$36@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA":
.seh_proc "?dtor$36@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA"
.LBB97_36:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$120, %rsp
	.seh_stackalloc 120
	leaq	128(%rdx), %rbp
	movapd	%xmm10, 32(%rsp)                # 16-byte Spill
	.seh_savexmm %xmm10, 32
	movapd	%xmm9, 48(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm9, 48
	movapd	%xmm8, 64(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm8, 64
	movapd	%xmm7, 80(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm7, 80
	movapd	%xmm6, 96(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 96
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end53:
	.seh_handlerdata
	.section	.text,"xr",discard,"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
	.seh_endproc
	.section	.xdata,"dr",associative,"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
	.p2align	2
"$cppxdata$??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ":
	.long	429065506                       # MagicNumber
	.long	2                               # MaxState
	.long	("$stateUnwindMap$??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	4                               # IPMapEntries
	.long	("$ip2state$??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ")@IMGREL # IPToStateXData
	.long	264                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ":
	.long	-1                              # ToState
	.long	"?dtor$29@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$36@?0???R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ@4HA"@IMGREL # Action
"$ip2state$??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ":
	.long	.Lfunc_begin53@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp344@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp346@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp347@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??R?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@QEAAXXZ"
                                        # -- End function
	.def	"??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z"
	.globl	"??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z" # -- Begin function ??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z
	.p2align	4, 0x90
"??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z": # @"??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z"
.seh_proc "??R?$MandelbrotFunction@N@@QEBADAEBV?$VectorizedComplex@N@@D@Z"
# %bb.0:
	subq	$232, %rsp
	.seh_stackalloc 232
	.seh_endprologue
	leaq	80(%rsp), %rax
	movq	%rax, 144(%rsp)
	movups	(%rdx), %xmm0
	movups	16(%rdx), %xmm1
	movups	32(%rdx), %xmm2
	movups	48(%rdx), %xmm3
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	leaq	152(%rsp), %rax
	movq	%rax, 216(%rsp)
	movupd	72(%rdx), %xmm0
	movupd	88(%rdx), %xmm1
	movupd	104(%rdx), %xmm2
	movupd	120(%rdx), %xmm3
	movupd	%xmm0, 152(%rsp)
	movupd	%xmm1, 168(%rsp)
	movupd	%xmm2, 184(%rsp)
	movupd	%xmm3, 200(%rsp)
	leaq	8(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	(%rcx), %r9
	testb	%r8b, %r8b
	je	.LBB98_8
# %bb.1:
	testq	%r9, %r9
	je	.LBB98_20
# %bb.2:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB98_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_4 Depth 2
                                        #       Child Loop BB98_5 Depth 3
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB98_4:                               #   Parent Loop BB98_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB98_5 Depth 3
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB98_5:                               #   Parent Loop BB98_3 Depth=1
                                        #     Parent Loop BB98_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movsd	80(%rsp,%rax,8), %xmm0          # xmm0 = mem[0],zero
	movsd	152(%rsp,%rax,8), %xmm1         # xmm1 = mem[0],zero
	movapd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm1
	movapd	%xmm2, %xmm3
	subsd	%xmm1, %xmm3
	addsd	(%rdx,%rax,8), %xmm3
	movsd	%xmm3, 80(%rsp,%rax,8)
	addsd	%xmm0, %xmm0
	addsd	72(%rdx,%rax,8), %xmm0
	movsd	%xmm0, 152(%rsp,%rax,8)
	addsd	%xmm2, %xmm1
	movsd	%xmm1, 8(%rsp,%rax,8)
	incq	%rax
	cmpq	$8, %rax
	jne	.LBB98_5
# %bb.6:                                #   in Loop: Header=BB98_4 Depth=2
	incq	%r10
	cmpq	$5, %r10
	jne	.LBB98_4
# %bb.7:                                #   in Loop: Header=BB98_3 Depth=1
	incq	%r8
	cmpq	%r9, %r8
	jne	.LBB98_3
	jmp	.LBB98_20
.LBB98_8:
	testq	%r9, %r9
	je	.LBB98_20
# %bb.9:
	movsd	8(%rcx), %xmm0                  # xmm0 = mem[0],zero
	xorl	%r8d, %r8d
	jmp	.LBB98_10
	.p2align	4, 0x90
.LBB98_19:                              #   in Loop: Header=BB98_10 Depth=1
	incq	%r8
	cmpq	%r9, %r8
	je	.LBB98_20
.LBB98_10:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_11 Depth 2
                                        #       Child Loop BB98_12 Depth 3
                                        #     Child Loop BB98_16 Depth 2
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB98_11:                              #   Parent Loop BB98_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB98_12 Depth 3
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB98_12:                              #   Parent Loop BB98_10 Depth=1
                                        #     Parent Loop BB98_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movsd	80(%rsp,%rax,8), %xmm1          # xmm1 = mem[0],zero
	movsd	152(%rsp,%rax,8), %xmm2         # xmm2 = mem[0],zero
	movapd	%xmm1, %xmm3
	mulsd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm1
	mulsd	%xmm2, %xmm2
	movapd	%xmm3, %xmm4
	subsd	%xmm2, %xmm4
	addsd	(%rdx,%rax,8), %xmm4
	movsd	%xmm4, 80(%rsp,%rax,8)
	addsd	%xmm1, %xmm1
	addsd	72(%rdx,%rax,8), %xmm1
	movsd	%xmm1, 152(%rsp,%rax,8)
	addsd	%xmm3, %xmm2
	movsd	%xmm2, 8(%rsp,%rax,8)
	incq	%rax
	cmpq	$8, %rax
	jne	.LBB98_12
# %bb.13:                               #   in Loop: Header=BB98_11 Depth=2
	incq	%r10
	cmpq	$5, %r10
	jne	.LBB98_11
# %bb.14:                               #   in Loop: Header=BB98_10 Depth=1
	movsd	8(%rsp), %xmm1                  # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jbe	.LBB98_19
# %bb.15:                               #   in Loop: Header=BB98_10 Depth=1
	movl	$1, %eax
	.p2align	4, 0x90
.LBB98_16:                              #   Parent Loop BB98_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$8, %rax
	je	.LBB98_17
# %bb.18:                               #   in Loop: Header=BB98_16 Depth=2
	movsd	8(%rsp,%rax,8), %xmm1           # xmm1 = mem[0],zero
	incq	%rax
	ucomisd	%xmm0, %xmm1
	ja	.LBB98_16
	jmp	.LBB98_19
.LBB98_20:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB98_21:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_22 Depth 2
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB98_22:                              #   Parent Loop BB98_21 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	80(%rsp,%rax,8), %xmm0          # xmm0 = mem[0],zero
	movsd	152(%rsp,%rax,8), %xmm1         # xmm1 = mem[0],zero
	movapd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm1
	movapd	%xmm2, %xmm3
	subsd	%xmm1, %xmm3
	addsd	(%rdx,%rax,8), %xmm3
	movsd	%xmm3, 80(%rsp,%rax,8)
	addsd	%xmm0, %xmm0
	addsd	72(%rdx,%rax,8), %xmm0
	movsd	%xmm0, 152(%rsp,%rax,8)
	addsd	%xmm2, %xmm1
	movsd	%xmm1, 8(%rsp,%rax,8)
	incq	%rax
	cmpq	$8, %rax
	jne	.LBB98_22
# %bb.23:                               #   in Loop: Header=BB98_21 Depth=1
	incq	%r8
	cmpq	$5, %r8
	jne	.LBB98_21
# %bb.24:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB98_25:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_26 Depth 2
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB98_26:                              #   Parent Loop BB98_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	80(%rsp,%rax,8), %xmm0          # xmm0 = mem[0],zero
	movsd	152(%rsp,%rax,8), %xmm1         # xmm1 = mem[0],zero
	movapd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm1
	movapd	%xmm2, %xmm3
	subsd	%xmm1, %xmm3
	addsd	(%rdx,%rax,8), %xmm3
	movsd	%xmm3, 80(%rsp,%rax,8)
	addsd	%xmm0, %xmm0
	addsd	72(%rdx,%rax,8), %xmm0
	movsd	%xmm0, 152(%rsp,%rax,8)
	addsd	%xmm2, %xmm1
	movsd	%xmm1, 8(%rsp,%rax,8)
	incq	%rax
	cmpq	$8, %rax
	jne	.LBB98_26
# %bb.27:                               #   in Loop: Header=BB98_25 Depth=1
	incq	%r8
	cmpq	$5, %r8
	jne	.LBB98_25
# %bb.28:
	movsd	8(%rcx), %xmm0                  # xmm0 = mem[0],zero
	ucomisd	8(%rsp), %xmm0
	setae	%al
	shlb	$7, %al
	leal	64(%rax), %ecx
	ucomisd	16(%rsp), %xmm0
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	cmovbl	%eax, %ecx
	leal	32(%rcx), %eax
	ucomisd	24(%rsp), %xmm0
	movzbl	%al, %eax
	cmovbl	%ecx, %eax
	movl	%eax, %ecx
	orb	$16, %cl
	ucomisd	32(%rsp), %xmm0
	movzbl	%cl, %ecx
	cmovbl	%eax, %ecx
	movl	%ecx, %eax
	orb	$8, %al
	ucomisd	40(%rsp), %xmm0
	movzbl	%al, %eax
	cmovbl	%ecx, %eax
	movl	%eax, %ecx
	orb	$4, %cl
	ucomisd	48(%rsp), %xmm0
	movzbl	%cl, %ecx
	cmovbl	%eax, %ecx
	movl	%ecx, %eax
	orb	$2, %al
	ucomisd	56(%rsp), %xmm0
	movzbl	%al, %edx
	cmovbl	%ecx, %edx
	ucomisd	64(%rsp), %xmm0
	setae	%al
	orb	%dl, %al
	jmp	.LBB98_29
.LBB98_17:
	xorl	%eax, %eax
.LBB98_29:
                                        # kill: def $al killed $al killed $eax
	addq	$232, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ"
	.globl	"?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ" # -- Begin function ?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ
	.p2align	4, 0x90
"?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ": # @"?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ"
.seh_proc "?_Xlength@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@CAXXZ"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	leaq	"??_C@_0BA@FOIKENOD@vector?5too?5long?$AA@"(%rip), %rcx
	callq	"?_Xlength_error@std@@YAXPEBD@Z"
	int3
	.seh_endproc
                                        # -- End function
	.def	"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
	.globl	"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z" # -- Begin function ?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z
	.p2align	4, 0x90
"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z": # @"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
.Lfunc_begin54:
.seh_proc "?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movabsq	$256204778801521551, %rax       # imm = 0x38E38E38E38E38F
	cmpq	%rax, %rdx
	jae	.LBB100_21
# %bb.1:
	movq	%rdx, %r14
	movq	%rcx, %rsi
	movq	(%rcx), %r15
	movq	8(%rcx), %r12
	leaq	(,%rdx,8), %rax
	leaq	(%rax,%rax,8), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB100_4
# %bb.2:
	cmpq	$-39, %rcx
	jae	.LBB100_21
# %bb.3:
	addq	$39, %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %rbx
	andq	$-32, %rbx
	movq	%rax, -8(%rbx)
	jmp	.LBB100_7
.LBB100_4:
	testq	%rcx, %rcx
	je	.LBB100_5
# %bb.6:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %rbx
	jmp	.LBB100_7
.LBB100_5:
	xorl	%ebx, %ebx
.LBB100_7:
	movq	(%rsi), %rax
	movq	8(%rsi), %rcx
	cmpq	%rcx, %rax
	je	.LBB100_12
# %bb.8:
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB100_9:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_10 Depth 2
	movq	%rdx, 64(%rdx)
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB100_10:                             #   Parent Loop BB100_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rax,%rdi,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, (%rdx,%rdi,8)
	incq	%rdi
	cmpq	$8, %rdi
	jne	.LBB100_10
# %bb.11:                               #   in Loop: Header=BB100_9 Depth=1
	addq	$72, %rdx
	addq	$72, %rax
	cmpq	%rcx, %rax
	jne	.LBB100_9
.LBB100_12:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.LBB100_20
# %bb.13:
	movq	16(%rsi), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB100_19
# %bb.14:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB100_15
# %bb.18:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB100_19:
	callq	"??3@YAXPEAX_K@Z"
.LBB100_20:
	subq	%r15, %r12
	movq	%rbx, (%rsi)
	addq	%rbx, %r12
	movq	%r12, 8(%rsi)
	leaq	(%r14,%r14,8), %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 16(%rsi)
	addq	$48, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB100_21:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB100_15:
.Ltmp352:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp353:
# %bb.16:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z")@IMGREL
	.section	.text,"xr",discard,"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
	.seh_endproc
	.def	"?dtor$17@?0??_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$17@?0??_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z@4HA":
.seh_proc "?dtor$17@?0??_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z@4HA"
.LBB100_17:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end54:
	.seh_handlerdata
	.section	.text,"xr",discard,"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
	.p2align	2
"$cppxdata$?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z":
	.long	-1                              # ToState
	.long	"?dtor$17@?0??_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z@4HA"@IMGREL # Action
"$ip2state$?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z":
	.long	.Lfunc_begin54@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp352@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp353@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?_Reallocate_exactly@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAX_K@Z"
                                        # -- End function
	.def	"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
	.globl	"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z" # -- Begin function ??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z
	.p2align	4, 0x90
"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z": # @"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
.Lfunc_begin55:
.seh_proc "??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rdx, %rbx
	movq	%rcx, %r15
	movq	(%rcx), %rcx
	movq	8(%r15), %r12
	subq	%rcx, %r12
	sarq	$3, %r12
	movabsq	$-8198552921648689607, %rsi     # imm = 0x8E38E38E38E38E39
	movq	%rdx, %rax
	subq	%rcx, %rax
	movabsq	$1024819115206086201, %rdx      # imm = 0xE38E38E38E38E39
	imulq	%rdx
	movq	%rdx, %rdi
	imulq	%rsi, %r12
	incq	%r12
	movq	16(%r15), %rax
	subq	%rcx, %rax
	sarq	$3, %rax
	imulq	%rsi, %rax
	movq	%rax, %r13
	shrq	%r13
	movabsq	$256204778801521550, %rcx       # imm = 0x38E38E38E38E38E
	movq	%rcx, %rdx
	subq	%r13, %rdx
	addq	%rax, %r13
	cmpq	%r12, %r13
	cmovbeq	%r12, %r13
	cmpq	%rdx, %rax
	cmovaq	%rcx, %r13
	movabsq	$256204778801521551, %rax       # imm = 0x38E38E38E38E38F
	cmpq	%rax, %r13
	jae	.LBB101_32
# %bb.1:
	movq	%r8, %rsi
	leaq	(,%r13,8), %rax
	leaq	(%rax,%rax,8), %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jb	.LBB101_4
# %bb.2:
	cmpq	$-39, %rcx
	jae	.LBB101_32
# %bb.3:
	addq	$39, %rcx
	callq	"??2@YAPEAX_K@Z"
	leaq	39(%rax), %r14
	andq	$-32, %r14
	movq	%rax, -8(%r14)
	jmp	.LBB101_5
.LBB101_4:
	callq	"??2@YAPEAX_K@Z"
	movq	%rax, %r14
.LBB101_5:
	movq	%rdi, %rax
	shrq	$63, %rax
	sarq	$2, %rdi
	addq	%rax, %rdi
	leaq	(%rdi,%rdi,8), %rax
	leaq	(%r14,%rax,8), %rdi
	movq	%rdi, 64(%r14,%rax,8)
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB101_6:                              # =>This Inner Loop Header: Depth=1
	movsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, (%rdi,%rax,8)
	incq	%rax
	cmpq	$8, %rax
	jne	.LBB101_6
# %bb.7:
	movq	(%r15), %rax
	movq	8(%r15), %rcx
	cmpq	%rbx, %rcx
	je	.LBB101_8
# %bb.13:
	cmpq	%rbx, %rax
	je	.LBB101_18
# %bb.14:
	movq	%r14, %rcx
	jmp	.LBB101_15
	.p2align	4, 0x90
.LBB101_17:                             #   in Loop: Header=BB101_15 Depth=1
	addq	$72, %rcx
	addq	$72, %rax
	cmpq	%rbx, %rax
	je	.LBB101_18
.LBB101_15:                             # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_16 Depth 2
	movq	%rcx, 64(%rcx)
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB101_16:                             #   Parent Loop BB101_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rax,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, (%rcx,%rdx,8)
	incq	%rdx
	cmpq	$8, %rdx
	jne	.LBB101_16
	jmp	.LBB101_17
.LBB101_18:
	movq	8(%r15), %rax
	cmpq	%rbx, %rax
	je	.LBB101_23
# %bb.19:
	movq	%rdi, %rcx
	jmp	.LBB101_20
	.p2align	4, 0x90
.LBB101_22:                             #   in Loop: Header=BB101_20 Depth=1
	addq	$72, %rbx
	movq	%rdx, %rcx
	cmpq	%rax, %rbx
	je	.LBB101_23
.LBB101_20:                             # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_21 Depth 2
	leaq	72(%rcx), %rdx
	movq	%rdx, 136(%rcx)
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB101_21:                             #   Parent Loop BB101_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rbx,%rsi,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 72(%rcx,%rsi,8)
	incq	%rsi
	cmpq	$8, %rsi
	jne	.LBB101_21
	jmp	.LBB101_22
.LBB101_8:
	cmpq	%rcx, %rax
	je	.LBB101_23
# %bb.9:
	movq	%r14, %rdx
	.p2align	4, 0x90
.LBB101_10:                             # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_11 Depth 2
	movq	%rdx, 64(%rdx)
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB101_11:                             #   Parent Loop BB101_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rax,%rbx,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, (%rdx,%rbx,8)
	incq	%rbx
	cmpq	$8, %rbx
	jne	.LBB101_11
# %bb.12:                               #   in Loop: Header=BB101_10 Depth=1
	addq	$72, %rdx
	addq	$72, %rax
	cmpq	%rcx, %rax
	jne	.LBB101_10
.LBB101_23:
	movq	(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB101_31
# %bb.24:
	movq	16(%r15), %rdx
	subq	%rcx, %rdx
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB101_30
# %bb.25:
	movq	-8(%rcx), %rax
	addq	$-8, %rcx
	subq	%rax, %rcx
	cmpq	$32, %rcx
	jae	.LBB101_26
# %bb.29:
	addq	$39, %rdx
	movq	%rax, %rcx
.LBB101_30:
	callq	"??3@YAXPEAX_K@Z"
.LBB101_31:
	movq	%r14, (%r15)
	leaq	(%r12,%r12,8), %rax
	leaq	(%r14,%rax,8), %rax
	movq	%rax, 8(%r15)
	leaq	(,%r13,8), %rax
	addq	%r13, %rax
	leaq	(%r14,%rax,8), %rax
	movq	%rax, 16(%r15)
	movq	%rdi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB101_32:
	callq	"?_Throw_bad_array_new_length@std@@YAXXZ"
.LBB101_26:
.Ltmp354:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp355:
# %bb.27:
	int3
	.seh_handlerdata
	.long	("$cppxdata$??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z")@IMGREL
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
	.seh_endproc
	.def	"?dtor$28@?0???$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$28@?0???$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z@4HA":
.seh_proc "?dtor$28@?0???$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z@4HA"
.LBB101_28:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end55:
	.seh_handlerdata
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
	.p2align	2
"$cppxdata$??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z")@IMGREL # IPToStateXData
	.long	32                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z":
	.long	-1                              # ToState
	.long	"?dtor$28@?0???$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z@4HA"@IMGREL # Action
"$ip2state$??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z":
	.long	.Lfunc_begin55@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp354@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp355@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"??$_Emplace_reallocate@AEBV?$VectorizedNumber@N@@@?$vector@V?$VectorizedNumber@N@@V?$allocator@V?$VectorizedNumber@N@@@std@@@std@@AEAAPEAV?$VectorizedNumber@N@@QEAV2@AEBV2@@Z"
                                        # -- End function
	.def	"??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z"
	.globl	"??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z" # -- Begin function ??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z
	.p2align	4, 0x90
"??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z": # @"??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z"
.seh_proc "??$_Destroy_range@V?$allocator@Vthread@std@@@std@@@std@@YAXPEAVthread@0@QEAV10@AEAV?$allocator@Vthread@std@@@0@@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	cmpq	%rdx, %rcx
	je	.LBB102_2
	.p2align	4, 0x90
.LBB102_4:                              # =>This Inner Loop Header: Depth=1
	cmpl	$0, 8(%rcx)
	jne	.LBB102_5
# %bb.3:                                #   in Loop: Header=BB102_4 Depth=1
	addq	$16, %rcx
	cmpq	%rdx, %rcx
	jne	.LBB102_4
.LBB102_2:
	addq	$40, %rsp
	retq
.LBB102_5:
	callq	terminate
	int3
	.seh_endproc
                                        # -- End function
	.def	"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
	.globl	"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z" # -- Begin function ?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z
	.p2align	4, 0x90
"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z": # @"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
.Lfunc_begin56:
.seh_proc "?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
	shlq	$4, %r8
	cmpq	$4096, %r8                      # imm = 0x1000
	jb	.LBB103_6
# %bb.1:
	movq	-8(%rdx), %rax
	addq	$-8, %rdx
	subq	%rax, %rdx
	cmpq	$32, %rdx
	jae	.LBB103_2
# %bb.5:
	addq	$39, %r8
	movq	%rax, %rdx
.LBB103_6:
	movq	%rdx, %rcx
	movq	%r8, %rdx
	addq	$48, %rsp
	popq	%rbp
	jmp	"??3@YAXPEAX_K@Z"               # TAILCALL
.LBB103_2:
.Ltmp356:
	callq	_invalid_parameter_noinfo_noreturn
.Ltmp357:
# %bb.3:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z")@IMGREL
	.section	.text,"xr",discard,"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
	.seh_endproc
	.def	"?dtor$4@?0??deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$4@?0??deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z@4HA":
.seh_proc "?dtor$4@?0??deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z@4HA"
.LBB103_4:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end56:
	.seh_handlerdata
	.section	.text,"xr",discard,"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
	.p2align	2
"$cppxdata$?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z":
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	("$stateUnwindMap$?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z")@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	("$ip2state$?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z")@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z":
	.long	-1                              # ToState
	.long	"?dtor$4@?0??deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z@4HA"@IMGREL # Action
"$ip2state$?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z":
	.long	.Lfunc_begin56@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp356@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp357@IMGREL+1               # IP
	.long	-1                              # ToState
	.section	.text,"xr",discard,"?deallocate@?$allocator@Vthread@std@@@std@@QEAAXQEAVthread@2@_K@Z"
                                        # -- End function
	.def	"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.globl	"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z" # -- Begin function ?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z
	.p2align	4, 0x90
"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z": # @"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
.Lfunc_begin57:
.seh_proc "?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$152, %rsp
	.seh_stackalloc 152
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	$-2, 16(%rbp)
	movq	%r8, %rsi
	movq	%rdx, %rdi
	movq	%rcx, %rbx
	movq	%rcx, -8(%rbp)
	movq	(%rcx), %rax
	movslq	4(%rax), %rax
	movq	72(%rcx,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB104_2
# %bb.1:
	movq	(%rcx), %rax
	callq	*8(%rax)
.LBB104_2:
	movq	(%rbx), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rbx,%rax)
	je	.LBB104_4
# %bb.3:
	movb	$0, (%rbp)
	jmp	.LBB104_9
.LBB104_4:
	movq	80(%rbx,%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB104_6
# %bb.5:
	cmpq	%rbx, %rcx
	je	.LBB104_6
# %bb.7:
.Ltmp358:
	callq	"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"
.Ltmp359:
# %bb.8:
	movq	(%rbx), %rax
	movslq	4(%rax), %rax
	cmpl	$0, 16(%rbx,%rax)
	sete	(%rbp)
	jmp	.LBB104_9
.LBB104_6:
	movb	$1, (%rbp)
.LBB104_9:
	cmpb	$0, (%rbp)
	movq	%rbx, -16(%rbp)                 # 8-byte Spill
	je	.LBB104_10
# %bb.11:
	testq	%rsi, %rsi
	jle	.LBB104_12
# %bb.15:
	movq	(%rbx), %rax
	movslq	4(%rax), %rax
	movq	72(%rbx,%rax), %rcx
	movq	(%rcx), %rax
.Ltmp360:
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	*72(%rax)
.Ltmp361:
# %bb.16:
	xorl	%ecx, %ecx
	cmpq	%rsi, %rax
	setne	%cl
	shll	$2, %ecx
	movl	%ecx, 12(%rbp)                  # 4-byte Spill
	jmp	.LBB104_17
.LBB104_10:
	movl	$4, 12(%rbp)                    # 4-byte Folded Spill
	jmp	.LBB104_17
.LBB104_12:
	movl	$0, 12(%rbp)                    # 4-byte Folded Spill
.LBB104_17:                             # Block address taken
$ehgcr_104_17:
	movq	-16(%rbp), %rsi                 # 8-byte Reload
	movq	(%rsi), %rax
	movslq	4(%rax), %rcx
	movl	16(%rsi,%rcx), %eax
	xorl	%edx, %edx
	cmpq	$0, 72(%rsi,%rcx)
	sete	%dl
	shll	$2, %edx
	andl	$23, %eax
	orl	12(%rbp), %eax                  # 4-byte Folded Reload
	orl	%edx, %eax
	movl	%eax, 16(%rsi,%rcx)
	andl	20(%rsi,%rcx), %eax
	jne	.LBB104_18
# %bb.21:
	callq	"?uncaught_exception@std@@YA_NXZ"
	testb	%al, %al
	jne	.LBB104_23
# %bb.22:
	movq	-8(%rbp), %rcx
.Ltmp368:
	callq	"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"
.Ltmp369:
.LBB104_23:
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movslq	4(%rcx), %rcx
	movq	72(%rax,%rcx), %rcx
	testq	%rcx, %rcx
	je	.LBB104_25
# %bb.24:
	movq	(%rcx), %rax
.Ltmp370:
	callq	*16(%rax)
.Ltmp371:
.LBB104_25:
	movq	%rsi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq
.LBB104_18:
	testb	$2, %al
	leaq	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"(%rip), %rcx
	leaq	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"(%rip), %rdx
	cmoveq	%rcx, %rdx
	testb	$4, %al
	leaq	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"(%rip), %rsi
	cmoveq	%rdx, %rsi
	leaq	-48(%rbp), %rcx
	movl	$1, %edx
	callq	"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"
	movups	-48(%rbp), %xmm0
	movaps	%xmm0, -32(%rbp)
.Ltmp364:
	leaq	-88(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	%rsi, %r8
	callq	"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"
.Ltmp365:
# %bb.19:
	leaq	"??_7failure@ios_base@std@@6B@"(%rip), %rax
	movq	%rax, -88(%rbp)
.Ltmp366:
	leaq	"_TI5?AVfailure@ios_base@std@@"(%rip), %rdx
	leaq	-88(%rbp), %rcx
	callq	_CxxThrowException
.Ltmp367:
# %bb.20:
	int3
	.seh_handlerdata
	.long	("$cppxdata$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z")@IMGREL
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.seh_endproc
	.def	"?catch$13@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?catch$13@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA":
.seh_proc "?catch$13@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"
	.seh_handler __CxxFrameHandler3, @unwind, @except
.LBB104_13:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	movq	-16(%rbp), %rdx                 # 8-byte Reload
	movq	(%rdx), %rax
	movslq	4(%rax), %rcx
	addq	%rdx, %rcx
.Ltmp362:
	movl	$4, %edx
	movb	$1, %r8b
	callq	"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"
.Ltmp363:
# %bb.14:
	movl	$0, 12(%rbp)                    # 4-byte Folded Spill
	leaq	.LBB104_17(%rip), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CATCHRET
	.seh_handlerdata
	.long	("$cppxdata$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z")@IMGREL
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.seh_endproc
	.def	"?dtor$26@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$26@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA":
.seh_proc "?dtor$26@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"
.LBB104_26:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.seh_endproc
	.def	"?dtor$27@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$27@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA":
.seh_proc "?dtor$27@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"
.LBB104_27:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
	.seh_handlerdata
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.seh_endproc
	.def	"?dtor$28@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$28@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA":
.seh_proc "?dtor$28@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"
.LBB104_28:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-8(%rbp), %rcx
	callq	"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
	.seh_handlerdata
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.seh_endproc
	.def	"?dtor$29@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$29@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA":
.seh_proc "?dtor$29@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"
.LBB104_29:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	128(%rdx), %rbp
	.seh_endprologue
	leaq	-8(%rbp), %rcx
	callq	"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	retq                                    # CLEANUPRET
.Lfunc_end57:
	.seh_handlerdata
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.seh_endproc
	.section	.xdata,"dr",associative,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
	.p2align	2
"$cppxdata$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z":
	.long	429065506                       # MagicNumber
	.long	6                               # MaxState
	.long	("$stateUnwindMap$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z")@IMGREL # UnwindMap
	.long	1                               # NumTryBlocks
	.long	("$tryMap$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z")@IMGREL # TryBlockMap
	.long	8                               # IPMapEntries
	.long	("$ip2state$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z")@IMGREL # IPToStateXData
	.long	144                             # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
"$stateUnwindMap$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z":
	.long	-1                              # ToState
	.long	"?dtor$29@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$26@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$27@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"@IMGREL # Action
	.long	-1                              # ToState
	.long	"?dtor$28@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"@IMGREL # Action
	.long	3                               # ToState
	.long	0                               # Action
	.long	3                               # ToState
	.long	0                               # Action
"$tryMap$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z":
	.long	4                               # TryLow
	.long	4                               # TryHigh
	.long	5                               # CatchHigh
	.long	1                               # NumCatches
	.long	("$handlerMap$0$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z")@IMGREL # HandlerArray
"$handlerMap$0$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z":
	.long	64                              # Adjectives
	.long	0                               # Type
	.long	0                               # CatchObjOffset
	.long	"?catch$13@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"@IMGREL # Handler
	.long	88                              # ParentFrameOffset
"$ip2state$?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z":
	.long	.Lfunc_begin57@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp358@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp360@IMGREL+1               # IP
	.long	4                               # ToState
	.long	.Ltmp368@IMGREL+1               # IP
	.long	2                               # ToState
	.long	.Ltmp370@IMGREL+1               # IP
	.long	1                               # ToState
	.long	.Ltmp364@IMGREL+1               # IP
	.long	3                               # ToState
	.long	.Ltmp367@IMGREL+1               # IP
	.long	-1                              # ToState
	.long	"?catch$13@?0??write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z@4HA"@IMGREL # IP
	.long	5                               # ToState
	.section	.text,"xr",discard,"?write@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@PEBD_J@Z"
                                        # -- End function
	.def	"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
	.globl	"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ" # -- Begin function ??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ
	.p2align	4, 0x90
"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ": # @"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
# %bb.0:
	movq	$0, "?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"(%rip)
	retq
                                        # -- End function
	.def	"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
	.globl	"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ" # -- Begin function ??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ
	.p2align	4, 0x90
"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ": # @"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
# %bb.0:
	movq	$0, "?id@?$numpunct@D@std@@2V0locale@2@A"(%rip)
	retq
                                        # -- End function
	.def	_GLOBAL__sub_I_mandelbrot.cpp;
	.scl	3;
	.type	32;
	.endef
	.text
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_mandelbrot.cpp
_GLOBAL__sub_I_mandelbrot.cpp:          # @_GLOBAL__sub_I_mandelbrot.cpp
.Lfunc_begin58:
.seh_proc _GLOBAL__sub_I_mandelbrot.cpp
	.seh_handler __CxxFrameHandler3, @unwind, @except
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, -8(%rbp)
.Ltmp372:
	callq	_Thrd_hardware_concurrency
.Ltmp373:
# %bb.1:
	movl	%eax, numberOfCpuCores(%rip)
	addq	$48, %rsp
	popq	%rbp
	retq
	.seh_handlerdata
	.long	($cppxdata$_GLOBAL__sub_I_mandelbrot.cpp)@IMGREL
	.text
	.seh_endproc
	.def	"?dtor$2@?0?_GLOBAL__sub_I_mandelbrot.cpp@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90
"?dtor$2@?0?_GLOBAL__sub_I_mandelbrot.cpp@4HA":
.seh_proc "?dtor$2@?0?_GLOBAL__sub_I_mandelbrot.cpp@4HA"
.LBB107_2:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	48(%rdx), %rbp
	.seh_endprologue
	callq	__std_terminate
	int3
.Lfunc_end58:
	.seh_handlerdata
	.text
	.seh_endproc
	.section	.xdata,"dr"
	.p2align	2
$cppxdata$_GLOBAL__sub_I_mandelbrot.cpp:
	.long	429065506                       # MagicNumber
	.long	1                               # MaxState
	.long	($stateUnwindMap$_GLOBAL__sub_I_mandelbrot.cpp)@IMGREL # UnwindMap
	.long	0                               # NumTryBlocks
	.long	0                               # TryBlockMap
	.long	3                               # IPMapEntries
	.long	($ip2state$_GLOBAL__sub_I_mandelbrot.cpp)@IMGREL # IPToStateXData
	.long	40                              # UnwindHelp
	.long	0                               # ESTypeList
	.long	1                               # EHFlags
$stateUnwindMap$_GLOBAL__sub_I_mandelbrot.cpp:
	.long	-1                              # ToState
	.long	"?dtor$2@?0?_GLOBAL__sub_I_mandelbrot.cpp@4HA"@IMGREL # Action
$ip2state$_GLOBAL__sub_I_mandelbrot.cpp:
	.long	.Lfunc_begin58@IMGREL           # IP
	.long	-1                              # ToState
	.long	.Ltmp372@IMGREL+1               # IP
	.long	0                               # ToState
	.long	.Ltmp373@IMGREL+1               # IP
	.long	-1                              # ToState
	.text
                                        # -- End function
	.lcomm	numberOfCpuCores,4,4            # @numberOfCpuCores
	.section	.rdata,"dr",discard,"??_C@_02NHCIPLKK@P4?$AA@"
	.globl	"??_C@_02NHCIPLKK@P4?$AA@"      # @"??_C@_02NHCIPLKK@P4?$AA@"
"??_C@_02NHCIPLKK@P4?$AA@":
	.asciz	"P4"

	.section	.rdata,"dr",discard,"??_C@_0BA@FOIKENOD@vector?5too?5long?$AA@"
	.globl	"??_C@_0BA@FOIKENOD@vector?5too?5long?$AA@" # @"??_C@_0BA@FOIKENOD@vector?5too?5long?$AA@"
"??_C@_0BA@FOIKENOD@vector?5too?5long?$AA@":
	.asciz	"vector too long"

	.section	.data,"dw",discard,"??_R0?AVbad_array_new_length@std@@@8"
	.globl	"??_R0?AVbad_array_new_length@std@@@8" # @"??_R0?AVbad_array_new_length@std@@@8"
	.p2align	4
"??_R0?AVbad_array_new_length@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVbad_array_new_length@std@@"
	.zero	1

	.section	.xdata,"dr",discard,"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24"
	.globl	"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" # @"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24"
	.p2align	4
"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24":
	.long	0                               # 0x0
	.long	"??_R0?AVbad_array_new_length@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	24                              # 0x18
	.long	"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"@IMGREL

	.section	.data,"dw",discard,"??_R0?AVbad_alloc@std@@@8"
	.globl	"??_R0?AVbad_alloc@std@@@8"     # @"??_R0?AVbad_alloc@std@@@8"
	.p2align	4
"??_R0?AVbad_alloc@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVbad_alloc@std@@"
	.zero	4

	.section	.xdata,"dr",discard,"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24"
	.globl	"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" # @"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24"
	.p2align	4
"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24":
	.long	16                              # 0x10
	.long	"??_R0?AVbad_alloc@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	24                              # 0x18
	.long	"??0bad_alloc@std@@QEAA@AEBV01@@Z"@IMGREL

	.section	.data,"dw",discard,"??_R0?AVexception@std@@@8"
	.globl	"??_R0?AVexception@std@@@8"     # @"??_R0?AVexception@std@@@8"
	.p2align	4
"??_R0?AVexception@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVexception@std@@"
	.zero	4

	.section	.xdata,"dr",discard,"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24"
	.globl	"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" # @"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24"
	.p2align	4
"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24":
	.long	0                               # 0x0
	.long	"??_R0?AVexception@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	24                              # 0x18
	.long	"??0exception@std@@QEAA@AEBV01@@Z"@IMGREL

	.section	.xdata,"dr",discard,"_CTA3?AVbad_array_new_length@std@@"
	.globl	"_CTA3?AVbad_array_new_length@std@@" # @"_CTA3?AVbad_array_new_length@std@@"
	.p2align	3
"_CTA3?AVbad_array_new_length@std@@":
	.long	3                               # 0x3
	.long	"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24"@IMGREL
	.long	"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24"@IMGREL
	.long	"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24"@IMGREL

	.section	.xdata,"dr",discard,"_TI3?AVbad_array_new_length@std@@"
	.globl	"_TI3?AVbad_array_new_length@std@@" # @"_TI3?AVbad_array_new_length@std@@"
	.p2align	3
"_TI3?AVbad_array_new_length@std@@":
	.long	0                               # 0x0
	.long	"??1exception@std@@UEAA@XZ"@IMGREL
	.long	0                               # 0x0
	.long	"_CTA3?AVbad_array_new_length@std@@"@IMGREL

	.section	.rdata,"dr",discard,"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@"
	.globl	"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@" # @"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@"
"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@":
	.asciz	"bad array new length"

	.section	.rdata,"dr",largest,"??_7bad_array_new_length@std@@6B@"
	.p2align	4                               # @0
.L__unnamed_1:
	.quad	"??_R4bad_array_new_length@std@@6B@"
	.quad	"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4bad_array_new_length@std@@6B@"
	.globl	"??_R4bad_array_new_length@std@@6B@" # @"??_R4bad_array_new_length@std@@6B@"
	.p2align	4
"??_R4bad_array_new_length@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVbad_array_new_length@std@@@8"@IMGREL
	.long	"??_R3bad_array_new_length@std@@8"@IMGREL
	.long	"??_R4bad_array_new_length@std@@6B@"@IMGREL

	.section	.rdata,"dr",discard,"??_R3bad_array_new_length@std@@8"
	.globl	"??_R3bad_array_new_length@std@@8" # @"??_R3bad_array_new_length@std@@8"
	.p2align	3
"??_R3bad_array_new_length@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	3                               # 0x3
	.long	"??_R2bad_array_new_length@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2bad_array_new_length@std@@8"
	.globl	"??_R2bad_array_new_length@std@@8" # @"??_R2bad_array_new_length@std@@8"
	.p2align	2
"??_R2bad_array_new_length@std@@8":
	.long	"??_R1A@?0A@EA@bad_array_new_length@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@bad_alloc@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@bad_array_new_length@std@@8"
	.globl	"??_R1A@?0A@EA@bad_array_new_length@std@@8" # @"??_R1A@?0A@EA@bad_array_new_length@std@@8"
	.p2align	4
"??_R1A@?0A@EA@bad_array_new_length@std@@8":
	.long	"??_R0?AVbad_array_new_length@std@@@8"@IMGREL
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3bad_array_new_length@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@bad_alloc@std@@8"
	.globl	"??_R1A@?0A@EA@bad_alloc@std@@8" # @"??_R1A@?0A@EA@bad_alloc@std@@8"
	.p2align	4
"??_R1A@?0A@EA@bad_alloc@std@@8":
	.long	"??_R0?AVbad_alloc@std@@@8"@IMGREL
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3bad_alloc@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R3bad_alloc@std@@8"
	.globl	"??_R3bad_alloc@std@@8"         # @"??_R3bad_alloc@std@@8"
	.p2align	3
"??_R3bad_alloc@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	"??_R2bad_alloc@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2bad_alloc@std@@8"
	.globl	"??_R2bad_alloc@std@@8"         # @"??_R2bad_alloc@std@@8"
	.p2align	2
"??_R2bad_alloc@std@@8":
	.long	"??_R1A@?0A@EA@bad_alloc@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@exception@std@@8"
	.globl	"??_R1A@?0A@EA@exception@std@@8" # @"??_R1A@?0A@EA@exception@std@@8"
	.p2align	4
"??_R1A@?0A@EA@exception@std@@8":
	.long	"??_R0?AVexception@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3exception@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R3exception@std@@8"
	.globl	"??_R3exception@std@@8"         # @"??_R3exception@std@@8"
	.p2align	3
"??_R3exception@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	"??_R2exception@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2exception@std@@8"
	.globl	"??_R2exception@std@@8"         # @"??_R2exception@std@@8"
	.p2align	2
"??_R2exception@std@@8":
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",largest,"??_7bad_alloc@std@@6B@"
	.p2align	4                               # @1
.L__unnamed_2:
	.quad	"??_R4bad_alloc@std@@6B@"
	.quad	"??_Gbad_alloc@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4bad_alloc@std@@6B@"
	.globl	"??_R4bad_alloc@std@@6B@"       # @"??_R4bad_alloc@std@@6B@"
	.p2align	4
"??_R4bad_alloc@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVbad_alloc@std@@@8"@IMGREL
	.long	"??_R3bad_alloc@std@@8"@IMGREL
	.long	"??_R4bad_alloc@std@@6B@"@IMGREL

	.section	.rdata,"dr",largest,"??_7exception@std@@6B@"
	.p2align	4                               # @2
.L__unnamed_3:
	.quad	"??_R4exception@std@@6B@"
	.quad	"??_Gexception@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4exception@std@@6B@"
	.globl	"??_R4exception@std@@6B@"       # @"??_R4exception@std@@6B@"
	.p2align	4
"??_R4exception@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVexception@std@@@8"@IMGREL
	.long	"??_R3exception@std@@8"@IMGREL
	.long	"??_R4exception@std@@6B@"@IMGREL

	.section	.rdata,"dr",discard,"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@"
	.globl	"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@" # @"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@"
"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@":
	.asciz	"Unknown exception"

	.section	.rdata,"dr",discard,"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"
	.globl	"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@" # @"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"
"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@":
	.asciz	"ios_base::badbit set"

	.section	.rdata,"dr",discard,"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"
	.globl	"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@" # @"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"
"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@":
	.asciz	"ios_base::failbit set"

	.section	.rdata,"dr",discard,"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"
	.globl	"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@" # @"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@"
"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@":
	.asciz	"ios_base::eofbit set"

	.section	.data,"dw",discard,"??_R0?AVfailure@ios_base@std@@@8"
	.globl	"??_R0?AVfailure@ios_base@std@@@8" # @"??_R0?AVfailure@ios_base@std@@@8"
	.p2align	4
"??_R0?AVfailure@ios_base@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVfailure@ios_base@std@@"
	.zero	5

	.section	.xdata,"dr",discard,"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40"
	.globl	"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40" # @"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40"
	.p2align	4
"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40":
	.long	0                               # 0x0
	.long	"??_R0?AVfailure@ios_base@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	40                              # 0x28
	.long	"??0failure@ios_base@std@@QEAA@AEBV012@@Z"@IMGREL

	.section	.data,"dw",discard,"??_R0?AVsystem_error@std@@@8"
	.globl	"??_R0?AVsystem_error@std@@@8"  # @"??_R0?AVsystem_error@std@@@8"
	.p2align	4
"??_R0?AVsystem_error@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVsystem_error@std@@"
	.zero	1

	.section	.xdata,"dr",discard,"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40"
	.globl	"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40" # @"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40"
	.p2align	4
"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40":
	.long	0                               # 0x0
	.long	"??_R0?AVsystem_error@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	40                              # 0x28
	.long	"??0system_error@std@@QEAA@AEBV01@@Z"@IMGREL

	.section	.data,"dw",discard,"??_R0?AV_System_error@std@@@8"
	.globl	"??_R0?AV_System_error@std@@@8" # @"??_R0?AV_System_error@std@@@8"
	.p2align	4
"??_R0?AV_System_error@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AV_System_error@std@@"

	.section	.xdata,"dr",discard,"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40"
	.globl	"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40" # @"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40"
	.p2align	4
"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40":
	.long	0                               # 0x0
	.long	"??_R0?AV_System_error@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	40                              # 0x28
	.long	"??0_System_error@std@@QEAA@AEBV01@@Z"@IMGREL

	.section	.data,"dw",discard,"??_R0?AVruntime_error@std@@@8"
	.globl	"??_R0?AVruntime_error@std@@@8" # @"??_R0?AVruntime_error@std@@@8"
	.p2align	4
"??_R0?AVruntime_error@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVruntime_error@std@@"

	.section	.xdata,"dr",discard,"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24"
	.globl	"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24" # @"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24"
	.p2align	4
"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24":
	.long	0                               # 0x0
	.long	"??_R0?AVruntime_error@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	24                              # 0x18
	.long	"??0runtime_error@std@@QEAA@AEBV01@@Z"@IMGREL

	.section	.xdata,"dr",discard,"_CTA5?AVfailure@ios_base@std@@"
	.globl	"_CTA5?AVfailure@ios_base@std@@" # @"_CTA5?AVfailure@ios_base@std@@"
	.p2align	4
"_CTA5?AVfailure@ios_base@std@@":
	.long	5                               # 0x5
	.long	"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40"@IMGREL
	.long	"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40"@IMGREL
	.long	"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40"@IMGREL
	.long	"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24"@IMGREL
	.long	"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24"@IMGREL

	.section	.xdata,"dr",discard,"_TI5?AVfailure@ios_base@std@@"
	.globl	"_TI5?AVfailure@ios_base@std@@" # @"_TI5?AVfailure@ios_base@std@@"
	.p2align	3
"_TI5?AVfailure@ios_base@std@@":
	.long	0                               # 0x0
	.long	"??1exception@std@@UEAA@XZ"@IMGREL
	.long	0                               # 0x0
	.long	"_CTA5?AVfailure@ios_base@std@@"@IMGREL

	.section	.data,"dw",discard,"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@A"
	.globl	"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@A" # @"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@A"
	.p2align	3
"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@A":
	.quad	"??_7_Iostream_error_category2@std@@6B@"
	.quad	5                               # 0x5

	.section	.rdata,"dr",largest,"??_7_Iostream_error_category2@std@@6B@"
	.p2align	4                               # @3
.L__unnamed_4:
	.quad	"??_R4_Iostream_error_category2@std@@6B@"
	.quad	"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z"
	.quad	"?name@_Iostream_error_category2@std@@UEBAPEBDXZ"
	.quad	"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z"
	.quad	"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z"
	.quad	"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z"
	.quad	"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z"

	.section	.bss,"bw",discard,"?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA"
	.globl	"?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA" # @"?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA"
	.p2align	2
"?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA":
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R4_Iostream_error_category2@std@@6B@"
	.globl	"??_R4_Iostream_error_category2@std@@6B@" # @"??_R4_Iostream_error_category2@std@@6B@"
	.p2align	4
"??_R4_Iostream_error_category2@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AV_Iostream_error_category2@std@@@8"@IMGREL
	.long	"??_R3_Iostream_error_category2@std@@8"@IMGREL
	.long	"??_R4_Iostream_error_category2@std@@6B@"@IMGREL

	.section	.data,"dw",discard,"??_R0?AV_Iostream_error_category2@std@@@8"
	.globl	"??_R0?AV_Iostream_error_category2@std@@@8" # @"??_R0?AV_Iostream_error_category2@std@@@8"
	.p2align	4
"??_R0?AV_Iostream_error_category2@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AV_Iostream_error_category2@std@@"
	.zero	4

	.section	.rdata,"dr",discard,"??_R3_Iostream_error_category2@std@@8"
	.globl	"??_R3_Iostream_error_category2@std@@8" # @"??_R3_Iostream_error_category2@std@@8"
	.p2align	3
"??_R3_Iostream_error_category2@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	"??_R2_Iostream_error_category2@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2_Iostream_error_category2@std@@8"
	.globl	"??_R2_Iostream_error_category2@std@@8" # @"??_R2_Iostream_error_category2@std@@8"
	.p2align	2
"??_R2_Iostream_error_category2@std@@8":
	.long	"??_R1A@?0A@EA@_Iostream_error_category2@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@error_category@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@_Iostream_error_category2@std@@8"
	.globl	"??_R1A@?0A@EA@_Iostream_error_category2@std@@8" # @"??_R1A@?0A@EA@_Iostream_error_category2@std@@8"
	.p2align	4
"??_R1A@?0A@EA@_Iostream_error_category2@std@@8":
	.long	"??_R0?AV_Iostream_error_category2@std@@@8"@IMGREL
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3_Iostream_error_category2@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@error_category@std@@8"
	.globl	"??_R1A@?0A@EA@error_category@std@@8" # @"??_R1A@?0A@EA@error_category@std@@8"
	.p2align	4
"??_R1A@?0A@EA@error_category@std@@8":
	.long	"??_R0?AVerror_category@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3error_category@std@@8"@IMGREL

	.section	.data,"dw",discard,"??_R0?AVerror_category@std@@@8"
	.globl	"??_R0?AVerror_category@std@@@8" # @"??_R0?AVerror_category@std@@@8"
	.p2align	4
"??_R0?AVerror_category@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVerror_category@std@@"
	.zero	7

	.section	.rdata,"dr",discard,"??_R3error_category@std@@8"
	.globl	"??_R3error_category@std@@8"    # @"??_R3error_category@std@@8"
	.p2align	3
"??_R3error_category@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	"??_R2error_category@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2error_category@std@@8"
	.globl	"??_R2error_category@std@@8"    # @"??_R2error_category@std@@8"
	.p2align	2
"??_R2error_category@std@@8":
	.long	"??_R1A@?0A@EA@error_category@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_08LLGCOLLL@iostream?$AA@"
	.globl	"??_C@_08LLGCOLLL@iostream?$AA@" # @"??_C@_08LLGCOLLL@iostream?$AA@"
"??_C@_08LLGCOLLL@iostream?$AA@":
	.asciz	"iostream"

	.section	.rdata,"dr",discard,"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB"
	.globl	"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB" # @"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB"
	.p2align	4
"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB":
	.asciz	"iostream stream error"

	.section	.rdata,"dr",discard,"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@"
	.globl	"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@" # @"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@"
"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@":
	.asciz	"string too long"

	.section	.rdata,"dr",largest,"??_7failure@ios_base@std@@6B@"
	.p2align	4                               # @4
.L__unnamed_5:
	.quad	"??_R4failure@ios_base@std@@6B@"
	.quad	"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4failure@ios_base@std@@6B@"
	.globl	"??_R4failure@ios_base@std@@6B@" # @"??_R4failure@ios_base@std@@6B@"
	.p2align	4
"??_R4failure@ios_base@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVfailure@ios_base@std@@@8"@IMGREL
	.long	"??_R3failure@ios_base@std@@8"@IMGREL
	.long	"??_R4failure@ios_base@std@@6B@"@IMGREL

	.section	.rdata,"dr",discard,"??_R3failure@ios_base@std@@8"
	.globl	"??_R3failure@ios_base@std@@8"  # @"??_R3failure@ios_base@std@@8"
	.p2align	3
"??_R3failure@ios_base@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	5                               # 0x5
	.long	"??_R2failure@ios_base@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2failure@ios_base@std@@8"
	.globl	"??_R2failure@ios_base@std@@8"  # @"??_R2failure@ios_base@std@@8"
	.p2align	4
"??_R2failure@ios_base@std@@8":
	.long	"??_R1A@?0A@EA@failure@ios_base@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@system_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@_System_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@runtime_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@failure@ios_base@std@@8"
	.globl	"??_R1A@?0A@EA@failure@ios_base@std@@8" # @"??_R1A@?0A@EA@failure@ios_base@std@@8"
	.p2align	4
"??_R1A@?0A@EA@failure@ios_base@std@@8":
	.long	"??_R0?AVfailure@ios_base@std@@@8"@IMGREL
	.long	4                               # 0x4
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3failure@ios_base@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@system_error@std@@8"
	.globl	"??_R1A@?0A@EA@system_error@std@@8" # @"??_R1A@?0A@EA@system_error@std@@8"
	.p2align	4
"??_R1A@?0A@EA@system_error@std@@8":
	.long	"??_R0?AVsystem_error@std@@@8"@IMGREL
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3system_error@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R3system_error@std@@8"
	.globl	"??_R3system_error@std@@8"      # @"??_R3system_error@std@@8"
	.p2align	3
"??_R3system_error@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	4                               # 0x4
	.long	"??_R2system_error@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2system_error@std@@8"
	.globl	"??_R2system_error@std@@8"      # @"??_R2system_error@std@@8"
	.p2align	4
"??_R2system_error@std@@8":
	.long	"??_R1A@?0A@EA@system_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@_System_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@runtime_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@_System_error@std@@8"
	.globl	"??_R1A@?0A@EA@_System_error@std@@8" # @"??_R1A@?0A@EA@_System_error@std@@8"
	.p2align	4
"??_R1A@?0A@EA@_System_error@std@@8":
	.long	"??_R0?AV_System_error@std@@@8"@IMGREL
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3_System_error@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R3_System_error@std@@8"
	.globl	"??_R3_System_error@std@@8"     # @"??_R3_System_error@std@@8"
	.p2align	3
"??_R3_System_error@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	3                               # 0x3
	.long	"??_R2_System_error@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2_System_error@std@@8"
	.globl	"??_R2_System_error@std@@8"     # @"??_R2_System_error@std@@8"
	.p2align	2
"??_R2_System_error@std@@8":
	.long	"??_R1A@?0A@EA@_System_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@runtime_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@runtime_error@std@@8"
	.globl	"??_R1A@?0A@EA@runtime_error@std@@8" # @"??_R1A@?0A@EA@runtime_error@std@@8"
	.p2align	4
"??_R1A@?0A@EA@runtime_error@std@@8":
	.long	"??_R0?AVruntime_error@std@@@8"@IMGREL
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3runtime_error@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R3runtime_error@std@@8"
	.globl	"??_R3runtime_error@std@@8"     # @"??_R3runtime_error@std@@8"
	.p2align	3
"??_R3runtime_error@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	"??_R2runtime_error@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2runtime_error@std@@8"
	.globl	"??_R2runtime_error@std@@8"     # @"??_R2runtime_error@std@@8"
	.p2align	2
"??_R2runtime_error@std@@8":
	.long	"??_R1A@?0A@EA@runtime_error@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",largest,"??_7system_error@std@@6B@"
	.p2align	4                               # @5
.L__unnamed_6:
	.quad	"??_R4system_error@std@@6B@"
	.quad	"??_Gsystem_error@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4system_error@std@@6B@"
	.globl	"??_R4system_error@std@@6B@"    # @"??_R4system_error@std@@6B@"
	.p2align	4
"??_R4system_error@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVsystem_error@std@@@8"@IMGREL
	.long	"??_R3system_error@std@@8"@IMGREL
	.long	"??_R4system_error@std@@6B@"@IMGREL

	.section	.rdata,"dr",largest,"??_7_System_error@std@@6B@"
	.p2align	4                               # @6
.L__unnamed_7:
	.quad	"??_R4_System_error@std@@6B@"
	.quad	"??_G_System_error@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4_System_error@std@@6B@"
	.globl	"??_R4_System_error@std@@6B@"   # @"??_R4_System_error@std@@6B@"
	.p2align	4
"??_R4_System_error@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AV_System_error@std@@@8"@IMGREL
	.long	"??_R3_System_error@std@@8"@IMGREL
	.long	"??_R4_System_error@std@@6B@"@IMGREL

	.section	.rdata,"dr",discard,"??_C@_02LMMGGCAJ@?3?5?$AA@"
	.globl	"??_C@_02LMMGGCAJ@?3?5?$AA@"    # @"??_C@_02LMMGGCAJ@?3?5?$AA@"
"??_C@_02LMMGGCAJ@?3?5?$AA@":
	.asciz	": "

	.section	.rdata,"dr",largest,"??_7runtime_error@std@@6B@"
	.p2align	4                               # @7
.L__unnamed_8:
	.quad	"??_R4runtime_error@std@@6B@"
	.quad	"??_Gruntime_error@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4runtime_error@std@@6B@"
	.globl	"??_R4runtime_error@std@@6B@"   # @"??_R4runtime_error@std@@6B@"
	.p2align	4
"??_R4runtime_error@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVruntime_error@std@@@8"@IMGREL
	.long	"??_R3runtime_error@std@@8"@IMGREL
	.long	"??_R4runtime_error@std@@6B@"@IMGREL

	.section	.bss,"bw",discard,"?_Psave@?$_Facetptr@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@2PEBVfacet@locale@2@EB"
	.globl	"?_Psave@?$_Facetptr@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@2PEBVfacet@locale@2@EB" # @"?_Psave@?$_Facetptr@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@2PEBVfacet@locale@2@EB"
	.p2align	3
"?_Psave@?$_Facetptr@V?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@std@@2PEBVfacet@locale@2@EB":
	.quad	0

	.section	.bss,"bw",discard,"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.globl	"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A" # @"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.p2align	3
"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A":
	.zero	8

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_0BA@ELKIONDK@bad?5locale?5name?$AA@"
	.globl	"??_C@_0BA@ELKIONDK@bad?5locale?5name?$AA@" # @"??_C@_0BA@ELKIONDK@bad?5locale?5name?$AA@"
"??_C@_0BA@ELKIONDK@bad?5locale?5name?$AA@":
	.asciz	"bad locale name"

	.section	.rdata,"dr",largest,"??_7?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"
	.p2align	4                               # @8
.L__unnamed_9:
	.quad	"??_R4?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"
	.quad	"??_G?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEAAPEAXI@Z"
	.quad	"?_Incref@facet@locale@std@@UEAAXXZ"
	.quad	"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DPEBX@Z"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DO@Z"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DN@Z"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_K@Z"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_J@Z"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DK@Z"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@DJ@Z"
	.quad	"?do_put@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@MEBA?AV?$ostreambuf_iterator@DU?$char_traits@D@std@@@2@V32@AEAVios_base@2@D_N@Z"

	.section	.rdata,"dr",discard,"??_R4?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"
	.globl	"??_R4?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@" # @"??_R4?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"
	.p2align	4
"??_R4?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@8"@IMGREL
	.long	"??_R3?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"@IMGREL
	.long	"??_R4?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"@IMGREL

	.section	.data,"dw",discard,"??_R0?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@8"
	.globl	"??_R0?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@8" # @"??_R0?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@8"
	.p2align	4
"??_R0?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@"
	.zero	6

	.section	.rdata,"dr",discard,"??_R3?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.globl	"??_R3?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8" # @"??_R3?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.p2align	3
"??_R3?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8":
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	4                               # 0x4
	.long	"??_R2?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.globl	"??_R2?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8" # @"??_R2?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.p2align	4
"??_R2?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8":
	.long	"??_R1A@?0A@EA@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@facet@locale@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@_Facet_base@std@@8"@IMGREL
	.long	"??_R17?0A@EA@_Crt_new_delete@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.globl	"??_R1A@?0A@EA@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8" # @"??_R1A@?0A@EA@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.p2align	4
"??_R1A@?0A@EA@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8":
	.long	"??_R0?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@8"@IMGREL
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@facet@locale@std@@8"
	.globl	"??_R1A@?0A@EA@facet@locale@std@@8" # @"??_R1A@?0A@EA@facet@locale@std@@8"
	.p2align	4
"??_R1A@?0A@EA@facet@locale@std@@8":
	.long	"??_R0?AVfacet@locale@std@@@8"@IMGREL
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3facet@locale@std@@8"@IMGREL

	.section	.data,"dw",discard,"??_R0?AVfacet@locale@std@@@8"
	.globl	"??_R0?AVfacet@locale@std@@@8"  # @"??_R0?AVfacet@locale@std@@@8"
	.p2align	4
"??_R0?AVfacet@locale@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVfacet@locale@std@@"
	.zero	1

	.section	.rdata,"dr",discard,"??_R3facet@locale@std@@8"
	.globl	"??_R3facet@locale@std@@8"      # @"??_R3facet@locale@std@@8"
	.p2align	3
"??_R3facet@locale@std@@8":
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	3                               # 0x3
	.long	"??_R2facet@locale@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2facet@locale@std@@8"
	.globl	"??_R2facet@locale@std@@8"      # @"??_R2facet@locale@std@@8"
	.p2align	2
"??_R2facet@locale@std@@8":
	.long	"??_R1A@?0A@EA@facet@locale@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@_Facet_base@std@@8"@IMGREL
	.long	"??_R17?0A@EA@_Crt_new_delete@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@_Facet_base@std@@8"
	.globl	"??_R1A@?0A@EA@_Facet_base@std@@8" # @"??_R1A@?0A@EA@_Facet_base@std@@8"
	.p2align	4
"??_R1A@?0A@EA@_Facet_base@std@@8":
	.long	"??_R0?AV_Facet_base@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3_Facet_base@std@@8"@IMGREL

	.section	.data,"dw",discard,"??_R0?AV_Facet_base@std@@@8"
	.globl	"??_R0?AV_Facet_base@std@@@8"   # @"??_R0?AV_Facet_base@std@@@8"
	.p2align	4
"??_R0?AV_Facet_base@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AV_Facet_base@std@@"
	.zero	2

	.section	.rdata,"dr",discard,"??_R3_Facet_base@std@@8"
	.globl	"??_R3_Facet_base@std@@8"       # @"??_R3_Facet_base@std@@8"
	.p2align	3
"??_R3_Facet_base@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	"??_R2_Facet_base@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2_Facet_base@std@@8"
	.globl	"??_R2_Facet_base@std@@8"       # @"??_R2_Facet_base@std@@8"
	.p2align	2
"??_R2_Facet_base@std@@8":
	.long	"??_R1A@?0A@EA@_Facet_base@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R17?0A@EA@_Crt_new_delete@std@@8"
	.globl	"??_R17?0A@EA@_Crt_new_delete@std@@8" # @"??_R17?0A@EA@_Crt_new_delete@std@@8"
	.p2align	4
"??_R17?0A@EA@_Crt_new_delete@std@@8":
	.long	"??_R0?AU_Crt_new_delete@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	8                               # 0x8
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3_Crt_new_delete@std@@8"@IMGREL

	.section	.data,"dw",discard,"??_R0?AU_Crt_new_delete@std@@@8"
	.globl	"??_R0?AU_Crt_new_delete@std@@@8" # @"??_R0?AU_Crt_new_delete@std@@@8"
	.p2align	4
"??_R0?AU_Crt_new_delete@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AU_Crt_new_delete@std@@"
	.zero	6

	.section	.rdata,"dr",discard,"??_R3_Crt_new_delete@std@@8"
	.globl	"??_R3_Crt_new_delete@std@@8"   # @"??_R3_Crt_new_delete@std@@8"
	.p2align	3
"??_R3_Crt_new_delete@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	"??_R2_Crt_new_delete@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2_Crt_new_delete@std@@8"
	.globl	"??_R2_Crt_new_delete@std@@8"   # @"??_R2_Crt_new_delete@std@@8"
	.p2align	2
"??_R2_Crt_new_delete@std@@8":
	.long	"??_R1A@?0A@EA@_Crt_new_delete@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@_Crt_new_delete@std@@8"
	.globl	"??_R1A@?0A@EA@_Crt_new_delete@std@@8" # @"??_R1A@?0A@EA@_Crt_new_delete@std@@8"
	.p2align	4
"??_R1A@?0A@EA@_Crt_new_delete@std@@8":
	.long	"??_R0?AU_Crt_new_delete@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3_Crt_new_delete@std@@8"@IMGREL

	.section	.rdata,"dr",largest,"??_7facet@locale@std@@6B@"
	.p2align	4                               # @9
.L__unnamed_10:
	.quad	"??_R4facet@locale@std@@6B@"
	.quad	"??_Gfacet@locale@std@@MEAAPEAXI@Z"
	.quad	"?_Incref@facet@locale@std@@UEAAXXZ"
	.quad	"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ"

	.section	.rdata,"dr",discard,"??_R4facet@locale@std@@6B@"
	.globl	"??_R4facet@locale@std@@6B@"    # @"??_R4facet@locale@std@@6B@"
	.p2align	4
"??_R4facet@locale@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVfacet@locale@std@@@8"@IMGREL
	.long	"??_R3facet@locale@std@@8"@IMGREL
	.long	"??_R4facet@locale@std@@6B@"@IMGREL

	.section	.rdata,"dr",largest,"??_7_Facet_base@std@@6B@"
	.p2align	4                               # @10
.L__unnamed_11:
	.quad	"??_R4_Facet_base@std@@6B@"
	.quad	"??_G_Facet_base@std@@UEAAPEAXI@Z"
	.quad	_purecall
	.quad	_purecall

	.section	.rdata,"dr",discard,"??_R4_Facet_base@std@@6B@"
	.globl	"??_R4_Facet_base@std@@6B@"     # @"??_R4_Facet_base@std@@6B@"
	.p2align	4
"??_R4_Facet_base@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AV_Facet_base@std@@@8"@IMGREL
	.long	"??_R3_Facet_base@std@@8"@IMGREL
	.long	"??_R4_Facet_base@std@@6B@"@IMGREL

	.section	.rdata,"dr",discard,"??_C@_02BBAHNLBA@?$CFp?$AA@"
	.globl	"??_C@_02BBAHNLBA@?$CFp?$AA@"   # @"??_C@_02BBAHNLBA@?$CFp?$AA@"
"??_C@_02BBAHNLBA@?$CFp?$AA@":
	.asciz	"%p"

	.section	.bss,"bw",discard,"?_Psave@?$_Facetptr@V?$ctype@D@std@@@std@@2PEBVfacet@locale@2@EB"
	.globl	"?_Psave@?$_Facetptr@V?$ctype@D@std@@@std@@2PEBVfacet@locale@2@EB" # @"?_Psave@?$_Facetptr@V?$ctype@D@std@@@std@@2PEBVfacet@locale@2@EB"
	.p2align	3
"?_Psave@?$_Facetptr@V?$ctype@D@std@@@std@@2PEBVfacet@locale@2@EB":
	.quad	0

	.section	.rdata,"dr",largest,"??_7?$ctype@D@std@@6B@"
	.p2align	4                               # @11
.L__unnamed_12:
	.quad	"??_R4?$ctype@D@std@@6B@"
	.quad	"??_G?$ctype@D@std@@MEAAPEAXI@Z"
	.quad	"?_Incref@facet@locale@std@@UEAAXXZ"
	.quad	"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ"
	.quad	"?do_tolower@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
	.quad	"?do_tolower@?$ctype@D@std@@MEBADD@Z"
	.quad	"?do_toupper@?$ctype@D@std@@MEBAPEBDPEADPEBD@Z"
	.quad	"?do_toupper@?$ctype@D@std@@MEBADD@Z"
	.quad	"?do_widen@?$ctype@D@std@@MEBAPEBDPEBD0PEAD@Z"
	.quad	"?do_widen@?$ctype@D@std@@MEBADD@Z"
	.quad	"?do_narrow@?$ctype@D@std@@MEBAPEBDPEBD0DPEAD@Z"
	.quad	"?do_narrow@?$ctype@D@std@@MEBADDD@Z"

	.section	.rdata,"dr",discard,"??_R4?$ctype@D@std@@6B@"
	.globl	"??_R4?$ctype@D@std@@6B@"       # @"??_R4?$ctype@D@std@@6B@"
	.p2align	4
"??_R4?$ctype@D@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AV?$ctype@D@std@@@8"@IMGREL
	.long	"??_R3?$ctype@D@std@@8"@IMGREL
	.long	"??_R4?$ctype@D@std@@6B@"@IMGREL

	.section	.data,"dw",discard,"??_R0?AV?$ctype@D@std@@@8"
	.globl	"??_R0?AV?$ctype@D@std@@@8"     # @"??_R0?AV?$ctype@D@std@@@8"
	.p2align	4
"??_R0?AV?$ctype@D@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AV?$ctype@D@std@@"
	.zero	4

	.section	.rdata,"dr",discard,"??_R3?$ctype@D@std@@8"
	.globl	"??_R3?$ctype@D@std@@8"         # @"??_R3?$ctype@D@std@@8"
	.p2align	3
"??_R3?$ctype@D@std@@8":
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	5                               # 0x5
	.long	"??_R2?$ctype@D@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2?$ctype@D@std@@8"
	.globl	"??_R2?$ctype@D@std@@8"         # @"??_R2?$ctype@D@std@@8"
	.p2align	4
"??_R2?$ctype@D@std@@8":
	.long	"??_R1A@?0A@EA@?$ctype@D@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@ctype_base@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@facet@locale@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@_Facet_base@std@@8"@IMGREL
	.long	"??_R17?0A@EA@_Crt_new_delete@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@?$ctype@D@std@@8"
	.globl	"??_R1A@?0A@EA@?$ctype@D@std@@8" # @"??_R1A@?0A@EA@?$ctype@D@std@@8"
	.p2align	4
"??_R1A@?0A@EA@?$ctype@D@std@@8":
	.long	"??_R0?AV?$ctype@D@std@@@8"@IMGREL
	.long	4                               # 0x4
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3?$ctype@D@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@ctype_base@std@@8"
	.globl	"??_R1A@?0A@EA@ctype_base@std@@8" # @"??_R1A@?0A@EA@ctype_base@std@@8"
	.p2align	4
"??_R1A@?0A@EA@ctype_base@std@@8":
	.long	"??_R0?AUctype_base@std@@@8"@IMGREL
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3ctype_base@std@@8"@IMGREL

	.section	.data,"dw",discard,"??_R0?AUctype_base@std@@@8"
	.globl	"??_R0?AUctype_base@std@@@8"    # @"??_R0?AUctype_base@std@@@8"
	.p2align	4
"??_R0?AUctype_base@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AUctype_base@std@@"
	.zero	3

	.section	.rdata,"dr",discard,"??_R3ctype_base@std@@8"
	.globl	"??_R3ctype_base@std@@8"        # @"??_R3ctype_base@std@@8"
	.p2align	3
"??_R3ctype_base@std@@8":
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	4                               # 0x4
	.long	"??_R2ctype_base@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2ctype_base@std@@8"
	.globl	"??_R2ctype_base@std@@8"        # @"??_R2ctype_base@std@@8"
	.p2align	4
"??_R2ctype_base@std@@8":
	.long	"??_R1A@?0A@EA@ctype_base@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@facet@locale@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@_Facet_base@std@@8"@IMGREL
	.long	"??_R17?0A@EA@_Crt_new_delete@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",largest,"??_7ctype_base@std@@6B@"
	.p2align	4                               # @12
.L__unnamed_13:
	.quad	"??_R4ctype_base@std@@6B@"
	.quad	"??_Gctype_base@std@@UEAAPEAXI@Z"
	.quad	"?_Incref@facet@locale@std@@UEAAXXZ"
	.quad	"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ"

	.section	.rdata,"dr",discard,"??_R4ctype_base@std@@6B@"
	.globl	"??_R4ctype_base@std@@6B@"      # @"??_R4ctype_base@std@@6B@"
	.p2align	4
"??_R4ctype_base@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AUctype_base@std@@@8"@IMGREL
	.long	"??_R3ctype_base@std@@8"@IMGREL
	.long	"??_R4ctype_base@std@@6B@"@IMGREL

	.section	.bss,"bw",discard,"?_Psave@?$_Facetptr@V?$numpunct@D@std@@@std@@2PEBVfacet@locale@2@EB"
	.globl	"?_Psave@?$_Facetptr@V?$numpunct@D@std@@@std@@2PEBVfacet@locale@2@EB" # @"?_Psave@?$_Facetptr@V?$numpunct@D@std@@@std@@2PEBVfacet@locale@2@EB"
	.p2align	3
"?_Psave@?$_Facetptr@V?$numpunct@D@std@@@std@@2PEBVfacet@locale@2@EB":
	.quad	0

	.section	.bss,"bw",discard,"?id@?$numpunct@D@std@@2V0locale@2@A"
	.globl	"?id@?$numpunct@D@std@@2V0locale@2@A" # @"?id@?$numpunct@D@std@@2V0locale@2@A"
	.p2align	3
"?id@?$numpunct@D@std@@2V0locale@2@A":
	.zero	8

	.section	.rdata,"dr",largest,"??_7?$numpunct@D@std@@6B@"
	.p2align	4                               # @13
.L__unnamed_14:
	.quad	"??_R4?$numpunct@D@std@@6B@"
	.quad	"??_G?$numpunct@D@std@@MEAAPEAXI@Z"
	.quad	"?_Incref@facet@locale@std@@UEAAXXZ"
	.quad	"?_Decref@facet@locale@std@@UEAAPEAV_Facet_base@3@XZ"
	.quad	"?do_decimal_point@?$numpunct@D@std@@MEBADXZ"
	.quad	"?do_thousands_sep@?$numpunct@D@std@@MEBADXZ"
	.quad	"?do_grouping@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
	.quad	"?do_falsename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"
	.quad	"?do_truename@?$numpunct@D@std@@MEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"

	.section	.rdata,"dr",discard,"??_R4?$numpunct@D@std@@6B@"
	.globl	"??_R4?$numpunct@D@std@@6B@"    # @"??_R4?$numpunct@D@std@@6B@"
	.p2align	4
"??_R4?$numpunct@D@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AV?$numpunct@D@std@@@8"@IMGREL
	.long	"??_R3?$numpunct@D@std@@8"@IMGREL
	.long	"??_R4?$numpunct@D@std@@6B@"@IMGREL

	.section	.data,"dw",discard,"??_R0?AV?$numpunct@D@std@@@8"
	.globl	"??_R0?AV?$numpunct@D@std@@@8"  # @"??_R0?AV?$numpunct@D@std@@@8"
	.p2align	4
"??_R0?AV?$numpunct@D@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AV?$numpunct@D@std@@"
	.zero	1

	.section	.rdata,"dr",discard,"??_R3?$numpunct@D@std@@8"
	.globl	"??_R3?$numpunct@D@std@@8"      # @"??_R3?$numpunct@D@std@@8"
	.p2align	3
"??_R3?$numpunct@D@std@@8":
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	4                               # 0x4
	.long	"??_R2?$numpunct@D@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2?$numpunct@D@std@@8"
	.globl	"??_R2?$numpunct@D@std@@8"      # @"??_R2?$numpunct@D@std@@8"
	.p2align	4
"??_R2?$numpunct@D@std@@8":
	.long	"??_R1A@?0A@EA@?$numpunct@D@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@facet@locale@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@_Facet_base@std@@8"@IMGREL
	.long	"??_R17?0A@EA@_Crt_new_delete@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@?$numpunct@D@std@@8"
	.globl	"??_R1A@?0A@EA@?$numpunct@D@std@@8" # @"??_R1A@?0A@EA@?$numpunct@D@std@@8"
	.p2align	4
"??_R1A@?0A@EA@?$numpunct@D@std@@8":
	.long	"??_R0?AV?$numpunct@D@std@@@8"@IMGREL
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3?$numpunct@D@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_C@_05LAPONLG@false?$AA@"
	.globl	"??_C@_05LAPONLG@false?$AA@"    # @"??_C@_05LAPONLG@false?$AA@"
"??_C@_05LAPONLG@false?$AA@":
	.asciz	"false"

	.section	.rdata,"dr",discard,"??_C@_04LOAJBDKD@true?$AA@"
	.globl	"??_C@_04LOAJBDKD@true?$AA@"    # @"??_C@_04LOAJBDKD@true?$AA@"
"??_C@_04LOAJBDKD@true?$AA@":
	.asciz	"true"

	.section	.rdata,"dr",discard,"??_C@_0BI@CFPLBAOH@invalid?5string?5position?$AA@"
	.globl	"??_C@_0BI@CFPLBAOH@invalid?5string?5position?$AA@" # @"??_C@_0BI@CFPLBAOH@invalid?5string?5position?$AA@"
"??_C@_0BI@CFPLBAOH@invalid?5string?5position?$AA@":
	.asciz	"invalid string position"

	.section	.bss,"bw",discard,"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"
	.globl	"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" # @"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"
	.p2align	3
"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA":
	.quad	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_02MDKMJEGG@eE?$AA@"
	.globl	"??_C@_02MDKMJEGG@eE?$AA@"      # @"??_C@_02MDKMJEGG@eE?$AA@"
"??_C@_02MDKMJEGG@eE?$AA@":
	.asciz	"eE"

	.section	.rdata,"dr",discard,"??_C@_02OOPEBDOJ@pP?$AA@"
	.globl	"??_C@_02OOPEBDOJ@pP?$AA@"      # @"??_C@_02OOPEBDOJ@pP?$AA@"
"??_C@_02OOPEBDOJ@pP?$AA@":
	.asciz	"pP"

	.section	.data,"dw",discard,"??_R0?AVbad_cast@std@@@8"
	.globl	"??_R0?AVbad_cast@std@@@8"      # @"??_R0?AVbad_cast@std@@@8"
	.p2align	4
"??_R0?AVbad_cast@std@@@8":
	.quad	"??_7type_info@@6B@"
	.quad	0
	.asciz	".?AVbad_cast@std@@"
	.zero	5

	.section	.xdata,"dr",discard,"_CT??_R0?AVbad_cast@std@@@8??0bad_cast@std@@QEAA@AEBV01@@Z24"
	.globl	"_CT??_R0?AVbad_cast@std@@@8??0bad_cast@std@@QEAA@AEBV01@@Z24" # @"_CT??_R0?AVbad_cast@std@@@8??0bad_cast@std@@QEAA@AEBV01@@Z24"
	.p2align	4
"_CT??_R0?AVbad_cast@std@@@8??0bad_cast@std@@QEAA@AEBV01@@Z24":
	.long	0                               # 0x0
	.long	"??_R0?AVbad_cast@std@@@8"@IMGREL
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	24                              # 0x18
	.long	"??0bad_cast@std@@QEAA@AEBV01@@Z"@IMGREL

	.section	.xdata,"dr",discard,"_CTA2?AVbad_cast@std@@"
	.globl	"_CTA2?AVbad_cast@std@@"        # @"_CTA2?AVbad_cast@std@@"
	.p2align	3
"_CTA2?AVbad_cast@std@@":
	.long	2                               # 0x2
	.long	"_CT??_R0?AVbad_cast@std@@@8??0bad_cast@std@@QEAA@AEBV01@@Z24"@IMGREL
	.long	"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24"@IMGREL

	.section	.xdata,"dr",discard,"_TI2?AVbad_cast@std@@"
	.globl	"_TI2?AVbad_cast@std@@"         # @"_TI2?AVbad_cast@std@@"
	.p2align	3
"_TI2?AVbad_cast@std@@":
	.long	0                               # 0x0
	.long	"??1exception@std@@UEAA@XZ"@IMGREL
	.long	0                               # 0x0
	.long	"_CTA2?AVbad_cast@std@@"@IMGREL

	.section	.rdata,"dr",discard,"??_C@_08EPJLHIJG@bad?5cast?$AA@"
	.globl	"??_C@_08EPJLHIJG@bad?5cast?$AA@" # @"??_C@_08EPJLHIJG@bad?5cast?$AA@"
"??_C@_08EPJLHIJG@bad?5cast?$AA@":
	.asciz	"bad cast"

	.section	.rdata,"dr",largest,"??_7bad_cast@std@@6B@"
	.p2align	4                               # @14
.L__unnamed_15:
	.quad	"??_R4bad_cast@std@@6B@"
	.quad	"??_Gbad_cast@std@@UEAAPEAXI@Z"
	.quad	"?what@exception@std@@UEBAPEBDXZ"

	.section	.rdata,"dr",discard,"??_R4bad_cast@std@@6B@"
	.globl	"??_R4bad_cast@std@@6B@"        # @"??_R4bad_cast@std@@6B@"
	.p2align	4
"??_R4bad_cast@std@@6B@":
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	"??_R0?AVbad_cast@std@@@8"@IMGREL
	.long	"??_R3bad_cast@std@@8"@IMGREL
	.long	"??_R4bad_cast@std@@6B@"@IMGREL

	.section	.rdata,"dr",discard,"??_R3bad_cast@std@@8"
	.globl	"??_R3bad_cast@std@@8"          # @"??_R3bad_cast@std@@8"
	.p2align	3
"??_R3bad_cast@std@@8":
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	"??_R2bad_cast@std@@8"@IMGREL

	.section	.rdata,"dr",discard,"??_R2bad_cast@std@@8"
	.globl	"??_R2bad_cast@std@@8"          # @"??_R2bad_cast@std@@8"
	.p2align	2
"??_R2bad_cast@std@@8":
	.long	"??_R1A@?0A@EA@bad_cast@std@@8"@IMGREL
	.long	"??_R1A@?0A@EA@exception@std@@8"@IMGREL
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_R1A@?0A@EA@bad_cast@std@@8"
	.globl	"??_R1A@?0A@EA@bad_cast@std@@8" # @"??_R1A@?0A@EA@bad_cast@std@@8"
	.p2align	4
"??_R1A@?0A@EA@bad_cast@std@@8":
	.long	"??_R0?AVbad_cast@std@@@8"@IMGREL
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	4294967295                      # 0xffffffff
	.long	0                               # 0x0
	.long	64                              # 0x40
	.long	"??_R3bad_cast@std@@8"@IMGREL

	.section	.CRT$XCU,"dr",associative,"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.p2align	3
	.quad	"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
	.section	.CRT$XCU,"dr",associative,"?id@?$numpunct@D@std@@2V0locale@2@A"
	.p2align	3
	.quad	"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
	.section	.CRT$XCU,"dr"
	.p2align	3
	.quad	_GLOBAL__sub_I_mandelbrot.cpp
	.section	.drectve,"yn"
	.ascii	" /FAILIFMISMATCH:\"_MSC_VER=1900\""
	.ascii	" /FAILIFMISMATCH:\"_ITERATOR_DEBUG_LEVEL=0\""
	.ascii	" /FAILIFMISMATCH:\"RuntimeLibrary=MT_StaticRelease\""
	.ascii	" /DEFAULTLIB:libcpmt.lib"
	.ascii	" /FAILIFMISMATCH:\"_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\""
	.ascii	" /FAILIFMISMATCH:\"annotate_string=0\""
	.ascii	" /FAILIFMISMATCH:\"annotate_vector=0\""
	.ascii	" /INCLUDE:\"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A\""
	.ascii	" /INCLUDE:\"?id@?$numpunct@D@std@@2V0locale@2@A\""
	.globl	"??_7bad_array_new_length@std@@6B@"
.set "??_7bad_array_new_length@std@@6B@", .L__unnamed_1+8
	.globl	"??_7bad_alloc@std@@6B@"
.set "??_7bad_alloc@std@@6B@", .L__unnamed_2+8
	.globl	"??_7exception@std@@6B@"
.set "??_7exception@std@@6B@", .L__unnamed_3+8
	.globl	"??_7_Iostream_error_category2@std@@6B@"
.set "??_7_Iostream_error_category2@std@@6B@", .L__unnamed_4+8
	.globl	"??_7failure@ios_base@std@@6B@"
.set "??_7failure@ios_base@std@@6B@", .L__unnamed_5+8
	.globl	"??_7system_error@std@@6B@"
.set "??_7system_error@std@@6B@", .L__unnamed_6+8
	.globl	"??_7_System_error@std@@6B@"
.set "??_7_System_error@std@@6B@", .L__unnamed_7+8
	.globl	"??_7runtime_error@std@@6B@"
.set "??_7runtime_error@std@@6B@", .L__unnamed_8+8
	.globl	"??_7?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"
.set "??_7?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@", .L__unnamed_9+8
	.globl	"??_7facet@locale@std@@6B@"
.set "??_7facet@locale@std@@6B@", .L__unnamed_10+8
	.globl	"??_7_Facet_base@std@@6B@"
.set "??_7_Facet_base@std@@6B@", .L__unnamed_11+8
	.globl	"??_7?$ctype@D@std@@6B@"
.set "??_7?$ctype@D@std@@6B@", .L__unnamed_12+8
	.globl	"??_7ctype_base@std@@6B@"
.set "??_7ctype_base@std@@6B@", .L__unnamed_13+8
	.globl	"??_7?$numpunct@D@std@@6B@"
.set "??_7?$numpunct@D@std@@6B@", .L__unnamed_14+8
	.globl	"??_7bad_cast@std@@6B@"
.set "??_7bad_cast@std@@6B@", .L__unnamed_15+8
	.addrsig
	.addrsig_sym __CxxFrameHandler3
	.addrsig_sym "??__F_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@YAXXZ"
	.addrsig_sym "??$_Invoke@V?$tuple@V?$ComplexPlaneCalculator@NV?$MandelbrotFunction@N@@@@@std@@$0A@@thread@std@@CAIPEAX@Z"
	.addrsig_sym "??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
	.addrsig_sym "??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
	.addrsig_sym _GLOBAL__sub_I_mandelbrot.cpp
	.addrsig_sym numberOfCpuCores
	.addrsig_sym "?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A"
	.addrsig_sym "??_7type_info@@6B@"
	.addrsig_sym "??_R0?AVbad_array_new_length@std@@@8"
	.addrsig_sym __ImageBase
	.addrsig_sym "??_R0?AVbad_alloc@std@@@8"
	.addrsig_sym "??_R0?AVexception@std@@@8"
	.addrsig_sym "??_R4bad_array_new_length@std@@6B@"
	.addrsig_sym "??_R3bad_array_new_length@std@@8"
	.addrsig_sym "??_R2bad_array_new_length@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@bad_array_new_length@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@bad_alloc@std@@8"
	.addrsig_sym "??_R3bad_alloc@std@@8"
	.addrsig_sym "??_R2bad_alloc@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@exception@std@@8"
	.addrsig_sym "??_R3exception@std@@8"
	.addrsig_sym "??_R2exception@std@@8"
	.addrsig_sym "??_R4bad_alloc@std@@6B@"
	.addrsig_sym "??_R4exception@std@@6B@"
	.addrsig_sym "??_R0?AVfailure@ios_base@std@@@8"
	.addrsig_sym "??_R0?AVsystem_error@std@@@8"
	.addrsig_sym "??_R0?AV_System_error@std@@@8"
	.addrsig_sym "??_R0?AVruntime_error@std@@@8"
	.addrsig_sym "?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@A"
	.addrsig_sym "?$TSS0@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@0@XZ@4HA"
	.addrsig_sym "??_R4_Iostream_error_category2@std@@6B@"
	.addrsig_sym "??_R0?AV_Iostream_error_category2@std@@@8"
	.addrsig_sym "??_R3_Iostream_error_category2@std@@8"
	.addrsig_sym "??_R2_Iostream_error_category2@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@_Iostream_error_category2@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@error_category@std@@8"
	.addrsig_sym "??_R0?AVerror_category@std@@@8"
	.addrsig_sym "??_R3error_category@std@@8"
	.addrsig_sym "??_R2error_category@std@@8"
	.addrsig_sym "??_R4failure@ios_base@std@@6B@"
	.addrsig_sym "??_R3failure@ios_base@std@@8"
	.addrsig_sym "??_R2failure@ios_base@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@failure@ios_base@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@system_error@std@@8"
	.addrsig_sym "??_R3system_error@std@@8"
	.addrsig_sym "??_R2system_error@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@_System_error@std@@8"
	.addrsig_sym "??_R3_System_error@std@@8"
	.addrsig_sym "??_R2_System_error@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@runtime_error@std@@8"
	.addrsig_sym "??_R3runtime_error@std@@8"
	.addrsig_sym "??_R2runtime_error@std@@8"
	.addrsig_sym "??_R4system_error@std@@6B@"
	.addrsig_sym "??_R4_System_error@std@@6B@"
	.addrsig_sym "??_R4runtime_error@std@@6B@"
	.addrsig_sym "?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.addrsig_sym "??_R4?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@6B@"
	.addrsig_sym "??_R0?AV?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@@8"
	.addrsig_sym "??_R3?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.addrsig_sym "??_R2?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@facet@locale@std@@8"
	.addrsig_sym "??_R0?AVfacet@locale@std@@@8"
	.addrsig_sym "??_R3facet@locale@std@@8"
	.addrsig_sym "??_R2facet@locale@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@_Facet_base@std@@8"
	.addrsig_sym "??_R0?AV_Facet_base@std@@@8"
	.addrsig_sym "??_R3_Facet_base@std@@8"
	.addrsig_sym "??_R2_Facet_base@std@@8"
	.addrsig_sym "??_R17?0A@EA@_Crt_new_delete@std@@8"
	.addrsig_sym "??_R0?AU_Crt_new_delete@std@@@8"
	.addrsig_sym "??_R3_Crt_new_delete@std@@8"
	.addrsig_sym "??_R2_Crt_new_delete@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@_Crt_new_delete@std@@8"
	.addrsig_sym "??_R4facet@locale@std@@6B@"
	.addrsig_sym "??_R4_Facet_base@std@@6B@"
	.addrsig_sym "??_R4?$ctype@D@std@@6B@"
	.addrsig_sym "??_R0?AV?$ctype@D@std@@@8"
	.addrsig_sym "??_R3?$ctype@D@std@@8"
	.addrsig_sym "??_R2?$ctype@D@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@?$ctype@D@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@ctype_base@std@@8"
	.addrsig_sym "??_R0?AUctype_base@std@@@8"
	.addrsig_sym "??_R3ctype_base@std@@8"
	.addrsig_sym "??_R2ctype_base@std@@8"
	.addrsig_sym "??_R4ctype_base@std@@6B@"
	.addrsig_sym "?id@?$numpunct@D@std@@2V0locale@2@A"
	.addrsig_sym "??_R4?$numpunct@D@std@@6B@"
	.addrsig_sym "??_R0?AV?$numpunct@D@std@@@8"
	.addrsig_sym "??_R3?$numpunct@D@std@@8"
	.addrsig_sym "??_R2?$numpunct@D@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@?$numpunct@D@std@@8"
	.addrsig_sym "?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"
	.addrsig_sym "??_R0?AVbad_cast@std@@@8"
	.addrsig_sym "??_R4bad_cast@std@@6B@"
	.addrsig_sym "??_R3bad_cast@std@@8"
	.addrsig_sym "??_R2bad_cast@std@@8"
	.addrsig_sym "??_R1A@?0A@EA@bad_cast@std@@8"
	.globl	_fltused
