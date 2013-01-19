  (assign val (op make-compiled-procedure) (label entry1105) (reg env))
  (goto (label after-lambda1104))
entry1105
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc lis)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1132))
compiled-branch1131
  (assign continue (label after-call1130))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1132
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1130
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1107))
true-branch1108
  (assign val (const ()))
  (goto (reg continue))
false-branch1107
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const pair?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1129))
compiled-branch1128
  (assign continue (label after-call1127))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1129
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1127
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1110))
true-branch1111
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const map) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1120))
compiled-branch1119
  (assign continue (label after-call1118))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1120
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1118
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1123))
compiled-branch1122
  (assign continue (label after-call1121))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1123
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1121
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1114))
compiled-branch1113
  (assign continue (label after-call1112))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1114
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1112
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1117))
compiled-branch1116
  (assign continue (label after-call1115))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1117
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1115
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1126))
compiled-branch1125
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1126
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1124
false-branch1110
  (assign val (op lookup-variable-value) (const false) (reg env))
  (goto (reg continue))
after-if1109
after-if1106
after-lambda1104
  (perform (op define-variable!) (const map) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op lookup-variable-value) (const apply) (reg env))
  (perform (op define-variable!) (const apply-in-underlying-scheme) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry989) (reg env))
  (goto (label after-lambda988))
entry989
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const self-evaluating?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1103))
compiled-branch1102
  (assign continue (label after-call1101))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1103
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1101
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch991))
true-branch992
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (goto (reg continue))
false-branch991
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const variable?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1100))
compiled-branch1099
  (assign continue (label after-call1098))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1100
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1098
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch994))
true-branch995
  (assign proc (op lookup-variable-value) (const lookup-variable-value) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1097))
compiled-branch1096
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1097
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1095
false-branch994
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const quoted?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1094))
compiled-branch1093
  (assign continue (label after-call1092))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1094
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1092
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch997))
true-branch998
  (assign proc (op lookup-variable-value) (const text-of-quotation) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1091))
compiled-branch1090
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1091
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1089
false-branch997
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const assignment?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1088))
compiled-branch1087
  (assign continue (label after-call1086))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1088
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1086
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1000))
true-branch1001
  (assign proc (op lookup-variable-value) (const eval-assignment) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1085))
compiled-branch1084
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1085
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1083
false-branch1000
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const definition?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1082))
compiled-branch1081
  (assign continue (label after-call1080))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1082
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1080
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1003))
true-branch1004
  (assign proc (op lookup-variable-value) (const eval-definition) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1079))
compiled-branch1078
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1079
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1077
false-branch1003
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const if?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1076))
compiled-branch1075
  (assign continue (label after-call1074))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1076
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1074
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1006))
true-branch1007
  (assign proc (op lookup-variable-value) (const eval-if) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1073))
compiled-branch1072
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1073
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1071
false-branch1006
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const lambda?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1070))
compiled-branch1069
  (assign continue (label after-call1068))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1070
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1068
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1009))
true-branch1010
  (assign proc (op lookup-variable-value) (const make-procedure) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const lambda-body) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1064))
compiled-branch1063
  (assign continue (label after-call1062))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1064
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1062
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const lambda-parameters) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1061))
compiled-branch1060
  (assign continue (label after-call1059))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1061
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1059
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1067))
compiled-branch1066
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1067
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1065
false-branch1009
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const begin?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1058))
compiled-branch1057
  (assign continue (label after-call1056))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1058
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1056
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1012))
true-branch1013
  (assign proc (op lookup-variable-value) (const eval-sequence) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const begin-actions) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1052))
compiled-branch1051
  (assign continue (label after-call1050))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1052
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1050
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1055))
compiled-branch1054
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1055
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1053
false-branch1012
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const cond?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1049))
compiled-branch1048
  (assign continue (label after-call1047))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1049
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1047
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1015))
true-branch1016
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const cond->if) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1043))
compiled-branch1042
  (assign continue (label after-call1041))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1043
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1041
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1046))
compiled-branch1045
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1046
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1044
false-branch1015
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const application?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1040))
compiled-branch1039
  (assign continue (label after-call1038))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1040
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1038
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1018))
true-branch1019
  (assign proc (op lookup-variable-value) (const apply) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const list-of-values) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const operands) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1031))
compiled-branch1030
  (assign continue (label after-call1029))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1031
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1029
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1034))
compiled-branch1033
  (assign continue (label after-call1032))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1034
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1032
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const operator) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1025))
compiled-branch1024
  (assign continue (label after-call1023))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1025
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1023
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1028))
compiled-branch1027
  (assign continue (label after-call1026))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1028
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1026
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1037))
compiled-branch1036
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1037
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1035
false-branch1018
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unknown expression type -- EVAL))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1022))
compiled-branch1021
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1022
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1020
after-if1017
after-if1014
after-if1011
after-if1008
after-if1005
after-if1002
after-if999
after-if996
after-if993
after-if990
after-lambda988
  (perform (op define-variable!) (const eval) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry954) (reg env))
  (goto (label after-lambda953))
entry954
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (procedure arguments)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const primitive-procedure?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch987))
compiled-branch986
  (assign continue (label after-call985))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch987
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call985
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch956))
true-branch957
  (assign proc (op lookup-variable-value) (const apply-primitive-procedure) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch984))
compiled-branch983
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch984
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call982
false-branch956
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const compound-procedure?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch981))
compiled-branch980
  (assign continue (label after-call979))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch981
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call979
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch959))
true-branch960
  (assign proc (op lookup-variable-value) (const eval-sequence) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const extend-environment) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const procedure-environment) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch972))
