' search to pass to area layout max print
' more search documentation sector this 
' moviments 170 billions documents
Declare Function LibDocBillions (ByRef Doc As T1, ByRef LibDoc As T2, ByRef LayersDoc As T3)
Type Doc
   Dim DocTypes As T1
end type

Type LibDoc
   Dim LibDocEvent As T2
end type

Type LayersDoc
   Dim LayersDocObj As T3
end type

' NOTICE : Thank you to remove first single quote on the line below once you accepted the licence.
 /'   In case redistribution of SOURCES you may ensure to reactivate the acceptance of the license. This notice may be anywhere in source code till licensed user is aware it exists.
CONST PRODUCT_LIC =_
"_______________________________________________________________________________" & chr(10) &_
"  LZListsEngine/ListsVM by Etienne Carfagnini - contact:etienne.carfa@gmail.com" & chr(10) &_
"  PARIS France 01 46 49 99 02" & chr(10) &_
"-------------------------------------------------------------------------------"  & chr(10) &_
"  This Freeware/Openware licence specify the rights to use the software" & chr(10) &_
"* Distribution of derivating software : " & chr(10) & "  The information access to the original software must be guaranteed to" & chr(10) & "  developers and users (https://freebasic.net/forum/ or alternative mentionned)" & chr(10) &_
"* Right to use the software and its derivating : 2 options : " & chr(10) & " >OPTION 1 (Openware) :"  & chr(10) & "  The software is free for any use (under FreeBasic)." & chr(10) &_
"  'LZLE Openware licence' is mentionned in licence contributors." & chr(10) &_
"  The software must be compiled using any official GPL FreeBasic Compiler." & chr(10) & "  https://freebasic.net/forum/viewforum.php?f=1 Or" & chr(10) & "  https://users.freebasic-portal.de/stw/builds/) or " & chr(10) & " http://users.freebasic-portal.de/sarg/fbcgas64.zip)"&_
" >OPTION 2 (Freeware) (any language) :"  & chr(10) & "  The software is free for any use except the following limitation as to its"  & chr(10) & "  fields of application : not for use on virtual machine or on virtual server." & chr(10) &_
"  'LZLE Freeware licence' is mentionned in licence contributors." & chr(10) &_
"* Apart from the restrictions of use (options 1 and 2) which are not compatible"  & chr(10) & "  with the rights of uses specified in clause 5.1, the legal clauses whenever"  & chr(10) &_
"  compatible will be those specified by the CeCILL-C license"  & chr(10) & "  ( http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.txt )" & chr(10) &_
"  Disclaimer :"  & chr(10) & "  This licence refers to CeCILL-C but is NOT a CeCILL-C because the right to"  & chr(10) & "  use the software with no restriction is limited to the FreeBasic ecosystem." & chr(10) &_
"  This because it aims to be an extension of the language instructions set."  & chr(10) &_
"  LZLE (instruction set architecture,coding style) is dedicated to FreeBasic."  & chr(10) &_
"  This notice constitutes a whole that must be present in the source code." & chr(10) &_
"-------------------------------------------------------------------------------"  & chr(10) &_
"  Cette licence Freeware/Openware precise les droits a utiliser le logiciel" & chr(10) &_
"* Distribution de logiciels derives :" & chr(10) & "  L'acces informatif au logiciel original doit etre garanti aux" & chr(10) & "  developpeurs et aux utilisateurs (https://freebasic.net/forum/ ou autre)." & chr(10) &_
"* Droit d'utiliser le logiciel et ses derives : 2 options : " & chr(10) & " >OPTION 1 (Libre) :"  & chr(10) & "  Le logiciel est gratuit pour toute utilisation (sous FreeBasic)." & chr(10) &_
"  'LZLE licence Openware' est mentionne dans les contributions." & chr(10) &_
"  Le logiciel doit etre compile en utilisant n'importe quel compilateur GPL" & chr(10) & "  FreeBasic 'officiel' " & chr(10) & "  https://freebasic.net/forum/viewforum.php?f=1 ou bien" & chr(10) & "  http://users.freebasic-portal.de/stw/builds/ ou " & chr(10) & " http://users.freebasic-portal.de/sarg/fbcgas64.zip)" & chr(10) &_
" >OPTION 2 (Gratuiciel) (tout langage):"  & chr(10) & "  Le logiciel est gratuit pour tout usage sauf la limitation suivante quant a"  & chr(10) & "  son champs d'application : pas d'utilisation sur machine ou serveur virtuel." & chr(10) &_
"  'LZLE licence Freeware' est mentionne dans les contributions." & chr(10) &_
"* En dehors des restrictions d'utilisation (options 1 et 2) lesquelles ne sont "  & chr(10) & "  pas compatibles avec les droits d'utilisation prevus a la clause 5.1, les"  & chr(10) &_
"  clauses applicables seront celles compatibles specifiees par la licence"  & chr(10) & "  CeCILL-C ( http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.txt )" & chr(10) &_
"  Avertissement :"  & chr(10) & "  Cette licence fait reference a la licence CeCILL-C mais n'en est PAS une car"  & chr(10) & "  le droit a utiliser librement le logiciel est limite a l'ecosysteme FreeBasic" & chr(10) &_
"  Ce moteur de liste a jeu d'instructions est dedie au langage FreeBasic" & chr(10) &_
"  Cette notice constitue un tout lequel doit etre present dans le code source." & chr(10) &_
"_______________________________________________________________________________"
Dim k As String
Print PRODUCT_LIC : Print
Print "Please press 'Y' (Yes) to accept the licence or Esc to abort"
Print "Merci d'appuyer sur 'O' (Oui) pour accepter la licence ou echap pour annuler"
Do : k = Inkey : Select Case k : Case "Y" : Exit Do : Case "y" : Exit Do : Case "O" : Exit Do : Case "o" : Exit Do : Case Chr(27) : System : End Select : Loop
Print "Removing first single quote on line 2 in source code will activate the licence" : Print "Retirer la premiere simple quote en ligne 2 du code source activera la licence" : Print "Thank you for chosing this software - Merci d'avoir choisi ce logiciel" : Print
'/ ' END NOTICE

/' ?todo        :
   ' Tag1 is uByte instead string, reserved values : 0,1, 255 previous versions <0.995=> Tag1 0="", Tag1 1=" " , Tag1 255=LIST_DEL -  Meaning : 0=hashtag, not a key, 1=entry is a key, 255=hashtag or key that became a hashtag, key marked as transfered, hashtag to be deleted till no childs
   ' New to 0.996c : major bugs fixes & new features on Holback/Tracking now better supports when mixed with NodeFlat, dynamic otimization, support for easy syntax on indexed buffers - Holdback/Tracking faster and far better consistency
   ' New to 0.996c : NFrecursive : NFrecursive efficient on Tracking 
   ' New 0.996c : HoldBackRev for LIFO indexed buffers
   ' New to 0.996c : MAX_ASIDE is distinct, Inside(=Insert)
   'todo : ++ tests trackings avancés? tests CopyTrack
   'todo : FastTrackStep, FastFollow, Check Snatch & Snatch Below /
   'todo : documentation + détail  check TrackMultiKeys, Check, NFRecursive(2), Check Tag1=255 or-1
    CHECK LISTDATA % NodeFlat !!!  
   '/

