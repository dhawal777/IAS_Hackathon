Ó
´
:
Add
x"T
y"T
z"T"
Ttype:
2	

ApplyGradientDescent
var"T

alpha"T

delta"T
out"T" 
Ttype:
2	"
use_lockingbool( 

ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
B
Equal
x"T
y"T
z
"
Ttype:
2	

^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
Ą
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype
.
Identity

input"T
output"T"	
Ttype
,
Log
x"T
y"T"
Ttype:

2
w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype
b
LookupTableImportV2
table_handle
keys"Tin
values"Tout"
Tintype"
Touttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
ď
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
5

Reciprocal
x"T
y"T"
Ttype:

2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
f
TopKV2

input"T
k
values"T
indices"
sortedbool("
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.13.12b'v1.13.1-0-g6612da8951'8őj
@

tf_examplePlaceholder*
dtype0*
_output_shapes
:
U
ParseExample/ConstConst*
_output_shapes
: *
valueB *
dtype0
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
h
&ParseExample/ParseExample/dense_keys_0Const*
value	B Bx*
dtype0*
_output_shapes
: 

ParseExample/ParseExampleParseExample
tf_exampleParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Nsparse *
sparse_types
 *
dense_shapes	
:*
Tdense
2*
Ndense
[
xIdentityParseExample/ParseExample*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
n
PlaceholderPlaceholder*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
shape:˙˙˙˙˙˙˙˙˙

f
zeros/shape_as_tensorConst*
valueB"  
   *
dtype0*
_output_shapes
:
P
zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
zerosFillzeros/shape_as_tensorzeros/Const*
T0*
_output_shapes
:	

Z
Variable
VariableV2*
_output_shapes
:	
*
shape:	
*
dtype0
q
Variable/AssignAssignVariablezeros*
_output_shapes
:	
*
T0*
_class
loc:@Variable
j
Variable/readIdentityVariable*
_output_shapes
:	
*
T0*
_class
loc:@Variable
T
zeros_1Const*
valueB
*    *
dtype0*
_output_shapes
:

R

Variable_1
VariableV2*
dtype0*
_output_shapes
:
*
shape:

t
Variable_1/AssignAssign
Variable_1zeros_1*
_class
loc:@Variable_1*
_output_shapes
:
*
T0
k
Variable_1/readIdentity
Variable_1*
T0*
_class
loc:@Variable_1*
_output_shapes
:

2
initNoOp^Variable/Assign^Variable_1/Assign
T
MatMulMatMulxVariable/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
U
addAddMatMulVariable_1/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
C
ySoftmaxadd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

?
LogLogy*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

N
mulMulPlaceholderLog*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

V
ConstConst*
valueB"       *
dtype0*
_output_shapes
:
7
SumSummulConst*
T0*
_output_shapes
: 
0
NegNegSum*
T0*
_output_shapes
: 
R
gradients/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
X
gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 
]
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*
_output_shapes
: 
N
gradients/Neg_grad/NegNeggradients/Fill*
_output_shapes
: *
T0
q
 gradients/Sum_grad/Reshape/shapeConst*
valueB"      *
dtype0*
_output_shapes
:

gradients/Sum_grad/ReshapeReshapegradients/Neg_grad/Neg gradients/Sum_grad/Reshape/shape*
_output_shapes

:*
T0
K
gradients/Sum_grad/ShapeShapemul*
T0*
_output_shapes
:

gradients/Sum_grad/TileTilegradients/Sum_grad/Reshapegradients/Sum_grad/Shape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
S
gradients/mul_grad/ShapeShapePlaceholder*
T0*
_output_shapes
:
M
gradients/mul_grad/Shape_1ShapeLog*
T0*
_output_shapes
:
Ť
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
m
gradients/mul_grad/MulMulgradients/Sum_grad/TileLog*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


gradients/mul_grad/SumSumgradients/mul_grad/Mul(gradients/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:

gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

w
gradients/mul_grad/Mul_1MulPlaceholdergradients/Sum_grad/Tile*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


gradients/mul_grad/Sum_1Sumgradients/mul_grad/Mul_1*gradients/mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0

gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

g
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1
Ú
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*-
_class#
!loc:@gradients/mul_grad/Reshape
ŕ
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_grad/Reshape_1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


gradients/Log_grad/Reciprocal
Reciprocaly.^gradients/mul_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


gradients/Log_grad/mulMul-gradients/mul_grad/tuple/control_dependency_1gradients/Log_grad/Reciprocal*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

h
gradients/y_grad/mulMulgradients/Log_grad/muly*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

q
&gradients/y_grad/Sum/reduction_indicesConst*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 

gradients/y_grad/SumSumgradients/y_grad/mul&gradients/y_grad/Sum/reduction_indices*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
	keep_dims(
{
gradients/y_grad/subSubgradients/Log_grad/mulgradients/y_grad/Sum*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
h
gradients/y_grad/mul_1Mulgradients/y_grad/suby*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

N
gradients/add_grad/ShapeShapeMatMul*
_output_shapes
:*
T0
d
gradients/add_grad/Shape_1Const*
valueB:
*
dtype0*
_output_shapes
:
Ť
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

gradients/add_grad/SumSumgradients/y_grad/mul_1(gradients/add_grad/BroadcastGradientArgs*
_output_shapes
:*
T0

gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


gradients/add_grad/Sum_1Sumgradients/y_grad/mul_1*gradients/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0

gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
_output_shapes
:

g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
Ú
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

Ó
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
_output_shapes
:
*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1
¨
gradients/MatMul_grad/MatMulMatMul+gradients/add_grad/tuple/control_dependencyVariable/read*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_b(

gradients/MatMul_grad/MatMul_1MatMulx+gradients/add_grad/tuple/control_dependency*
transpose_a(*
_output_shapes
:	
*
T0
n
&gradients/MatMul_grad/tuple/group_depsNoOp^gradients/MatMul_grad/MatMul^gradients/MatMul_grad/MatMul_1
ĺ
.gradients/MatMul_grad/tuple/control_dependencyIdentitygradients/MatMul_grad/MatMul'^gradients/MatMul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/MatMul_grad/MatMul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
â
0gradients/MatMul_grad/tuple/control_dependency_1Identitygradients/MatMul_grad/MatMul_1'^gradients/MatMul_grad/tuple/group_deps*
_output_shapes
:	
*
T0*1
_class'
%#loc:@gradients/MatMul_grad/MatMul_1
b
GradientDescent/learning_rateConst*
valueB
 *
×#<*
dtype0*
_output_shapes
: 
î
4GradientDescent/update_Variable/ApplyGradientDescentApplyGradientDescentVariableGradientDescent/learning_rate0gradients/MatMul_grad/tuple/control_dependency_1*
T0*
_class
loc:@Variable*
_output_shapes
:	

ě
6GradientDescent/update_Variable_1/ApplyGradientDescentApplyGradientDescent
Variable_1GradientDescent/learning_rate-gradients/add_grad/tuple/control_dependency_1*
T0*
_class
loc:@Variable_1*
_output_shapes
:


GradientDescentNoOp5^GradientDescent/update_Variable/ApplyGradientDescent7^GradientDescent/update_Variable_1/ApplyGradientDescent
J
TopKV2/kConst*
value	B :
*
dtype0*
_output_shapes
: 
b
TopKV2TopKV2yTopKV2/k*
T0*:
_output_shapes(
&:˙˙˙˙˙˙˙˙˙
:˙˙˙˙˙˙˙˙˙

l
Const_1Const*1
value(B&
B0B1B2B3B4B5B6B7B8B9*
dtype0*
_output_shapes
:

V
index_to_string/SizeConst*
value	B :
*
dtype0*
_output_shapes
: 
]
index_to_string/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
]
index_to_string/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 

index_to_string/rangeRangeindex_to_string/range/startindex_to_string/Sizeindex_to_string/range/delta*
_output_shapes
:

j
index_to_string/ToInt64Castindex_to_string/range*

SrcT0*

DstT0	*
_output_shapes
:

Y
index_to_string/ConstConst*
dtype0*
_output_shapes
: *
valueB	 BUNK
Z
index_to_stringHashTableV2*
	key_dtype0	*
value_dtype0*
_output_shapes
: 
{
index_to_string/table_initLookupTableImportV2index_to_stringindex_to_string/ToInt64Const_1*	
Tin0	*

Tout0
Z
ToInt64CastTopKV2:1*

DstT0	*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*

SrcT0

index_to_string_LookupLookupTableFindV2index_to_stringToInt64index_to_string/Const*

Tout0*	
Tin0	*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

R
ArgMax/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
S
ArgMaxArgMaxyArgMax/dimension*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
T
ArgMax_1/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
a
ArgMax_1ArgMaxPlaceholderArgMax_1/dimension*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
N
EqualEqualArgMaxArgMax_1*
T0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
P
CastCastEqual*

SrcT0
*

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Q
Const_2Const*
_output_shapes
:*
valueB: *
dtype0
<
MeanMeanCastConst_2*
T0*
_output_shapes
: 
4
init_all_tablesNoOp^index_to_string/table_init
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
shape: *
dtype0

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_9ef81760d13742c2a8bada231aa62516/part*
dtype0*
_output_shapes
: 
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 

save/SaveV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBVariableB
Variable_1
v
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueBB B *
dtype0*
_output_shapes
:

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariable
Variable_1"/device:CPU:0*
dtypes
2
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
 
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*
N*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 

save/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*)
value BBVariableB
Variable_1*
dtype0
y
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueBB B *
dtype0*
_output_shapes
:
¤
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
_output_shapes

::*
dtypes
2
v
save/AssignAssignVariablesave/RestoreV2*
T0*
_class
loc:@Variable*
_output_shapes
:	

y
save/Assign_1Assign
Variable_1save/RestoreV2:1*
_output_shapes
:
*
T0*
_class
loc:@Variable_1
8
save/restore_shardNoOp^save/Assign^save/Assign_1
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"
train_op

GradientDescent"*
saved_model_main_op

init_all_tables"
	variables~
9

Variable:0Variable/AssignVariable/read:02zeros:08
A
Variable_1:0Variable_1/AssignVariable_1/read:02	zeros_1:08"3
table_initializer

index_to_string/table_init"
trainable_variables~
9

Variable:0Variable/AssignVariable/read:02zeros:08
A
Variable_1:0Variable_1/AssignVariable_1/read:02	zeros_1:08*{
predict_imagesi
%
images
x:0˙˙˙˙˙˙˙˙˙$
scores
y:0˙˙˙˙˙˙˙˙˙
tensorflow/serving/predict*¸
serving_default¤

inputs
tf_example:0:
classes/
index_to_string_Lookup:0˙˙˙˙˙˙˙˙˙
)
scores
TopKV2:0˙˙˙˙˙˙˙˙˙
tensorflow/serving/classify