compiled-branch971
  (assign continue (label after-call970))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch972
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call970
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-parameters) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch969))
compiled-branch968
  (assign continue (label after-call967))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch969
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call967
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch975))
compiled-branch974
  (assign continue (label after-call973))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch975
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call973
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-body) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch966))
compiled-branch965
  (assign continue (label after-call964))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch966
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call964
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch978))
compiled-branch977
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch978
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call976
false-branch959
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unknown procedure type -- APPLY))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch963))
compiled-branch962
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch963
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call961
after-if958
after-if955
after-lambda953
  (perform (op define-variable!) (const apply) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry931) (reg env))
  (goto (label after-lambda930))
entry931
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exps env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const no-operands?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch952))
compiled-branch951
  (assign continue (label after-call950))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch952
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call950
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch933))
true-branch934
  (assign val (const ()))
  (goto (reg continue))
false-branch933
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const list-of-values) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const rest-operands) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch943))
compiled-branch942
  (assign continue (label after-call941))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch943
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call941
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch946))
compiled-branch945
  (assign continue (label after-call944))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch946
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call944
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const first-operand) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch937))
compiled-branch936
  (assign continue (label after-call935))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch937
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call935
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch940))
compiled-branch939
  (assign continue (label after-call938))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch940
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call938
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch949))
compiled-branch948
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch949
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call947
after-if932
after-lambda930
  (perform (op define-variable!) (const list-of-values) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry905) (reg env))
  (goto (label after-lambda904))
entry905
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const true?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const if-predicate) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch923))
compiled-branch922
  (assign continue (label after-call921))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch923
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call921
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch926))
compiled-branch925
  (assign continue (label after-call924))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch926
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call924
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch929))
compiled-branch928
  (assign continue (label after-call927))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch929
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call927
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch907))
true-branch908
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const if-consequent) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch917))
compiled-branch916
  (assign continue (label after-call915))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch917
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call915
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch920))
compiled-branch919
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch920
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call918
false-branch907
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const if-alternative) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch911))
compiled-branch910
  (assign continue (label after-call909))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch911
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call909
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch914))
compiled-branch913
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch914
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call912
after-if906
after-lambda904
  (perform (op define-variable!) (const eval-if) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry879) (reg env))
  (goto (label after-lambda878))
entry879
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exps env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const last-exp?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch903))
compiled-branch902
  (assign continue (label after-call901))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch903
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call901
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch881))
true-branch882
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const first-exp) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch897))
compiled-branch896
  (assign continue (label after-call895))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch897
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call895
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch900))
compiled-branch899
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch900
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call898
false-branch881
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const first-exp) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch891))
compiled-branch890
  (assign continue (label after-call889))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch891
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call889
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch894))
compiled-branch893
  (assign continue (label after-call892))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch894
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call892
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const eval-sequence) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const rest-exps) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch885))
compiled-branch884
  (assign continue (label after-call883))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch885
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call883
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch888))
compiled-branch887
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch888
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call886
after-if880
after-lambda878
  (perform (op define-variable!) (const eval-sequence) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry865) (reg env))
  (goto (label after-lambda864))
entry865
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (assign proc (op lookup-variable-value) (const set-variable-value!) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const assignment-value) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch871))
compiled-branch870
  (assign continue (label after-call869))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch871
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call869
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch874))
compiled-branch873
  (assign continue (label after-call872))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch874
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call872
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const assignment-variable) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch868))
compiled-branch867
  (assign continue (label after-call866))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch868
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call866
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch877))
compiled-branch876
  (assign continue (label after-call875))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch877
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call875
  (restore continue)
  (assign val (const ok))
  (goto (reg continue))
after-lambda864
  (perform (op define-variable!) (const eval-assignment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry851) (reg env))
  (goto (label after-lambda850))
entry851
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (assign proc (op lookup-variable-value) (const define-variable!) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const definition-value) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch857))
compiled-branch856
  (assign continue (label after-call855))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch857
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call855
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch860))
compiled-branch859
  (assign continue (label after-call858))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch860
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call858
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const definition-variable) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch854))
compiled-branch853
  (assign continue (label after-call852))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch854
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call852
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch863))
compiled-branch862
  (assign continue (label after-call861))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch863
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call861
  (restore continue)
  (assign val (const ok))
  (goto (reg continue))
after-lambda850
  (perform (op define-variable!) (const eval-definition) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry837) (reg env))
  (goto (label after-lambda836))
entry837
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const number?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch849))
compiled-branch848
  (assign continue (label after-call847))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch849
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call847
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch839))
true-branch840
  (assign val (op lookup-variable-value) (const true) (reg env))
  (goto (reg continue))
false-branch839
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const string?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch846))
compiled-branch845
  (assign continue (label after-call844))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch846
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call844
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch842))
true-branch843
  (assign val (op lookup-variable-value) (const true) (reg env))
  (goto (reg continue))
false-branch842
  (assign val (op lookup-variable-value) (const false) (reg env))
  (goto (reg continue))
after-if841
after-if838
after-lambda836
  (perform (op define-variable!) (const self-evaluating?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry832) (reg env))
  (goto (label after-lambda831))
entry832
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const quote))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch835))
compiled-branch834
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch835
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call833
after-lambda831
  (perform (op define-variable!) (const quoted?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry827) (reg env))
  (goto (label after-lambda826))