'-------- PREPROC OPTIMIZATION OPTIONS --------
' # Define TagMode 0    zString Ptr    =>  Tags len (MIN_COLS to MAX_COLS) are Dynamic (zstring Ptr) from DEF_TAGLEN
' # Define TagMode 1    zString         =>  STATIC (consecutive) TAGS LEN (zstring*MAX_TAGLEN) means more speed (10%-30%)(1) and less memory load (20%-80%)(2) but implies :
'                                                               a) maximum len shall not be exceeded (except if it is desired feature) and b) all Tags len shall be as close as possible each others / c) efficient if 'MAX_TAGLEN' can be tuned to fit dataset structure
'                                                               (1) : No need to check len on each tag while setting      (2) : No need to store intermediate array pointer adress and len accessing datas
'' # Define TagMode 2   String           =>  Tags len (MIN_COLS to MAX_COLS) are Dynamic, managed by standard String Datatype

'--------------- SPEED, LOAD & FEATURES ---------------
' TagMode 0 and DEF_TAGLEN=0 VS TagMode 2 with Dim str_tag_C(MIN_COLS to MAX_COLS) As String : TagMode 0 is up to 20% slower, but requiring 20-60% less memory and is more robust at deallocation
' TagMode 0 with uB_RedimTagLen=0  and DEF_TAGLEN choosen VS TagMode 2 with Dim str_tag_C(MIN_COLS to MAX_COLS) As String : TagMode 0 requires 20-60% less memory, speed 15% faster BUT tags len truncated when exceed DEF_TAGLEN
' TagMode 0 with uB_RedimTagLen=1  and DEF_TAGLEN choosen VS TagMode 2 with Dim str_tag_C(MIN_COLS to MAX_COLS) As String : TagMode 0 requires 20-60% less memory, speed 15% faster BUT slowdown when tags len exceed DEF_TAGLEN
' => Using the string type on str_tag_C with TagMode 2 (ie versus TagMode 0)  may only be relevant  if the data you want to enter in Tags arrays  (MIN_COLS To MAX_COLS) are very large and variable in size.
' TagMode 0 VS TagMode 1 with Dim str_tag_C(MIN_COLS to MAX_COLS) As zString*MAX_TAGLEN : TagMode 0 is 10%-30% slower (depending on algo) and is requiring 20%-80% more memory (depending on dataset) BUT tags len are not truncated (or slow) when exceed MAX_TAGLEN
' TagMode 0 with uB_RedimTagLen=0  and DEF_TAGLEN choosen VS TagMode 1 with Dim str_tag_C(MIN_COLS to MAX_COLS) As zString*MAX_TAGLEN : TagMode 0 is 10%-30% slower and requiring 20%-80% more memory BUT Tags truncation can be customizable
' TagMode 0 with uB_RedimTagLen=1  and DEF_TAGLEN choosen VS TagMode 1 with Dim str_tag_C(MIN_COLS to MAX_COLS) As zString*MAX_TAGLEN : TagMode 0 is 10%-30% slower and requiring 20%-80% more memory BUT Tags len can oversize DEF_TAGLEN
' => Using the Zstring type on str_tag_C with TagMode 1 (ie versus TagMode 0)  may only be relevant if the max size of the data is known in advance and varies little
' Important : All given percentages are only as an indication (on tree), you may find out important variations depending on several conditions - 'use of Flat' lists may be slower.

'-------------------------- CONCLUSION  --------------------------
' => Use # Define TagMode 0 to handle "easily" all common datasets & most situations, eventually use DEF_TAGLEN to optimize speed. The most versatile with manual & automatic optimization options.
' => Use # Define TagMode 1 to gain significant speed & memory load (fine tuning) only efficient for fixed (or little variable size data) to store in Tags(MIN_COLS to MAX_COLS), shall not often oversize MAX_TAGLEN (otherwise serious slowdown & possible bugs or compatibility break)
' => Use # Define TagMode 2 to handle large & variable dataset to store in Tag(MIN_COLS to MAX_COLS) or maybe backward compatibility (big size), can sometimes speed faster than TagMode 0, may consumes much more memory, less good deallocation.


'----------------------- PREPROCESSOR -----------------------  ' * 'Standard' setting = # Define TagMode 0 & CONST DEF_TAGLEN=0   ' * 'Fast' setting = # Define TagMode 1 with MAX_TAGLEN as small as possible & no or few oversize
# Define TagMode 0
'------------------ END PREPROCESSOR -------------------  ' * 'BigBuffer' setting is # Define TagMode 2 efficient on flat lists/big strings
'SHARED 1/2
Dim Shared As uInteger AllocateDeallocateCounter=0
Function _Callocate(Byval n As Integer) As Any Ptr : AllocateDeallocateCounter += 1 : Return Callocate(n) : End Function
Sub _Deallocate(Byval p As Any Ptr) : AllocateDeallocateCounter -= 1 : Deallocate(p) : End Sub
Dim Shared As uInteger TrackCompCounter=0

'CONSTANTS
# IF TagMode=0
    CONST DEF_TAGLEN=0
# ELSEIF TagMode=1
    CONST MAX_TAGLEN=14 'must be>0, the max len to store to zstring tags
# ENDIF
CONST MIN_COLS=1 : CONST MAX_COLS=6 : CONST MAX_HASHLEN=1 : CONST DEF_KEYLEN=200 : CONST MAX_ASIDE=20
CONST LIST_RES=Chr(18) : CONST LIST_DEL=Chr(3)  : CONST LIST_ROOT=Chr(4) : CONST MAX_TRACKS=20 ' MAX_TRACKS = all tracks are on a same single track cros-tracking not managed

'DATA IMPLEMENTATION
Type ListContainer 'Data Segment Level   
    # IF TagMode=0
        Dim As zString Ptr str_tag_C(MIN_COLS to MAX_COLS)
        Dim As uByte TagC_Len(MIN_COLS to MAX_COLS)
    # ELSEIF TagMode=1
        Dim str_tag_C(MIN_COLS to MAX_COLS) As zString*(MAX_TAGLEN+1)
    # ELSE
        Dim str_tag_C(MIN_COLS to MAX_COLS) As String
    # ENDIF
    Dim As zString Ptr str_item, str_flat_tag
    Dim As uShort int_tag_len=0 : Dim As uInteger int_val_len=0
    Dim pNextContainer as ListContainer Ptr
End Type
Type ListNode 'ListNode Level
    Dim Tag0 As zString*(MAX_HASHLEN+1) : Dim Tag1 As uByte=0
    Dim  As ListNode Ptr pNext, pPrev, pBranch, pBranchLastNode
    Dim As ListContainer Ptr ListData : Dim As uInteger BranchCount=0
End Type

'TREE PARSING CONTEXT
Type ListContext 'Branch context Level
    Dim  As ListNode Ptr pNode, pFirstNode, pLastNode : Dim As String LcHashTag : Dim  As uInteger  uCount : Dim As uByte bLcHashLen, uBIsTracked=0
End Type