entry827
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch830))
compiled-branch829
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch830
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call828
after-lambda826
  (perform (op define-variable!) (const text-of-quotation) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry813) (reg env))
  (goto (label after-lambda812))
entry813
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp tag)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const pair?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch825))
compiled-branch824
  (assign continue (label after-call823))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch825
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call823
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch815))
true-branch816
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch819))
compiled-branch818
  (assign continue (label after-call817))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch819
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call817
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch822))
compiled-branch821
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch822
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call820
false-branch815
  (assign val (op lookup-variable-value) (const false) (reg env))
  (goto (reg continue))
after-if814
after-lambda812
  (perform (op define-variable!) (const tagged-list?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry808) (reg env))
  (goto (label after-lambda807))
entry808
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const symbol?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch811))
compiled-branch810
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch811
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call809
after-lambda807
  (perform (op define-variable!) (const variable?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry803) (reg env))
  (goto (label after-lambda802))
entry803
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const set!))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch806))
compiled-branch805
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch806
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call804
after-lambda802
  (perform (op define-variable!) (const assignment?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry798) (reg env))
  (goto (label after-lambda797))
entry798
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch801))
compiled-branch800
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch801
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call799
after-lambda797
  (perform (op define-variable!) (const assignment-variable) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry793) (reg env))
  (goto (label after-lambda792))
entry793
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch796))
compiled-branch795
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch796
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call794
after-lambda792
  (perform (op define-variable!) (const assignment-value) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry788) (reg env))
  (goto (label after-lambda787))
entry788
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const define))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch791))
compiled-branch790
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch791
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call789
after-lambda787
  (perform (op define-variable!) (const definition?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry771) (reg env))
  (goto (label after-lambda770))
entry771
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const symbol?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch783))
compiled-branch782
  (assign continue (label after-call781))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch783
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call781
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch786))
compiled-branch785
  (assign continue (label after-call784))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch786
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call784
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch773))
true-branch774
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch780))
compiled-branch779
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch780
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call778
false-branch773
  (assign proc (op lookup-variable-value) (const caadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch777))
compiled-branch776
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch777
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call775
after-if772
after-lambda770
  (perform (op define-variable!) (const definition-variable) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry748) (reg env))
  (goto (label after-lambda747))
entry748
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const symbol?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch766))
compiled-branch765
  (assign continue (label after-call764))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch766
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call764
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch769))
compiled-branch768
  (assign continue (label after-call767))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch769
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call767
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch750))
true-branch751
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch763))
compiled-branch762
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch763
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call761
false-branch750
  (assign proc (op lookup-variable-value) (const make-lambda) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch757))
compiled-branch756
  (assign continue (label after-call755))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch757
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call755
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch754))
compiled-branch753
  (assign continue (label after-call752))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch754
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call752
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch760))
compiled-branch759
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch760
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call758
after-if749
after-lambda747
  (perform (op define-variable!) (const definition-value) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry743) (reg env))
  (goto (label after-lambda742))
entry743
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const lambda))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch746))
compiled-branch745
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch746
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call744
after-lambda742
  (perform (op define-variable!) (const lambda?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry738) (reg env))
  (goto (label after-lambda737))
entry738
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch741))
compiled-branch740
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch741
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call739
after-lambda737
  (perform (op define-variable!) (const lambda-parameters) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry733) (reg env))
  (goto (label after-lambda732))
entry733
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch736))
compiled-branch735
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch736
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call734
after-lambda732
  (perform (op define-variable!) (const lambda-body) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry725) (reg env))
  (goto (label after-lambda724))
entry725
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (parameters body)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch728))
compiled-branch727
  (assign continue (label after-call726))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch728
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call726
  (assign argl (op list) (reg val))
  (assign val (const lambda))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch731))
compiled-branch730
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch731
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call729
after-lambda724
  (perform (op define-variable!) (const make-lambda) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry720) (reg env))
  (goto (label after-lambda719))
entry720
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const if))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch723))
compiled-branch722
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch723
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call721
after-lambda719
  (perform (op define-variable!) (const if?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry715) (reg env))
  (goto (label after-lambda714))
entry715
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch718))
compiled-branch717
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch718
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call716
after-lambda714
  (perform (op define-variable!) (const if-predicate) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry710) (reg env))
  (goto (label after-lambda709))
entry710
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch713))
compiled-branch712
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch713
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call711
after-lambda709
  (perform (op define-variable!) (const if-consequent) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry693) (reg env))
  (goto (label after-lambda692))
entry693
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const not) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cdddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch702))
compiled-branch701
  (assign continue (label after-call700))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch702
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call700
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch705))
compiled-branch704
  (assign continue (label after-call703))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch705
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call703
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch708))
compiled-branch707
  (assign continue (label after-call706))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch708
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call706
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch695))
true-branch696
  (assign proc (op lookup-variable-value) (const cadddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch699))
compiled-branch698
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch699
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call697
false-branch695
  (assign val (const false))
  (goto (reg continue))
after-if694
after-lambda692
  (perform (op define-variable!) (const if-alternative) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry688) (reg env))
  (goto (label after-lambda687))
entry688
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (predicate consequent alternative)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const if))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch691))
compiled-branch690
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch691
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call689
after-lambda687
  (perform (op define-variable!) (const make-if) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry683) (reg env))
  (goto (label after-lambda682))
entry683
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const begin))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch686))
compiled-branch685
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch686
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call684
after-lambda682
  (perform (op define-variable!) (const begin?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry678) (reg env))
  (goto (label after-lambda677))
entry678
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch681))
compiled-branch680
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch681
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call679
after-lambda677
  (perform (op define-variable!) (const begin-actions) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry670) (reg env))
  (goto (label after-lambda669))
entry670
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch673))
compiled-branch672
  (assign continue (label after-call671))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch673
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call671
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch676))
compiled-branch675
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch676
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call674
after-lambda669
  (perform (op define-variable!) (const last-exp?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry665) (reg env))
  (goto (label after-lambda664))
entry665
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch668))
compiled-branch667
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch668
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call666
after-lambda664
  (perform (op define-variable!) (const first-exp) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry660) (reg env))
  (goto (label after-lambda659))
entry660
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch663))
compiled-branch662
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch663
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call661
after-lambda659
  (perform (op define-variable!) (const rest-exps) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry640) (reg env))
  (goto (label after-lambda639))
entry640
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch658))
compiled-branch657
  (assign continue (label after-call656))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch658
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call656
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch642))
true-branch643
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (goto (reg continue))
false-branch642
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const last-exp?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch655))
compiled-branch654
  (assign continue (label after-call653))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch655
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call653
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch645))
true-branch646
  (assign proc (op lookup-variable-value) (const first-exp) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch652))
compiled-branch651
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch652
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call650
false-branch645
  (assign proc (op lookup-variable-value) (const make-begin) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch649))
compiled-branch648
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch649
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call647
after-if644
after-if641
after-lambda639
  (perform (op define-variable!) (const sequence->exp) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry635) (reg env))
  (goto (label after-lambda634))
entry635
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const begin))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch638))
compiled-branch637
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch638
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call636
after-lambda634
  (perform (op define-variable!) (const make-begin) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry630) (reg env))
  (goto (label after-lambda629))
entry630
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const pair?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch633))
compiled-branch632
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch633
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call631
after-lambda629
  (perform (op define-variable!) (const application?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry625) (reg env))
  (goto (label after-lambda624))
entry625
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch628))
compiled-branch627
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch628
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call626
after-lambda624
  (perform (op define-variable!) (const operator) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry620) (reg env))
  (goto (label after-lambda619))
entry620
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch623))
compiled-branch622
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch623
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call621
after-lambda619
  (perform (op define-variable!) (const operands) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry615) (reg env))
  (goto (label after-lambda614))
entry615
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (ops)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch618))
compiled-branch617
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch618
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call616
after-lambda614
  (perform (op define-variable!) (const no-operands?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry610) (reg env))
  (goto (label after-lambda609))
entry610
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (ops)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch613))
compiled-branch612
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch613
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call611
after-lambda609
  (perform (op define-variable!) (const first-operand) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry605) (reg env))
  (goto (label after-lambda604))
entry605
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (ops)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch608))
compiled-branch607
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch608
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call606
after-lambda604
  (perform (op define-variable!) (const rest-operands) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry600) (reg env))
  (goto (label after-lambda599))
entry600
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const cond))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch603))
compiled-branch602
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch603
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call601
after-lambda599
  (perform (op define-variable!) (const cond?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry595) (reg env))
  (goto (label after-lambda594))
entry595
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch598))
compiled-branch597
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch598
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call596
after-lambda594
  (perform (op define-variable!) (const cond-clauses) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry587) (reg env))
  (goto (label after-lambda586))
entry587
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clause)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save continue)
  (save proc)
  (assign val (const else))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const cond-predicate) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch590))
compiled-branch589
  (assign continue (label after-call588))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch590
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call588
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch593))
compiled-branch592
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch593
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call591
after-lambda586
  (perform (op define-variable!) (const cond-else-clause?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry582) (reg env))
  (goto (label after-lambda581))
entry582
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clause)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch585))
compiled-branch584
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch585
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call583
after-lambda581
  (perform (op define-variable!) (const cond-predicate) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry577) (reg env))
  (goto (label after-lambda576))
entry577
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clause)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch580))
compiled-branch579
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch580
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call578
after-lambda576
  (perform (op define-variable!) (const cond-actions) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry569) (reg env))
  (goto (label after-lambda568))
entry569
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const expand-clauses) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cond-clauses) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch572))
compiled-branch571
  (assign continue (label after-call570))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch572
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call570
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch575))
compiled-branch574
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch575
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call573
after-lambda568
  (perform (op define-variable!) (const cond->if) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry514) (reg env))
  (goto (label after-lambda513))
entry514
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clauses)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch567))
compiled-branch566
  (assign continue (label after-call565))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch567
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call565
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch516))
true-branch517
  (assign val (const false))
  (goto (reg continue))
false-branch516
  (assign proc (op make-compiled-procedure) (label entry525) (reg env))
  (goto (label after-lambda524))
entry525
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (first rest)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const cond-else-clause?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch561))
compiled-branch560
  (assign continue (label after-call559))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch561
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call559
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch527))
true-branch528
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch558))
compiled-branch557
  (assign continue (label after-call556))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch558
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call556
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch545))
true-branch546
  (assign proc (op lookup-variable-value) (const sequence->exp) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cond-actions) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch552))
compiled-branch551
  (assign continue (label after-call550))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch552
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call550
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch555))
compiled-branch554
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch555
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call553
false-branch545
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const ELSE clause isn't last -- COND->IF))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch549))
compiled-branch548
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch549
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call547
after-if544
false-branch527
  (assign proc (op lookup-variable-value) (const make-if) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const expand-clauses) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch540))