Type List
    Declare Constructor() : Declare Destructor()   
   
    Private:
    Dim As zString Ptr Listptemp=_Callocate(DEF_KEYLEN), Listptemp2=_Callocate(DEF_KEYLEN), zp3=_Callocate(1)
    Dim  As ListContext Lcontext(0 to MAX_ASIDE), Tracks(0 to MAX_TRACKS)
    Dim As ListNode Ptr pNode, pFirstNode, pLastNode, pFirstFIRSTNode, pLastLASTNode, pGarbage, pEndFlat, pLocalRoot, pLocalMove, pWhyteMove, pFlatRoot, pSearchNode, pValTmp, TrackTrace(0 to MAX_TRACKS), pLatestHTag,_
                                    pTrackTmp , pFirstNodeTMP, pLastNodeTMP, pTrackPrevTmp, pLastHoldBackRev(0 to MAX_TRACKS)
    Dim As ListContainer Ptr pPanCakeGarbage, pLastPanCake, pCurrentPanCakeTMP
    Dim As uInteger uNodeCOUNT, uGarbCt, uCount, uContainerGarbCt,  uContainerGivenCt, PVS_Count=0
    Dim As Byte uTag=0, bSearchRes=0, bRHByPass=0, bHashStepRev=0, bfStepZero=0, bTrackingMethod=0, bTracking=0, bHTMethod=1, bHashKeyUnique=1, uSortTag=-1,_
                        bSortMT=1, bNFmethod=1, bRHmethod=-1, bAutoCursor=1, bSeekMethod=2, bBranchCountDown=0, bPickReduce=0, bCopyCatMethod=0, bCopyCatRelation=0,_
                        bColBcountLocked=0, bColTrackLocked=0, bAlrdyTracked=0, bSnatchBLMethod=0, bHStepTrace=0, bTrackMultiKeys=1, bPVSmethod=-1, bnStepByPass=0, bRecur=0, bFullRecursive=0
    Dim As uByte    bHashLen=1, IsDestroyed=0, PVS_ratio=3, uB_CurLevel=1, uB_Level=1, uB_KeyStepCumul=1, uB_MaxLevel=1, uB_BottomLevel=255, uB_BottomByPass=0, uB_tmp, uB_IsTree=0,_
                            uB_ind, uB_RedimTagLen=1, uB_TagC_Len(MIN_COLS to MAX_COLS), ubTrackTarget=0, uBHoldBackRev=0
    Dim As String  sSearchTag, sLatestHTag, Str_tmp, str_arbo , Str_tmp2, str_testTMP, sMV_Tag
   
    Declare Property AllowCake() As ListNode Ptr                      ' Cooking here
    Declare Property AllowPanCake() As ListContainer Ptr          ' No comment
    Declare Property FlatTagSet(Str_Tag As String) As Byte
    Declare Property ValSet(Str_Tag As String) As Byte
    Declare Property TagC_Set(Str_Tag As String) As Byte
    # IF TagMode=1
    Declare Property TagC_Get As String
    # ENDIF
    Declare Property AllRecycle() As uInteger   
    Declare Property Branch() As Byte                                        ' Descend dans la liste enfants, creation de nouvelles entrées
    Declare Property UpLevel() As Byte                                      ' Revient à la liste parente   
    Declare Property NodeRecycle() as Byte                              ' Supression en décalé (NodeFlat)
    Declare Property NodeRecycle2() as Byte                            ' Supression en décalé (RestoreHash)
    Declare Property RootPrivate As Byte                                   ' Accès direct rapide à la racine
    Declare Property FlatStack(uB as uByte) As Byte                 ' Construction de la Flat List avec retour à la racine(0) ou accès à la flat liste (1)
    Declare Property BCountDown(i As Byte) As Byte                ' CountDown calculation   
    Declare Property ValPrivate(str_Value As String) As Byte
    Declare Property ValPrivate As String
    Declare Property AllOfPrivate As uInteger
    Declare Property TrackCompute As Byte
    Declare Property TrackSecure As Byte
    Declare Property HashStepTrace As Byte                              ' Required by Sort (for optimization)   
   
    Public:
    Declare Property TrackComputeTest As Byte
    'Special features - Private declared Public   
    Declare Property SetRelation(by as Byte) as Byte
    Declare Property SetRelation1(pRelNode As ListNode Ptr) As ListNode Ptr
    Declare Property SetRelation2(pRelFirstNode As ListNode Ptr) As ListNode Ptr
    Declare Property Relation As ListNode Ptr   
    Declare Property GiveBranchDown As ListNode Ptr
    Declare Property GiveBranch As ListNode Ptr
    Declare Property GiveFlat As ListNode Ptr
    Declare Property GiveGarbage As ListNode Ptr
    Declare Property GivePanCake As ListContainer Ptr
    Declare Property GiveLastPanCake As ListContainer Ptr
    Declare Property GivePanCakeCount As uInteger
    'Flat control
    Declare Property Tag(str_Tag As String) As Byte                 ' Create a new ListNode with Key=str_Tag OR retrieve position of an existing Tag
    Declare Property Tag As String                                            ' Return current Tag value in a list =Tag(0)
    Declare Property Tag(iTag As Integer) As String                  ' Return current Tag value of the specified entry in array
    Declare Property HasTagFlat(str_Tag As String) As Byte     ' HasTag alternative (slightly faster) for Flat lists
    Declare Property HasTag(str_Tag As String) As Byte           ' Return 1 if Tag exists
    Declare Property BlindTag(str_Tag As String) As Byte          ' Create a new ListNode with Key=str_Tag at end of the list
    Declare Property Insert(str_Tag As String) As Byte
    Declare Property RwTag(s_Tag As String) As Byte               ' Rewrite Tag Value of current Node : if current node is Hashed, just rewrite HashTag Value not effective Key value
    Declare Property RwTag0(s_Tag As String) As Byte                ' Rewrite Tag Value(0)
    Declare Property RwTag1(s_Tag As String) As Byte                ' Rewrite Tag Value(1) => eqivalent to MyList.ColTags(1) : MyList.RwTag("Label") : MyList.ColTags(0)
    Declare Property RwTag2(s_Tag As String) As Byte                ' Rewrite Tag Value(2)
    Declare Property RwTag3(s_Tag As String) As Byte                ' Rewrite Tag Value(3)
    Declare Property RwTag4(s_Tag As String) As Byte                ' Rewrite Tag Value(4)
    Declare Property ColTags As Byte                                       ' Renvoie le numéro de la colonne de tag active       
    Declare Property ColTags(i as Byte) As Byte                        ' Définie la colonne de tag active de 0 à MAX_COLS, par défaut 0   
    Declare Property AllOf As uInteger                                       ' Return number of node in  considered Flat List (root or branch), set position to the first node of current branch
    Declare Property Count As uInteger                                     ' Return current node Count of considered Flat List
    Declare Property First As Byte                                              'Set current node to first node considering flat list (root or branch)   
    Declare Property Last As Byte                                              'Set current node to Last node considering flat list (root or branch)       
    Declare Property Val(str_value As String) As Byte                ' Assign a string (+50 len) to the current node that is identified by a Tag
    Declare Property Val As String                                             ' Return current node string datas   
    Declare Property ValTag(str_value As String) As String        ' Considering current Flat list (root or branch as a flat list) return string data identified by Key=str_Tag
    Declare Property fStep As Byte                                            ' FOR EACH - While MyList.fStep : .. : Wend Jump to next node till current flat list end
    Declare Property fStepRev As Byte                                     ' FOR EACH - Idem fStep Jump to previous node till current flat list reach firstnode
    Declare Property bStep As Byte                                           ' FOR NEXT - For i=1 to MyList.AllOf : MyList.bStep : ..... : Next i    -> Jump to next node (NO CHECK)
    Declare Property BlindStep As Byte                                     ' FOR EACH - While MyList.BlindStep : .. : Wend -And- FOR NEXT - For i=1 to MyList.AllOf : MyList.BlindStep : ..... : Next i  Jump to next node  (check)   
    Declare Property BlindStep(i As Integer) As Byte                  ' Jump to +/-n nodes BlindStep(0) equiv Last : goto LastNode  (NO CHECK)
    Declare Property fMove(i As Integer) As Byte                      ' Move a node +/- n positions    
    'Sorting
    Declare Property ColSort(i as Byte) As Byte                          'The column number to sort on (0-n) col 0 is indexed. Définie la colonne de tri active de 0 à MAX_COLS, par défaut 0
    Declare Property fSortMethod(bsortM As Byte) As Byte        'FLAT  1=ascending / -1=descending
    Declare Property fSort As Byte                                              'FLAT sort
    Declare Property HashSort(ub as Byte) as Byte                   '0=No sort on mapping, 1=ascending sort on HashTag mapping or on RestoreHash remapping
    Declare Property Sort As Byte
    Declare Property Sort(bSortmt As Byte) As Byte                  ' CASCADED : 1=ascending / -1=descending : sort(-1) returns a sorted list that is same result as sort(1)+HashStepRev except that sort impacts in memory tree structure
    'Tree control handling
    Declare Property Root As Byte                                           ' Check/Restore List integrity & set cursor to First node of root flat list - Shall be called before HashStep or After NodeFlat or RestoreHash
    Declare Property FlatStack As Byte                                    ' Flat List Access : use it before RestoreHash
    Declare Property RootNode As Byte                                  ' Set cursor to Root node of root flat list
    Declare Property EndNode As Byte                                   ' Set cursor to the last logical node  ( = While MyList.HashStep : Wend ) which is the last node of the last branch of last root flat node
    Declare Property HashStep As Byte                                   ' FOR EACH - recursive  parse property : syntax : While MyList.HashStep=1 : ... : Wend
    Declare Property HashStepRev As Byte                            ' FOR EACH - idem HashStep
    Declare Property KeyStep As Byte                                      ' FOR EACH - While MyList.KeyStep=1 : ... : Wend idem HashStep but show only Keys tagged by user, not the tree structure
    Declare Property KeyStepRev As Byte                               ' FOR EACH - idem KeyStep
    Declare Property KeyStep(ub as uByte) As Byte                 ' FOR EACH - show only Keys previously manually tagged by user using Check(uByte) matching uByte
    Declare Property KeyStepRev(ub as uByte) As Byte          ' FOR EACH - show only Keys previously manually tagged by user using Check(uByte) matching uByte
    Declare Property nCurLevel As Byte
    Declare Property nCurLevel(t as uByte) As Byte                 ' used by numericKeyStep & numericKeyStepRev
    Declare Property nHashStep(t as uByte) As Byte                ' used by numericKeyStep
    Declare Property nKeyStep(t as uByte) As Byte                  ' used by numericKeyStep
    Declare Property nKeyStep As Byte                                   ' numericKeyStep : numeric order
    Declare Property nHashStepRev(t as uByte) As Byte        ' used by numericKeyStepRev
    Declare Property nKeyStepRev(t as uByte) As Byte           ' used by numericKeyStepRev
    Declare Property nKeyStepRev as Byte                             ' numericKeyStepRev : numeric order   
    Declare Property HasTagTree(str_Tag As String) As Byte  ' HasTag alternative (faster) for tree ("Hash") lists
    Declare Property HashTag(str_Tag As String) As Byte       ' Build a hash Key on str_Tag, Return 1 if already exits otherwise return 0   
    Declare Property HashTag As String                                  ' Return Hash key value of current node
    Declare Property HasHashTag(str_Tag As String) As Byte ' Return 1 if str_Tag is a hash key otherwise return 0
    Declare Property HasKey(str_Tag As String) As Byte          ' Idem HasHashTag Return 1 only for values specified with HashTag (not all cascaded index values)
    Declare Property NodeFlat As Byte                                   ' Déréférence une arborescence de clefs (un HashTag), et traite les données en conséquence       
    Declare Property RestoreHash As Byte                             ' Envoi un node de la Flat List en Hash List (réindexation)
    Declare Property Check(ub As uByte) As Byte                       ' Set current node IsKey status : 0=not a key, 1=a key (internal, autoset), everything but 0 or 255 : a key, 255 reserved for flag delete
    Declare Property Check As Byte                                            ' return IsKey status
    'Hash Control - Object's properties parameters
    Declare Property AutoCursor(i As Byte) As Byte                 'Method for HasTag(string), HasHashTag and HasKey:  0=do nothing current node is unchanged,  1 -DEFAULT- =move current to found on success (HasHashTag), 2=move current to found on success (HasKey), 3=move on partial success
    Declare Property BranchCountDown(i As Byte) As Byte     ' 1/0 Activate(1) or desactivate(0) BranchCountDown, default 0
    Declare Property CopyCatMethod(i As Byte) As Byte          ' 0 or 1 : CopyCat(1) : tracking is using tracking (no HoldBack/track) OR CopyCat(0) : tracking to source is on BranchCount (no BranchCountDown enabled) but tracking possible inside index !
    Declare Property HashKeyUnique(ub as Byte) As Byte      ' Default=1  HashKeyUnique(0)=>HashTag always create a new key even though a key already exists
    Declare Property HashLen(bHashLen As uByte) As Byte   ' 1/2 DEPRECATED (Dynamic=>Static) !! - Longueur des clefs en cascade
    Declare Property KeysRegister(ub As uByte) As Byte         ' DEPRECATED !! - Enregistrement du hashTag parent en premier node caché : optimise l'enregistrement et la récupération de la clef (propriété hashTag) mais ralenti le mapping hashTag("key")
    Declare Property NFmethod(i As Byte) As Byte                  ' Determine le fonctionnement de NodeFlat : NFmethod=-1 node=>GarbageCollector  NFmethod=0 node=>FlatList sauf parents reliquataires NFmethod=1 node=>FlatList même les nodes parents contenant toujours des dépendances (restent en hashtag si enfants), NFmethod=2 ou 3 : avec NFrecursive pour usage avec TrackStep : 2 send only HashTag to garbage and keys to flat, 3 : send first key to flat, all parents to garbage 
    Declare Property NFrecursive(i As Byte) As Byte               ' NFrecursive=0 Standard / NFrecursive=1 parents nodes auto send to garbage collector till no other child and till they are not keys
    Declare Property PVSmethod(ub As Byte) As Byte            ' Predictive Vectors Static (optimization algo for HashTag) -1=no PVS / disabled (default), 0= PVS on, 1=PVS with priority forced    
    Declare Property PVSratio(ub As uByte) As Byte               ' Static coeff for PVS dynamic adjustement
    Declare Property RHmethod(i As Byte) As Byte                 ' Determine le fonctionnement de RestoreHash par rapport aux doublons : RHmethod=-1 : Hashnode->GarbageCollector  / RHmethod=0 : no swap / RHmethod=1 : Hashnode->FlatList - RHmethod has no effect on multivalues lists ( HashKeyUnique(0) )
    Declare Property SeekMethod(i as Byte) As Byte              ' Method for Tag(string), HasTag(string), HashTag(string), HasHashTag and HasKey: 1(default)=seek from First to Last | 2: seek from Lastnode to firstNode | 0 :seek from currentnode to last node (Flat multikeys)
    Declare Property SnatchBLmethod(i As Byte) As Byte      ' For SnatchBelow 0=Source ParentNode snatched below target / 1=Source Child Nodes snatched below target (leaving ex-parent node in source list) (for intuitive key pairing between source & target)
    Declare Property TrackMethod(by As Byte) As Byte          ' DEPRECATED MyList.TrackMethod(0)=might be faster (Default) / MyList.TrackMethod(1)=slow, might be more secure in specific cases (Pretty useless)
    Declare Property TrackMultiKeys(uB as uByte) As Byte    ' If uB<>0 multikeys will be automatically tracked (Track & TrackStep) on specified track each HashTag : working with CopyCat and RestoreHash as well
    Declare Property TrackTarget(uB As uByte) As Byte         ' If TrackMultiKeys enabled, specify a track number for multi-values auto-tracking, default is Track1
    Declare Property VectorUnlock As Byte                            ' Unlock auto security : Track vector is ONE choice between HoldBack/Track OR CopyCatMethod(1)/Follow - BranchCount vector is ONE choice between CopyCatMethod(0)/Follow OR BranchCountDown(1) OR PVSmethod(1+) - Using CopyCat index let you one choice left between Tracking, CountDown or PVS optimization
    Declare Property VectorClear As Byte                               ' If list structure has been changed (ie snatch, NodeFlat), tracking links or others (count down, PVS, or Follow) might be corrupted : working like CopyCat targeting current node and the whole child tree, clearing corrupted (or so called) links
    'Flow control
    Declare Property BranchCount As uInteger                        'Return Branch Count
    Declare Property Up As Byte                                              'idem UpLevel
    Declare Property Down As Byte                                         'idem Branch but prevent from creating an orphan sublist entry   
    Declare Property HoldBack As Byte                                  ' Works with Track : First Holback is initialiazing tracking, then each HolBack is recording a new tracked node. Track indicates to set cursor to first holbacked node & TrackStep is tracking all holbacked nodes in chronological order
    Declare Property HoldBack(i As Byte) As Byte                  ' Works with Track : indicates the number the track working with
    Declare Property HoldBackRev As Byte 
    Declare Property HoldBackRev(i As Byte) As Byte
    Declare Property TrackStep As Byte                              ' -SELECTIVE- FOR EACH - While MyList.TrackStep=1 : ... : Wend : selective PARSE only Keys marked for tracking by HoldBack, set tracking context to 1
    Declare Property Track As Byte                                      ' Set track pointer to first tracked node
    Declare Property Track(i As Byte) As Byte                      ' Only one track but several track pointers    
    Declare Property TrackSet As Byte                                ' Create/replace a new point for tracking : next List.Track+TrackStep will iterate from next tracked node from tracking point / does not break track list
    Declare Property TrackSet(i As Byte) As Byte                ' Manage several tracking point
    Declare Property IsTracked As Byte                              ' Return 1 If current Tracking context is inside a TrackStep Loop otherwise return 0 - Should be automatic
    Declare Property IsTracked(uB As uByte) As Byte         ' Automatically managed, should be useless, nevertheless.. can force context (List.Root restore tracking context to 0)
    Declare Property IsTagFree As Byte                              '  When working with several tracks (pointers) it can be usefull to know wether a node has been already tracked or not to control tracking overwrite (ex 'IsTracked')
    Declare Property TrackClear As Byte
    Declare Property TrackClear(i As Byte) As Byte              ' Indicates to reinitialize Track n°i : next HolBack will initialize a track to current node
    Declare Property Aside As Byte                                      ' Memorise ListNode ptr dans le pointeur n°0
    Declare Property Aside(i As Byte) As Byte                       ' Memorise ListNode ptr dans le pointeur n°i
    Declare Property Recover As Byte                                 ' Repositionne l'élément courant de la liste sur celui mémorisé par Take, si cet élément existe toujours, sinon renvoie False
    Declare Property Recover(i As Byte) As Byte                  ' Repositionne l'élément courant de la liste sur celui mémorisé par Take(i)
    Declare Property Follow(pList As List) As Byte
    'Memory management
    Declare Property FlatCount As uInteger                         ' Return number of values stored in Flat List
    Declare Property GarbageCount As uInteger                 ' Return number of nodes available in garbage collector
    Declare Property ContainerCount As uInteger                ' Return number of nodes container available in hidden garbage collector
    Declare Property NodeCount As uInteger                      ' Return number of nodes including not visible ones
    Declare Property TagLenRedim(ub as uByte) as Byte   ' # Define TagMode 0 or # Define TagMode 1 ONLY : MyList.TagLenRedim(0) forces fixed size TagLen (TagLenDefault on TagMode 0 or MAX_TAGLEN on TagMode 1, wich means automatic truncation on oversize
    Declare Property TagLenDefault(ub as uByte) as Byte  ' # Define TagMode 0 ONLY : MyList.ColTags(4) : MyList.TagLenDefault(4) : MyList.ColTags(0) => All NEWLY created node will instanciated with zString*4 by default on Tag4, wheras others tags still instanciated DEF_TAGLEN by default
    Declare Property GarbageFlat As Byte                            'Send all Flat List to GarbageCollector
    Declare Property Recycle As uInteger                            'AllFlat+GarbageCollector : détruit une arborescence et envoi tout en GarabgeCollector - do NOT garbage protected flat list
    Declare Property DropAll As uInteger                              'Remove all elements in list, except a 5/6 listnodes subset                         
    Declare Property Destroy As Byte                                   'Manual destructor
    'List Data Links & Exchange   
    Declare Property Snatch(pList As List) As Byte                 'Snatch a whole branch from another List to next node
    Declare Property SnatchBelow(pList As List) As Byte       'Snatch a whole branch from another List Below current node
    Declare Property FlatSnatch(pList As List) As Byte           'Target's Flat list is transfered to current list
    Declare Property GarbageSnatch(pList As List) As Byte   'Target's Garbage Collector is transfered to current list
    Declare Property CopyCat(pList As List) As Byte               'Create an index (linked to source)  from a flat (node per node) or indexed column (if so current node + its whole child tree), element by element (auto support multivalues) can work from loops (filtering)  
    Declare Property CopyTrack(pList As List) As Byte           'Create an index (linked to source)  from current track cession (if previously opened by 'Track(i)'), element by element (auto support multivalues), take into account 'CopyCat' Method