compiled-branch539
  (assign continue (label after-call538))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch540
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call538
  (assign argl (op list) (reg val))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const sequence->exp) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cond-actions) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch534))
compiled-branch533
  (assign continue (label after-call532))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch534
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call532
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch537))
compiled-branch536
  (assign continue (label after-call535))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch537
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call535
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cond-predicate) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch531))
compiled-branch530
  (assign continue (label after-call529))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch531
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call529
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch543))
compiled-branch542
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch543
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call541
after-if526
after-lambda524
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch523))
compiled-branch522
  (assign continue (label after-call521))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch523
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call521
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch520))
compiled-branch519
  (assign continue (label after-call518))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch520
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call518
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch564))
compiled-branch563
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch564
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call562
after-if515
after-lambda513
  (perform (op define-variable!) (const expand-clauses) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry506) (reg env))
  (goto (label after-lambda505))
entry506
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (x)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const not) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const false) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch509))
compiled-branch508
  (assign continue (label after-call507))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch509
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call507
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch512))
compiled-branch511
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch512
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call510
after-lambda505
  (perform (op define-variable!) (const true?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry501) (reg env))
  (goto (label after-lambda500))
entry501
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (x)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const false) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch504))
compiled-branch503
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch504
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call502
after-lambda500
  (perform (op define-variable!) (const false?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry496) (reg env))
  (goto (label after-lambda495))
entry496
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (parameters body env)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const procedure))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch499))
compiled-branch498
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch499
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call497
after-lambda495
  (perform (op define-variable!) (const make-procedure) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry491) (reg env))
  (goto (label after-lambda490))
entry491
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const procedure))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch494))
compiled-branch493
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch494
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call492
after-lambda490
  (perform (op define-variable!) (const compound-procedure?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry486) (reg env))
  (goto (label after-lambda485))
entry486
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch489))
compiled-branch488
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch489
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call487
after-lambda485
  (perform (op define-variable!) (const procedure-parameters) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry481) (reg env))
  (goto (label after-lambda480))
entry481
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch484))
compiled-branch483
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch484
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call482
after-lambda480
  (perform (op define-variable!) (const procedure-body) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry476) (reg env))
  (goto (label after-lambda475))
entry476
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadddr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch479))
compiled-branch478
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch479
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call477
after-lambda475
  (perform (op define-variable!) (const procedure-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry471) (reg env))
  (goto (label after-lambda470))
entry471
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch474))
compiled-branch473
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch474
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call472
after-lambda470
  (perform (op define-variable!) (const enclosing-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry466) (reg env))
  (goto (label after-lambda465))
entry466
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch469))
compiled-branch468
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch469
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call467
after-lambda465
  (perform (op define-variable!) (const first-frame) (reg val) (reg env))
  (assign val (const ok))
  (assign val (const ()))
  (perform (op define-variable!) (const the-empty-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry461) (reg env))
  (goto (label after-lambda460))
entry461
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (variables values)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch464))
compiled-branch463
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch464
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call462
after-lambda460
  (perform (op define-variable!) (const make-frame) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry456) (reg env))
  (goto (label after-lambda455))
entry456
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch459))
compiled-branch458
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch459
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call457
after-lambda455
  (perform (op define-variable!) (const frame-variables) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry451) (reg env))
  (goto (label after-lambda450))
entry451
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch454))
compiled-branch453
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch454
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call452
after-lambda450
  (perform (op define-variable!) (const frame-values) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry431) (reg env))
  (goto (label after-lambda430))
entry431
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var val frame)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const set-car!) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch443))
compiled-branch442
  (assign continue (label after-call441))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch443
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call441
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch446))
compiled-branch445
  (assign continue (label after-call444))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch446
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call444
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch449))
compiled-branch448
  (assign continue (label after-call447))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch449
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call447
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const set-cdr!) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch434))
compiled-branch433
  (assign continue (label after-call432))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch434
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call432
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch437))
compiled-branch436
  (assign continue (label after-call435))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch437
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call435
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch440))
compiled-branch439
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch440
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call438
after-lambda430
  (perform (op define-variable!) (const add-binding-to-frame!) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry393) (reg env))
  (goto (label after-lambda392))
entry393
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals base-env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const =) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch426))
compiled-branch425
  (assign continue (label after-call424))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch426
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call424
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch423))
compiled-branch422
  (assign continue (label after-call421))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch423
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call421
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch429))
compiled-branch428
  (assign continue (label after-call427))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch429
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call427
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch395))
true-branch396
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const make-frame) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch417))
compiled-branch416
  (assign continue (label after-call415))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch417
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call415
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch420))
compiled-branch419
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch420
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call418
false-branch395
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const <) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch411))
compiled-branch410
  (assign continue (label after-call409))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch411
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call409
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch408))
compiled-branch407
  (assign continue (label after-call406))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch408
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call406
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch414))
compiled-branch413
  (assign continue (label after-call412))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch414
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call412
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch398))
true-branch399
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const Too many arguments supplied))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch405))
compiled-branch404
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch405
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call403
false-branch398
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const Too few arguments supplied))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch402))
compiled-branch401
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch402
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call400
after-if397
after-if394
after-lambda392
  (perform (op define-variable!) (const extend-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry315) (reg env))
  (goto (label after-lambda314))