End Type

'SHARED 2/2
Dim Shared gCollector As List

'==========================================================================================CONSTRUCTOR & DESTRUCTOR  :  this.pFirstNode->pBranch->pBranchLastNode=0
Constructor List
    pFlatRoot = _Callocate(Len(ListNode)) : pNode = _Callocate(Len(ListNode)) : this.uNodeCOUNT+=2  ' Moment angulaire(petite masse)
    pPanCakeGarbage=_Callocate(Len(ListContainer)) : pPanCakeGarbage->pNextContainer=pPanCakeGarbage
    pFirstNode = pNode : pLastNode = pNode : bSeekMethod = 1 : uCount = 0 : uTag = 0 :     
    pFirstFIRSTNode = pNode : pLastLASTNode = pNode  : this.pFirstNode->BranchCount=0 : pNode->Tag0 = LIST_RES     
    pFirstFIRSTNode->pNext=pFlatRoot : pFlatRoot->pPrev=pFirstFIRSTNode : pFlatRoot->Tag0=LIST_ROOT
    # IF TagMode=0
        For ub as uByte=MIN_COLS To MAX_COLS : uB_TagC_Len( ub ) = DEF_TAGLEN : Next ub
    # ENDIF
    this.Root : this.AllOf : uSortTag=0
End Constructor
Destructor List : this.Destroy : End Destructor