entry315
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var env)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry317) (reg env))
  (goto (label after-lambda316))
entry317
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env-loop)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry322) (reg env))
  (goto (label after-lambda321))
entry322
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry324) (reg env))
  (goto (label after-lambda323))
entry324
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (scan)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry352) (reg env))
  (goto (label after-lambda351))
entry352
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch385))
compiled-branch384
  (assign continue (label after-call383))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch385
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call383
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch354))
true-branch355
  (assign proc (op lexical-address-lookup) (const (3 . 0)) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const enclosing-environment) (reg env))
  (assign val (op lexical-address-lookup) (const (2 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch379))
compiled-branch378
  (assign continue (label after-call377))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch379
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call377
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch382))
compiled-branch381
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch382
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call380
false-branch354
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch373))
compiled-branch372
  (assign continue (label after-call371))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch373
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call371
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (4 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch376))
compiled-branch375
  (assign continue (label after-call374))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch376
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call374
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch357))
true-branch358
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch370))
compiled-branch369
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch370
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call368
false-branch357
  (assign proc (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch364))
compiled-branch363
  (assign continue (label after-call362))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch364
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call362
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch361))
compiled-branch360
  (assign continue (label after-call359))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch361
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call359
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch367))
compiled-branch366
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch367
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call365
after-if356
after-if353
after-lambda351
  (perform (op lexical-address-set!) (const (0 . 0)) (reg env) (reg val))
  (assign val (const ok))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const the-empty-environment) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch350))
compiled-branch349
  (assign continue (label after-call348))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch350
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call348
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch326))
true-branch327
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lexical-address-lookup) (const (3 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unbound variable))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch347))
compiled-branch346
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch347
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call345
false-branch326
  (assign proc (op make-compiled-procedure) (label entry332) (reg env))
  (goto (label after-lambda331))
entry332
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const frame-values) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch338))
compiled-branch337
  (assign continue (label after-call336))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch338
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call336
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const frame-variables) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch335))
compiled-branch334
  (assign continue (label after-call333))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch335
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call333
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch341))
compiled-branch340
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch341
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call339
after-lambda331
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const first-frame) (reg env))
  (assign val (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch330))
compiled-branch329
  (assign continue (label after-call328))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch330
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call328
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch344))
compiled-branch343
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch344
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call342
after-if325
after-lambda323
  (assign val (const *unassigned*))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch388))
compiled-branch387
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch388
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call386
after-lambda321
  (perform (op lexical-address-set!) (const (0 . 0)) (reg env) (reg val))
  (assign val (const ok))
  (assign proc (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign val (op lexical-address-lookup) (const (1 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch320))
compiled-branch319
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch320
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call318
after-lambda316
  (assign val (const *unassigned*))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch391))
compiled-branch390
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch391
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call389
after-lambda314
  (perform (op define-variable!) (const lookup-variable-value) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry237) (reg env))
  (goto (label after-lambda236))
entry237
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var val env)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry239) (reg env))
  (goto (label after-lambda238))
entry239
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env-loop)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry244) (reg env))
  (goto (label after-lambda243))
entry244
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry246) (reg env))
  (goto (label after-lambda245))
entry246
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (scan)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry274) (reg env))
  (goto (label after-lambda273))
entry274
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch307))
compiled-branch306
  (assign continue (label after-call305))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch307
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call305
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch276))
true-branch277
  (assign proc (op lexical-address-lookup) (const (3 . 0)) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const enclosing-environment) (reg env))
  (assign val (op lexical-address-lookup) (const (2 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch301))
compiled-branch300
  (assign continue (label after-call299))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch301
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call299
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch304))
compiled-branch303
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch304
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call302
false-branch276
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch295))
compiled-branch294
  (assign continue (label after-call293))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch295
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call293
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (4 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch298))
compiled-branch297
  (assign continue (label after-call296))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch298
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call296
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch279))
true-branch280
  (assign proc (op lookup-variable-value) (const set-car!) (reg env))
  (assign val (op lexical-address-lookup) (const (4 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch292))
compiled-branch291
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch292
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call290
false-branch279
  (assign proc (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch286))
compiled-branch285
  (assign continue (label after-call284))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch286
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call284
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch283))
compiled-branch282
  (assign continue (label after-call281))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch283
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call281
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch289))
compiled-branch288
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch289
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call287
after-if278
after-if275
after-lambda273
  (perform (op lexical-address-set!) (const (0 . 0)) (reg env) (reg val))
  (assign val (const ok))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const the-empty-environment) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch272))
compiled-branch271
  (assign continue (label after-call270))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch272
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call270
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch248))
true-branch249
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lexical-address-lookup) (const (3 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unbound variable -- SET!))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch269))
compiled-branch268
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch269
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call267
false-branch248
  (assign proc (op make-compiled-procedure) (label entry254) (reg env))
  (goto (label after-lambda253))
entry254
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const frame-values) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch260))
compiled-branch259
  (assign continue (label after-call258))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch260
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call258
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const frame-variables) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch257))
compiled-branch256
  (assign continue (label after-call255))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch257
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call255
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch263))
compiled-branch262
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch263
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call261
after-lambda253
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const first-frame) (reg env))
  (assign val (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch252))
compiled-branch251
  (assign continue (label after-call250))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch252
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call250
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch266))
compiled-branch265
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch266
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call264
after-if247
after-lambda245
  (assign val (const *unassigned*))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch310))