'==========================================================================================TYPE LIST PRIVATE PROPERTIES
Property List.AllowCake As ListNode Ptr ' This.Vralloc
    Dim pTemp as ListNode Ptr=pFlatRoot->pNext
    If pTemp<>pGarbage Then : pFlatRoot->pNext=pTemp->pNext : pTemp->pNext->pPrev=pFlatRoot : This.uGarbCt-=1 : pTemp->pBranchLastNode=0
    Else : pTemp=_Callocate(Len(ListNode)) : this.uNodeCOUNT+=1 ' Moment Angulaire(petite masse)         
End If : pTemp->Tag1=0 : Return pTemp
End Property

Property List.AllowPanCake As ListContainer Ptr
    Dim pPanTemp As ListContainer Ptr : dim uB As uByte
    If pPanCakeGarbage->pNextContainer<>pPanCakeGarbage Then
        pPanTemp=pPanCakeGarbage->pNextContainer : *pPanTemp->str_item="" : *pPanTemp->str_flat_tag=""
        For uB=MIN_COLS To MAX_COLS
            # IF TagMode=0
                *pPanTemp->str_tag_C(uB)=""
            # ELSE
                pPanTemp->str_tag_C(uB)=""
            # ENDIF
        Next uB
        pPanCakeGarbage->pNextContainer=pPanCakeGarbage->pNextContainer->pNextContainer : uContainerGarbCt-=1 : pPanTemp->pNextContainer=0
    Else
        pPanTemp=_Callocate(Len(ListContainer))
        # IF TagMode=0
            If DEF_TAGLEN>0 Then : For uB=MIN_COLS To MAX_COLS : pPanTemp->str_tag_C(uB)=_Callocate(uB_TagC_Len( ub ) ) : pPanTemp->TagC_Len(uB)=uB_TagC_Len( ub )  : Next uB : End If
        # ENDIF
    End If : Return pPanTemp