compiled-branch309
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch310
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call308
after-lambda243
  (perform (op lexical-address-set!) (const (0 . 0)) (reg env) (reg val))
  (assign val (const ok))
  (assign proc (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign val (op lexical-address-lookup) (const (1 . 2)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch242))
compiled-branch241
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch242
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call240
after-lambda238
  (assign val (const *unassigned*))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch313))
compiled-branch312
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch313
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call311
after-lambda236
  (perform (op define-variable!) (const set-variable-value!) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry181) (reg env))
  (goto (label after-lambda180))
entry181
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var val env)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry186) (reg env))
  (goto (label after-lambda185))
entry186
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry188) (reg env))
  (goto (label after-lambda187))
entry188
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (scan)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry199) (reg env))
  (goto (label after-lambda198))
entry199
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch229))
compiled-branch228
  (assign continue (label after-call227))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch229
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call227
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch201))
true-branch202
  (assign proc (op lookup-variable-value) (const add-binding-to-frame!) (reg env))
  (assign val (op lexical-address-lookup) (const (2 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (3 . 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lexical-address-lookup) (const (3 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch226))
compiled-branch225
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch226
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call224
false-branch201
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch220))
compiled-branch219
  (assign continue (label after-call218))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch220
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call218
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lexical-address-lookup) (const (3 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch223))
compiled-branch222
  (assign continue (label after-call221))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch223
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call221
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch204))
true-branch205
  (assign proc (op lookup-variable-value) (const set-car!) (reg env))
  (assign val (op lexical-address-lookup) (const (3 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch217))
compiled-branch216
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch217
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call215
false-branch204
  (assign proc (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch211))
compiled-branch210
  (assign continue (label after-call209))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch211
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call209
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch208))
compiled-branch207
  (assign continue (label after-call206))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch208
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call206
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch214))
compiled-branch213
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch214
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call212
after-if203
after-if200
after-lambda198
  (perform (op lexical-address-set!) (const (0 . 0)) (reg env) (reg val))
  (assign val (const ok))
  (assign proc (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const frame-values) (reg env))
  (assign val (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch194))
compiled-branch193
  (assign continue (label after-call192))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch194
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call192
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const frame-variables) (reg env))
  (assign val (op lexical-address-lookup) (const (1 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch191))
compiled-branch190
  (assign continue (label after-call189))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch191
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call189
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch197))
compiled-branch196
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch197
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call195
after-lambda187
  (assign val (const *unassigned*))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch232))
compiled-branch231
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch232
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call230
after-lambda185
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const first-frame) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 2)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch184))
compiled-branch183
  (assign continue (label after-call182))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch184
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call182
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch235))
compiled-branch234
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch235
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call233
after-lambda180
  (perform (op define-variable!) (const define-variable!) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry159) (reg env))
  (goto (label after-lambda158))
entry159
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry170) (reg env))
  (goto (label after-lambda169))
entry170
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (initial-env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const define-variable!) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const true) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const true))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch176))
compiled-branch175
  (assign continue (label after-call174))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch176
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call174
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const define-variable!) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const false) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const false))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch173))
compiled-branch172
  (assign continue (label after-call171))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch173
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call171
  (restore env)
  (restore continue)
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (goto (reg continue))
after-lambda169
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const extend-environment) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const the-empty-environment) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const primitive-procedure-objects) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch165))
compiled-branch164
  (assign continue (label after-call163))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch165
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call163
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const primitive-procedure-names) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch162))
compiled-branch161
  (assign continue (label after-call160))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch162
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call160
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch168))
compiled-branch167
  (assign continue (label after-call166))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch168
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call166
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch179))
compiled-branch178
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch179
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call177
after-lambda158
  (perform (op define-variable!) (const setup-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry154) (reg env))
  (goto (label after-lambda153))
entry154
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const primitive))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch157))
compiled-branch156
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch157
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call155
after-lambda153
  (perform (op define-variable!) (const primitive-procedure?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry149) (reg env))
  (goto (label after-lambda148))
entry149
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch152))
compiled-branch151
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch152
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call150
after-lambda148
  (perform (op define-variable!) (const primitive-implementation) (reg val) (reg env))
  (assign val (const ok))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const not) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const not))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch144))
compiled-branch143
  (assign continue (label after-call142))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch144
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call142
  (assign argl (op list) (reg val))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const error) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const error))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch141))
compiled-branch140
  (assign continue (label after-call139))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch141
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call139
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const list) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const list))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch138))
compiled-branch137
  (assign continue (label after-call136))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch138
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call136
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const display) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const display))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch135))
compiled-branch134
  (assign continue (label after-call133))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch135
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call133
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const =) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const =))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch132))
compiled-branch131
  (assign continue (label after-call130))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch132
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call130
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const >) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const >))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch129))
compiled-branch128
  (assign continue (label after-call127))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch129
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call127
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const <) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const <))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch126))
compiled-branch125
  (assign continue (label after-call124))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch126
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call124
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const /) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const /))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch123))
compiled-branch122
  (assign continue (label after-call121))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch123
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call121
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const *) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const *))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch120))
compiled-branch119
  (assign continue (label after-call118))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch120
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call118
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const -) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const -))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch117))
compiled-branch116
  (assign continue (label after-call115))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch117
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call115
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const +) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const +))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch114))
compiled-branch113
  (assign continue (label after-call112))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch114
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call112
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const null?) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const null?))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch111))
compiled-branch110
  (assign continue (label after-call109))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch111
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call109
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const cons) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const cons))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch108))
compiled-branch107
  (assign continue (label after-call106))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch108
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call106
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const cdr) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const cdr))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch105))
compiled-branch104
  (assign continue (label after-call103))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch105
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call103
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const car) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const car))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch102))
compiled-branch101
  (assign continue (label after-call100))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch102
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call100
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch147))
compiled-branch146
  (assign continue (label after-call145))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch147
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call145
  (restore env)
  (perform (op define-variable!) (const primitive-procedures) (reg val) (reg env))
  (assign val (const ok))
  (restore continue)
  (assign val (op make-compiled-procedure) (label entry96) (reg env))
  (goto (label after-lambda95))