End Property

Property List.FlatTagSet(Str_Tag As String) As Byte
    Dim As uInteger iLen=Len(Str_Tag)+1
    If iLen >= pCurrentPanCakeTMP->int_tag_len Then
        If pCurrentPanCakeTMP->str_flat_tag<>0 Then : _Deallocate(pCurrentPanCakeTMP->str_flat_tag) : End If       
        pCurrentPanCakeTMP->str_flat_tag=_Callocate(iLen)
        pCurrentPanCakeTMP->int_tag_len=iLen
    End If
    *pCurrentPanCakeTMP->str_flat_tag = str_Tag
    Return 1
End Property

Property List.ValSet(Str_Tag As String) As Byte
    Dim As uInteger iLen=Len(Str_Tag)+1
    If iLen >= pCurrentPanCakeTMP->int_val_len Then       
        If pCurrentPanCakeTMP->str_item<>0 Then : _Deallocate(pCurrentPanCakeTMP->str_item) : End If       
        pCurrentPanCakeTMP->str_item=_Callocate(iLen)     
        pCurrentPanCakeTMP->int_val_len=iLen
    End If
    *pCurrentPanCakeTMP->str_item = str_Tag
    Return 1
End Property

Property List.TagC_Set(Str_Tag As String) As Byte
    # IF TagMode=0
        Dim As uShort iLen : Dim As zString Ptr pz=pCurrentPanCakeTMP->str_tag_C(uB_ind)
        If uB_RedimTagLen=1 Or pz=0 Then
            iLen=Len(Str_Tag)+1
            If iLen >= pCurrentPanCakeTMP->TagC_Len(uB_ind) Then
                If pz<>0 Then : _Deallocate(pz) : End If       
                pCurrentPanCakeTMP->str_tag_C(uB_ind)=_Callocate(iLen)
                pCurrentPanCakeTMP->TagC_Len(uB_ind)=iLen
            End If
        End If
        *pCurrentPanCakeTMP->str_tag_C(uB_ind) = str_Tag
    # ELSEIF TagMode=1
        If uB_RedimTagLen=1 Then
            Dim As uShort iLen ': Dim As uByte Ptr PuB : Dim As zString Ptr PzS
            iLen=Len(Str_Tag)
            If iLen > MAX_TAGLEN Then
                Dim As uShort uNbLoops
                Dim As zString Ptr Pz1=StrPtr(Str_Tag), Pz2=Pz1
                Pz1+=MAX_TAGLEN
                (*zp3)[0]=(*Pz1)[0] : Pz1[0]=0
                pCurrentPanCakeTMP->str_tag_C(uB_ind) = *Pz2               
                (*Pz1)[0]=(*zp3)[0]               
                uNbLoops=-Int(-iLen/MAX_TAGLEN)-1
                For i as uShort=1 To uNbLoops                   
                    Pz2+=MAX_TAGLEN
                    Pz1+=MAX_TAGLEN
                    (*zp3)[0]=(*Pz1)[0] : Pz1[0]=0
                    If pCurrentPanCakeTMP->pNextContainer=0 Then
                        pCurrentPanCakeTMP->pNextContainer=AllowPanCake
                    End If
                    pCurrentPanCakeTMP->pNextContainer->str_tag_C(uB_ind) = *Pz2
                    (*Pz1)[0]=(*zp3)[0]
                    pCurrentPanCakeTMP=pCurrentPanCakeTMP->pNextContainer
                Next i
            Else
                If iLen = MAX_TAGLEN And pCurrentPanCakeTMP->pNextContainer<>0 Then : pCurrentPanCakeTMP->pNextContainer->str_tag_C(uB_ind) = "" : End If
                pCurrentPanCakeTMP->str_tag_C(uB_ind) = str_Tag
            End If
        Else
            pCurrentPanCakeTMP->str_tag_C(uB_ind) = str_Tag
        End If       
    # ELSE
        pCurrentPanCakeTMP->str_tag_C(uB_ind) = str_Tag
    # ENDIF
    Return 1
End Property

# IF TagMode=1
    Property List.TagC_Get As String
        If uB_RedimTagLen=1 Then
            Dim As ListContainer Ptr pPanTmp=pCurrentPanCakeTMP->pNextContainer
            sMV_Tag=pCurrentPanCakeTMP->str_tag_C(uB_ind)
            If Len(sMV_Tag)=MAX_TAGLEN Then
                uB_tmp=1
                While pPanTmp<>0 And uB_tmp=1
                    If pPanTmp->str_tag_C(uB_ind)<>"" Then : sMV_Tag+= pPanTmp->str_tag_C(uB_ind) : Else : uB_tmp=0 : End If
                    pPanTmp=pPanTmp->pNextContainer
                Wend
            End If
            Return sMV_Tag
        Else
            Return pCurrentPanCakeTMP->str_tag_C(uB_ind)
        End If   
    End Property
# ENDIF