entry96
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const map) (reg env))
  (assign val (op lookup-variable-value) (const primitive-procedures) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const car) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch99))
compiled-branch98
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch99
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call97
after-lambda95
  (perform (op define-variable!) (const primitive-procedure-names) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry91) (reg env))
  (goto (label after-lambda90))
entry91
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const map) (reg env))
  (assign val (op lookup-variable-value) (const primitive-procedures) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const cadr) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch94))
compiled-branch93
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch94
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call92
after-lambda90
  (perform (op define-variable!) (const primitive-procedure-objects) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry83) (reg env))
  (goto (label after-lambda82))
entry83
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc args)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const apply-in-underlying-scheme) (reg env))
  (save continue)
  (save proc)
  (assign val (op lexical-address-lookup) (const (0 . 1)) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const primitive-implementation) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch86))
compiled-branch85
  (assign continue (label after-call84))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch86
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call84
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch89))
compiled-branch88
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch89
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call87
after-lambda82
  (perform (op define-variable!) (const apply-primitive-procedure) (reg val) (reg env))
  (assign val (const ok))
  (assign val (const ;;; M-Eval input:))
  (perform (op define-variable!) (const input-prompt) (reg val) (reg env))
  (assign val (const ok))
  (assign val (const ;;; M-Eval value:))
  (perform (op define-variable!) (const output-prompt) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry53) (reg env))
  (goto (label after-lambda52))
entry53
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const prompt-for-input) (reg env))
  (assign val (op lookup-variable-value) (const input-prompt) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch81))
compiled-branch80
  (assign continue (label after-call79))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch81
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call79
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op make-compiled-procedure) (label entry61) (reg env))
  (goto (label after-lambda60))
entry61
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (input)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry66) (reg env))
  (goto (label after-lambda65))
entry66
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (output)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const announce-output) (reg env))
  (assign val (op lookup-variable-value) (const output-prompt) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch72))
compiled-branch71
  (assign continue (label after-call70))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch72
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call70
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const user-print) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch69))
compiled-branch68
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch69
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call67
after-lambda65
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (assign val (op lookup-variable-value) (const the-global-environment) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch64))
compiled-branch63
  (assign continue (label after-call62))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch64
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call62
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch75))
compiled-branch74
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch75
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call73
after-lambda60
  (save proc)
  (assign proc (op lookup-variable-value) (const read) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch59))
compiled-branch58
  (assign continue (label after-call57))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch59
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call57
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch78))
compiled-branch77
  (assign continue (label after-call76))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch78
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call76
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const driver-loop) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch56))
compiled-branch55
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch56
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call54
after-lambda52
  (perform (op define-variable!) (const driver-loop) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry39) (reg env))
  (goto (label after-lambda38))
entry39
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (string)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch51))
compiled-branch50
  (assign continue (label after-call49))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch51
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call49
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch48))
compiled-branch47
  (assign continue (label after-call46))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch48
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call46
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch45))
compiled-branch44
  (assign continue (label after-call43))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch45
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call43
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch42))
compiled-branch41
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch42
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call40
after-lambda38
  (perform (op define-variable!) (const prompt-for-input) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry28) (reg env))
  (goto (label after-lambda27))
entry28
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (string)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch37))
compiled-branch36
  (assign continue (label after-call35))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch37
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call35
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch34))
compiled-branch33
  (assign continue (label after-call32))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch34
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call32
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch31))
compiled-branch30
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch31
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call29
after-lambda27
  (perform (op define-variable!) (const announce-output) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry5) (reg env))
  (goto (label after-lambda4))
entry5
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (object)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const compound-procedure?) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch26))
compiled-branch25
  (assign continue (label after-call24))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch26
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call24
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch7))
true-branch8
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (save proc)
  (assign val (const <procedure-env>))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-body) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch17))
compiled-branch16
  (assign continue (label after-call15))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch17
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call15
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-parameters) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch14))
compiled-branch13
  (assign continue (label after-call12))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch14
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call12
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const compound-procedure))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch20))
compiled-branch19
  (assign continue (label after-call18))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch20
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call18
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch23))
compiled-branch22
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch23
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call21
false-branch7
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (assign val (op lexical-address-lookup) (const (0 . 0)) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch11))
compiled-branch10
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch11
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call9
after-if6
after-lambda4
  (perform (op define-variable!) (const user-print) (reg val) (reg env))
  (assign val (const ok))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const setup-environment) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch3))
compiled-branch2
  (assign continue (label after-call1))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch3
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1
  (restore env)
  (perform (op define-variable!) (const the-global-environment) (reg val) (reg env))
  (assign val (const ok))
  (restore continue)
  (goto (reg continue))