Property List.AllRecycle As uInteger
    Dim pTemp As ListNode Ptr : Dim pTemp2 As ListNode Ptr : Dim pContextRetour As ListContext       
    Dim NbCollected As uInteger=0 : Dim as uByte ub1
    If this.pNode->pNext=0 Or this.pGarbage->pNext=0 Then : Return 0 : End If
    If pGarbage->ListData<>0 Then : pGarbage->ListData->pNextContainer=pPanCakeGarbage->pNextContainer : pPanCakeGarbage->pNextContainer=pGarbage->ListData : pGarbage->ListData=0 : uContainerGarbCt+=1 : End If
    If pLocalMove=pLastLASTNode Then : pLastLASTNode=pLastLASTNode->pPrev : End If : this.NodeRecycle : This.RootPrivate
    If this.pFirstNode=this.pFirstFIRSTNode Then : pNode= this.pGarbage->pNext : Else : pNode= this.pFirstNode->pNext : End If  : If pNode=0 Then : Return 0 : End If
    If pNode <>0 Then
        Do
            If pNode->Tag0<>LIST_RES And pNode->pBranch<>0 Then   
                pNode->pNext->pPrev=pNode->pBranch->pBranchLastNode : pNode->pBranch->pBranchLastNode->pNext=pNode->pNext
                pNode->pNext=pNode->pBranch : pNode->pBranch->pBranch=0 : pNode->pBranch=0 : pNode->BranchCount=0
            Else 'ListData->str_flat_tag
                If this.pNode->pNext<>0 Then
                    pNode->Tag0 = LIST_DEL : pNode->BranchCount=0 : NbCollected +=1 ':  pNode->pBranchLastNode=0 ': iLong+=1  For ub1=1 To RUP_COLS : pNode->Tag1(ub1)="" : Next ub1 :
                    If pNode->ListData<>0 Then
                        # IF TagMode=0
                            For ub1=MIN_COLS To MAX_COLS : *pNode->ListData->str_tag_C(ub1)="" : Next ub1
                        # ELSEIF TagMode=1
                            Dim As ListContainer Ptr pPanTemp=pNode->ListData->pNextContainer, PNextContTMP=pPanTemp'->pNextContainer
                           ' If pPanTemp<>0 Then : PNextContTMP=pPanTemp->pNextContainer : End If
                            While PNextContTMP<>0             
                                pPanTemp=PNextContTMP
                                For ub1=MIN_COLS To MAX_COLS : pPanTemp->str_tag_C(ub1)="" : Next ub1
                                PNextContTMP=PNextContTMP->pNextContainer
                                pPanTemp->pNextContainer=pPanCakeGarbage->pNextContainer : pPanCakeGarbage->pNextContainer=pPanTemp :  uContainerGarbCt+=1                               
                            Wend
                            For ub1=MIN_COLS To MAX_COLS : pNode->ListData->str_tag_C(ub1)="" : Next ub1
                        # ELSE
                            For ub1=MIN_COLS To MAX_COLS : pNode->ListData->str_tag_C(ub1)="" : Next ub1
                        # ENDIF
                        pNode->ListData->pNextContainer=pPanCakeGarbage->pNextContainer : pPanCakeGarbage->pNextContainer=pNode->ListData : pNode->ListData=0 : uContainerGarbCt+=1
                    End If                           
                    this.pNode=this.pNode->pNext
                End If               
            End If
        Loop Until pNode->pNext=0 Or pNode->pNext->Tag0 = LIST_DEL
    End If
    If NbCollected>0 Then : This.uGarbCt+=NbCollected : uCount=0 : this.pFirstNode->BranchCount=this.uCount : pLastNode=pNode : If pFirstNode=pFirstFIRSTNode Then : pLastLASTNODE=pNode : End If : End If   
    This.RootPrivate : pGarbage=pLastNode->pPrev :pTemp=pNode : pNode=pGarbage : this.Val(LIST_DEL) : pNode=pTemp
    Return NbCollected
End Property

Property List.Branch As Byte
    Dim pTemp As ListNode Ptr :  Dim pTemp1 As ListNode Ptr   
    this.pFirstNode->BranchCount = this.uCount : this.pFirstNode->pBranchLastNode = this.pLastNode
    pTemp = this.pNode
    If this.pNode->pBranch=0 Then ' this.NewHash(this.pNode)
        pTemp1 = this.pLastNode : this.uCount+=1 : pTemp1->pNext = this.AllowCake 'And eat it
        pTemp1->pNext->pPrev = pTemp1 : pTemp1->pNext->Tag0 = LIST_RES  ' pTemp1->pNext->Tag(uTag) = LIST_RES
        pTemp1 = pTemp1->pNext : this.pLastNode = pTemp1 : pNode=pTemp1  ' this.BlindTag(LIST_RES) :
        this.pNode->pPrev=this.pFirstNode : pNode->pBranch = pTemp
        pTemp->pBranch=this.pNode : pTemp->BranchCount=0 : this.uCount=0 : pTemp->pBranchLastNode=this.pNode     
        this.pFirstNode=pTemp->pBranch : this.pNode = this.pFirstNode : this.bSearchRes = 0 : Return 0
    Else 'Branche déjà créée
        this.pFirstNode = this.pNode->pBranch : this.uCount = this.pFirstNode->BranchCount
        this.pLastNode = this.pNode->pBranch->pBranchLastNode         
        this.pNode = this.pNode->pBranch : this.bSearchRes = 0 : Return 1
    End If   
End Property

Property List.UpLevel As Byte   
    If this.pFirstNode->pPrev = 0 Then : Return 0 : End If
    If this.pFirstNode->pBranch <> 0 Then ' Retour node de départ pour faciliter un parcours éventuel
        this.pNode = this.pFirstNode->pBranch : this.pFirstNode->BranchCount = this.uCount : this.pFirstNode->pBranchLastNode = this.pLastNode
        this.pFirstNode = this.pFirstNode->pPrev : this.uCount = this.pFirstNode->BranchCount : this.pLastNode = this.pFirstNode->pBranchLastNode         
        this.bSearchRes = 0
        Return 1
    Else : Return 0
    End If               
End Property

Property List.NodeRecycle as Byte
    If pLocalMove<>0 Then 'pLocalMove est un node à suppression décalée       
        pLocalMove->pPrev=this.pFlatRoot : pLocalMove->pNext=this.pFlatRoot->pNext : pLocalMove->BranchCount=0 ' :  pLocalMove->Tag1="" : pLocalMove->pBranch=0 :  pLocalMove->Tag(0)=LIST_DEL :
        If pLocalMove->ListData<>0 Then : pLocalMove->ListData->pNextContainer=pPanCakeGarbage->pNextContainer : pPanCakeGarbage->pNextContainer=pLocalMove->ListData : pLocalMove->ListData=0 : uContainerGarbCt+=1 : End If
        this.pFlatRoot->pNext->pPrev=pLocalMove : this.pFlatRoot->pNext=pLocalMove : this.uGarbCt+=1
        pLocalMove = 0       
    End If
    Return 1
End Property
Property List.NodeRecycle2 as Byte
    If pLocalRoot<>0 Then 'pLocalRoot est un node LIST_RES             
        pLocalRoot->pPrev=this.pFlatRoot : pLocalRoot->pNext=this.pFlatRoot->pNext : pLocalRoot->Tag0=LIST_DEL  : pLocalRoot->BranchCount=0
        this.pFlatRoot->pNext->pPrev=pLocalRoot : this.pFlatRoot->pNext=pLocalRoot : This.uGarbCt+=1
        pLocalRoot->pBranch->pBranch=0 : pLocalRoot->pBranch->pBranchLastNode=0 : pLocalRoot->pBranch->BranchCount=0 :
        pLocalRoot->BranchCount=0 : pLocalRoot->pBranch=0 : pLocalRoot = 0
    End If
    Return 1
End Property

Property List.RootPrivate As Byte   
    this.AllOfPrivate : While UpLevel : Wend : this.pFirstNode = this.pFirstFIRSTNode : this.bSearchRes = 0 : this.sSearchTag = "" : this.pNode = this.pGarbage : Return 1
End Property

Property List.FlatStack(uB As Ubyte) As Byte
    'Gestion du contexte de la Flat List qui doit contenir un dernier node à blanc   
    Dim pTemp1 As ListNode Ptr
    This.RootPrivate
    this.pNode=this.pFlatRoot : this.Branch
    If this.pLastNode=this.pFlatRoot->pBranch Then
        If this.pEndFlat<>0 Then : this.pFlatRoot->pBranch->pNext=pEndFlat : pEndFlat->pPrev=this.pFlatRoot->pBranch : this.pEndFlat->pNext=0 : this.pLastNode=this.pEndFlat
        Else : this.BlindTag("") : this.pEndFlat=this.pNode : this.uCount -=1         
        End If
    ElseIf this.pLastNode<>this.pEndFlat Then           
        If this.pEndFlat<>0 Then
            this.pEndFlat->pPrev->pNext=this.pEndFlat->pNext : this.pEndFlat->pNext->pPrev=this.pEndFlat->pPrev
            this.pEndFlat->pPrev=this.pLastNode : this.pLastNode->pNext=this.pEndFlat : this.pEndFlat->pNext=0 : this.pLastNode=this.pEndFlat
        Else : this.BlindTag("") : this.pEndFlat=this.pNode : this.uCount -=1
        End If                       
    End If     
    this.pFirstNode->pBranchLastNode = this.pLastNode
    If uB=0 Then : this.UpLevel : End If : this.AllOfPrivate
    Return 1
End Property
Property List.BCountDown(i As Byte) As Byte : Dim pTemp As ListNode Ptr=pFirstNode : While pTemp->pPrev<>0 : If pTemp->pBranch<>0 Then : pTemp->pBranch->BranchCount+=i : End If : pTemp=pTemp->pPrev : Wend : Return 1 : End Property
Property List.ValPrivate(str_value As String) As Byte : If this.pValTmp->ListData=0 Then : this.pValTmp->ListData=this.AllowPanCake : End If : pCurrentPanCakeTMP=this.pValTmp->ListData : this.ValSet(str_value) : Return 1 : End Property 'this.pValTmp->ListData->str_item=str_value :
Property List.ValPrivate As String : If this.pValTmp->ListData=0 Then : Return "" : End If : Return *this.pValTmp->ListData->str_item : End Property

Property List.AllOfPrivate As uInteger
    this.pNode = this.pFirstNode : bfStepZero=0
    If this.pFirstNode=this.pFirstFIRSTNode Then           
        this.pNode = this.pGarbage
        If pWhyteMove<>0 And pWhyteMove<>pLastNode Then  'Changement de fonctionnement - Patch de compatibilité - : il faut un dernier node logique à blanc
            If pWhyteMove->pNext<>0 Then : pWhyteMove->pPrev->pNext=pWhyteMove->pNext : pWhyteMove->pNext->pPrev=pWhyteMove->pPrev : pLastNode->pNext=pWhyteMove : pWhyteMove->pPrev=pLastNode :  End If     
            pLastNode=pWhyteMove : pLastNode->pNext=pFirstFIRSTNode
        End If   
    End If : Return this.Count
End Property

Property List.TrackCompute As Byte
    Dim As ListNode Ptr pTemp1=pNode
    If bAlrdyTracked=1 Then : Return 1 : End If ': TrackCompCounter+=1 ': ? "Track Compute on " & this.pNode->Tag0 
    While pTemp1->Tag0<>LIST_RES And pTemp1<>pGarbage
        If pTemp1->pBranch<>0 Then : pTemp1=pTemp1->pBranch->pPrev : Exit While : End If ' This code is naturally using one Swap, Cast and Exit for aesthetic and legitimate reasons, Gosub @ Extends are unfortunately missing.
        pTemp1=pTemp1->pPrev
    Wend
    If pTemp1=pGarbage Then : pTemp1=pFirstFIRSTNode : End If    
    pFirstNode=pTemp1 : pLastNode=pTemp1->pBranchLastNode : uCount=pTemp1->BranchCount : bAlrdyTracked=1 : pFirstNodeTMP=pTemp1 : pLastNodeTMP=pLastNode : Return 1
End Property

Property List.TrackSecure As Byte
    If pNode->pPrev->Tag0=LIST_RES Then
    ElseIf pNode->pPrev=pTrackTmp Then  : bAlrdyTracked=1
    ElseIf pNode=pTrackTmp Then
        pFirstNode=pFirstNodeTMP : pLastNode=pLastNodeTMP : this.uCount=pFirstNode->BranchCount 
        If pLastNode<>pFirstNode->pNext Then : bAlrdyTracked=1 : End If 
    End If
    this.TrackCompute
    Return 1
End Property

Property List.HashStepTrace As Byte
    While this.pnode->pBranch<>0
        bHStepTrace=-1
        this.pFirstNode=this.pNode->pBranch : this.uCount=this.pFirstNode->BranchCount
        this.pLastNode=this.pNode->pBranch->pBranchLastNode : this.pNode=this.pNode->pBranch
        If pnode<>pLastNode Then : pnode=pnode->pNext : If pNode=pWhyteMove Then : this.AllOf : Return 0 : Else : Return 1 : End If : End If
    Wend : bHStepTrace=0 : If pnode<>pLastNode Then : pnode=pnode->pNext :  If pNode=pWhyteMove Then : this.AllOf : Return 0 : Else : Return 1 : End If : End If
    While pFirstNode->pBranch<>0
        bHStepTrace=1 : pNode=pFirstNode->pBranch : pFirstNode=pFirstNode->pPrev : uCount=pFirstNode->BranchCount
        pLastNode=pFirstNode->pBranchLastNode : If pnode<>pLastNode Then : pnode=pnode->pNext :  If pNode=pWhyteMove Then : this.AllOf : Return 0 : Else : Return 1 : End If : End If
    Wend : this.RootPrivate : Return 0
End Property

'==========================================================================================TYPE LIST PUBLIC PROPERTIES destination is PRIVATE USE
Property List.SetRelation(by as Byte) as Byte : If by=0 Then : bColBcountLocked=1 : ElseIf by=1 Then : bColTrackLocked=1 : Else : Return 0 : End If : bCopyCatRelation=by : Return 1  : End Property
Property List.SetRelation1(pRelNode As ListNode Ptr) As ListNode Ptr : pNode->pBranchLastNode=pRelNode : Return pNode : End Property
Property List.SetRelation2(pRelFirstNode As ListNode Ptr) As ListNode Ptr : this.pNode->BranchCount=CuInt(pRelFirstNode) : Return pNode : End Property
Property List.Relation As ListNode Ptr : If this.bCopyCatRelation=1 Then : Return pNode->pBranchLastNode : ElseIf this.bCopyCatRelation=0 Then : Return Cast(ListNode Ptr, pNode->BranchCount) : Else : Return 0 : End If : End Property
End

