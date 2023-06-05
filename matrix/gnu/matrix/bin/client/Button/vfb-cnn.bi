' Effect feature to economy country
' Pib 1,50% tax selic 13,75%  less 10,25%
' Form Electron sector action normatives
' push ...
Declare Function ButtonPush (ByRef Form As ButtonAlignment)

Property List.GiveBranchDown As ListNode Ptr
    Dim As ListNode Ptr pTemp1, pTemp2   
    If pNode->pBranch=0 Or pNode->Tag0=LIST_RES Or pNode->Tag0=LIST_DEL Or pNode=pWhyteMove Or pNode=pFlatRoot Or pNode->Tag0="" Then : Return 0
    ElseIf pNode->pBranch->Tag0<>LIST_RES Then : Return 0 : End If
    this.pFirstNode->BranchCount = this.uCount : this.pFirstNode->pBranchLastNode = this.pLastNode
    this.NodeRecycle : this.NodeRecycle2 : this.VectorClear
    pTemp1=pNode->pBranch : pNode->pBranch=0 :
    Return pTemp1
End Property

Property List.GiveBranch As ListNode Ptr
    Dim As ListNode Ptr pTemp1, pTemp4
    If pNode->Tag0=LIST_RES Or pNode->Tag0=LIST_DEL Or pNode=pWhyteMove Or pNode=pFlatRoot Then : Return 0 : End If     
    bfStepZero=0 : this.NodeRecycle : this.pFirstNode->BranchCount = this.uCount : this.pFirstNode->pBranchLastNode = this.pLastNode
    pTemp4=pNode->pPrev : pTemp1=pNode :
    If bBranchCountDown=1 Then : this.BCountDown(-pNode->BranchCount) : End If
    If pTemp1=pLastNode Then
        this.NodeRecycle2 : pFirstNode->pBranch->pBranch=0 : pLocalRoot=pFirstNode
        If pLocalRoot->ListData<>0 Then
            # IF TagMode=0
                *pLocalRoot->ListData->str_tag_C(1)=""
            # ELSE
                pLocalRoot->ListData->str_tag_C(1)=""
            # ENDIF
        End If
        pLocalRoot->Tag0=LIST_DEL : this.UpLevel : this.NodeRecycle2 : bfStepZero=1 :  Return pTemp1
    Else
        pNode->pPrev->pNext=pNode->pNext : pNode->pNext->pPrev=pNode->pPrev : uCount-=1 : pFirstNode->BranchCount-=1       
        If pTemp1=pLastNode And pFirstNode<>pFirstFIRSTNode Then
            this.NodeRecycle2 : pFirstNode->pBranch->pBranch=0 : pLocalRoot=pFirstNode
            If pLocalRoot->ListData<>0 Then
                # IF TagMode=0
                    *pLocalRoot->ListData->str_tag_C(1)=""
                # ELSE
                    pLocalRoot->ListData->str_tag_C(1)=""
                # ENDIF
            End If
            pLocalRoot->Tag0=LIST_DEL : this.UpLevel :  this.NodeRecycle2 : bfStepZero=1 : Return pTemp1
        End If         
    End If
    If pTemp4<>pFirstNode Then : pNode=pTemp4 : Else : pNode=pFirstNode->pNext : End If
    Return pTemp1
End Property

Property List.GiveFlat As ListNode Ptr       
    Dim As ListNode Ptr pTemp1, pTemp2
    If pNode->pPrev->Tag0=LIST_DEL Then : this.FlatStack(0) : End If
    If pFirstNode->pNext->Tag0=LIST_ROOT Then : this.Root : End If
    If pFlatRoot->pBranch=0 Then : Return 0 : End If         
    If pFlatRoot->pBranch->pNext=pFlatRoot->pBranch->pBranchLastNode Or pFlatRoot->pBranch->pNext=pFlatRoot->pBranch  Then : Return 0 : End If
    pTemp1=pFlatRoot->pBranch->pNext : pTemp2=pEndFlat->pPrev : If pTemp2=0 Or pTemp1=pTemp2 Then : Return 0 : End If
    pTemp1->pBranch=pTemp2 : pFlatRoot->pBranch->pNext=pEndFlat : pEndFlat->pPrev=pFlatRoot->pBranch
    pTemp1->BranchCount=pFlatRoot->pBranch->BranchCount : uNodeCOUNT-=pFlatRoot->pBranch->BranchCount
    this.pFlatRoot->pBranch->BranchCount=0 : If pFirstNode->pBranch=pFlatRoot Then : uCount=0 : End If 
    Return pTemp1   
End Property

Property List.GiveGarbage As ListNode Ptr
    Dim As ListNode Ptr pTemp1, pTemp2
    If uGarbCt<2 Then : Return 0 : End If : pTemp1=pFlatRoot->pNext : pTemp2=pGarbage->pPrev : If pTemp1=pTemp2 Then : Return 0 : End If
    pFlatRoot->pNext=pGarbage : pGarbage->pPrev=pFlatRoot : pTemp1->pBranch=pTemp2 : pTemp1->BranchCount=uGarbCt
    uNodeCOUNT-= uGarbCt : uGarbCt=0
    Return pTemp1
End Property
Property List.GivePanCake As ListContainer Ptr
    Dim As ListContainer Ptr pPanTemp1, pPanTemp2
    If uContainerGarbCt<2 Then : Return 0 : End If : pLastPanCake=0
    pPanTemp1=pPanCakeGarbage->pNextContainer : pPanTemp2=pPanTemp1
    While pPanTemp2->pNextContainer<>pPanCakeGarbage : pPanTemp2=pPanTemp2->pNextContainer : Wend : pPanTemp2->pNextContainer=0 : pLastPanCake=pPanTemp2
    pPanCakeGarbage->pNextContainer=pPanCakeGarbage : uContainerGivenCt=uContainerGarbCt : uContainerGarbCt=0
    Return pPanTemp1
End Property
Property List.GiveLastPanCake As ListContainer Ptr : Return pLastPanCake : End Property
Property List.GivePanCakeCount As uInteger : Return this.uContainerGivenCt : End Property

'==========================================================================================TYPE LIST PUBLIC PROPERTIES - FLAT CONTROL
Property List.Tag(str_Tag As String) As Byte
    If this.HasTag(str_Tag) Then : this.pNode = this.pSearchNode : uB_tmp=1
    Else
        pNode = this.pLastNode : this.uCount+=1 : pNode->pNext = this.AllowCake 'And eat it
        pNode->pNext->pPrev = pNode : pNode->pNext->Tag0 = str_Tag  : uB_tmp=0
        pNode = pNode->pNext : this.pLastNode = pNode : If bBranchCountDown=1 Then : this.BCountDown(1) : End If
        If pFirstNode=pFirstFIRSTNode And pWhyteMove<>pLastNode Then
            pWhyteMove->pPrev->pNext=pWhyteMove->pNext : pWhyteMove->pNext->pPrev=pWhyteMove->pPrev : pLastNode->pNext=pWhyteMove : pWhyteMove->pPrev=pLastNode : pLastNode=pWhyteMove : pLastNode->pNext=0
        End If
    End If       
    If  (uTag=0 And uB_IsTree=1) Or str_Tag=""  Then
    ElseIf this.uB_tmp=0 Then
        If pNode->ListData=0 Then : pNode->ListData=AllowPanCake : End If
        If uTag=0 Then : pCurrentPanCakeTMP=pNode->ListData : this.FlatTagSet(Str_Tag)
        Else : pCurrentPanCakeTMP=pNode->ListData : uB_ind=uTag : this.TagC_Set(Str_Tag)  '   pNode->ListData->str_tag_C(uTag) = str_Tag
        End If       
    End If
    Return uB_tmp
End Property

Property List.Tag As String : Return This.Tag(uTag) : End Property
Property List.Tag(i As Integer) As String ' La propriété devient multicontextuelle (flat & tree) suite chgt implémentation   "@" + Val(pz)
    If i=0 And uB_IsTree=1 Then : Return this.pNode->Tag0  ' Tree context specified by user
    ElseIf pNode->ListData=0 Then : Return this.pNode->Tag0  ' Tree context mandatory
    ElseIf i=0 Then :  If *pNode->ListData->str_flat_tag="" Then : Return this.pNode->Tag0 : Else : Return *pNode->ListData->str_flat_tag : End If
    Else
        # IF TagMode=0
            Return *pNode->ListData->str_tag_C(i)
        # ELSEIF TagMode=1
            If uB_RedimTagLen=1 Then
                Dim As ListContainer Ptr pPanTmp=pNode->ListData->pNextContainer
                sMV_Tag=pNode->ListData->str_tag_C(i)
                If Len(sMV_Tag)=MAX_TAGLEN Then
                    uB_tmp=1
                    While pPanTmp<>0 And uB_tmp=1
                        If pPanTmp->str_tag_C(i)<>"" Then : sMV_Tag+= pPanTmp->str_tag_C(i) : Else : uB_tmp=0 : End If
                        pPanTmp=pPanTmp->pNextContainer
                    Wend
                End If
                Return sMV_Tag
            Else
                Return pNode->ListData->str_tag_C(i)
            End If           
        # ELSE
            Return pNode->ListData->str_tag_C(i)
        # ENDIF
    End If
End Property

Property List.HasTagFlat(str_Tag As String) As Byte
    If uTag<>0 Then : Return this.HasTagFlat(str_Tag) : End If
    Dim As ListNode Ptr pTemp : uB_tmp=0   
    If bSeekMethod=1 Then
        pTemp=pFirstNode : If this.pFirstNode=this.pFirstFIRSTNode Then : pTemp = this.pGarbage  : End If
        While (pTemp->pNext <> 0 And  uB_tmp=0  AND pTemp <> this.pLastNode ) : pTemp = pTemp->pNext : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : End If : Wend
    ElseIf bSeekMethod=2 Then
        pTemp=pLastNode : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : End If
        While (pTemp->pPrev <> 0 And  uB_tmp=0  AND pTemp <> this.pGarbage ) : pTemp = pTemp->pPrev : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : End If : Wend 
    Else
        pTemp=pNode : If pTemp=0 Then : pTemp = this.pFirstNode : End If ': If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : End If
        While (pTemp->pNext <> 0 And  uB_tmp=0  AND pTemp <> this.pLastNode ) : pTemp = pTemp->pNext : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : End If : Wend
    End If   
    If uB_tmp=1  Then : this.pSearchNode=pTemp : this.bSearchRes=1 : If this.bAutoCursor=1 Then : pNode=pTemp : End If  : Return 1 : Else : this.bSearchRes = 0 : Return 0 : End If
End Property

Property List.HasTag(str_Tag As String) As Byte
    Dim pTemp As ListNode Ptr
    this.sSearchTag = str_Tag : uB_tmp=0
    If this.bSeekMethod=1 Then
        pTemp = this.pFirstNode : If this.pGarbage<>0 And this.pFirstNode=this.pFirstFIRSTNode Then : pTemp = this.pGarbage  : End If           
        If uTag=0 Then
            While (pTemp->pNext <> 0 And uB_tmp=0 AND pTemp <> this.pLastNode)
                pTemp = pTemp->pNext :
                If pTemp->ListData<>0 Then : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : ElseIf *pTemp->ListData->str_flat_tag="" And pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If : ElseIf pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If
            Wend               
        Else
            # IF TagMode=0
                If pTemp->ListData<>0 Then : If *pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pNext <> 0 And uB_tmp=0) : pTemp = pTemp->pNext :  If pTemp->ListData<>0 Then : If *pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ELSEIF TagMode=1
                pCurrentPanCakeTMP=pTemp->ListData : uB_ind=uTag
                If pCurrentPanCakeTMP<>0 Then : If this.TagC_Get = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pNext <> 0 And uB_tmp=0) : pTemp = pTemp->pNext : pCurrentPanCakeTMP=pTemp->ListData : If pCurrentPanCakeTMP<>0 Then : If this.TagC_Get = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ELSE
                If pTemp->ListData<>0 Then : If pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pNext <> 0 And uB_tmp=0) : pTemp = pTemp->pNext :  If pTemp->ListData<>0 Then : If pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ENDIF
        End If     
    ElseIf this.bSeekMethod=2 Then
        pTemp = this.pLastNode
        If uTag=0 Then               
            If pTemp->ListData<>0 Then : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : ElseIf *pTemp->ListData->str_flat_tag="" And pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If : ElseIf pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If
            While (pTemp->pPrev <> 0 And  uB_tmp=0  AND pTemp <> this.pGarbage )
                pTemp = pTemp->pPrev
                If pTemp->ListData<>0 Then : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : ElseIf *pTemp->ListData->str_flat_tag="" And pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If : ElseIf pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If
            Wend               
        Else
            # IF TagMode=0
                uB_tmp=0 : If pTemp->ListData<>0 Then : If *pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pPrev <> 0 And  uB_tmp=0  AND pTemp <> this.pGarbage ) : pTemp = pTemp->pPrev : If pTemp->ListData<>0 Then : If *pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ELSEIF TagMode=1
                pCurrentPanCakeTMP=pTemp->ListData : uB_ind=uTag
                uB_tmp=0 : If pCurrentPanCakeTMP<>0 Then : If this.TagC_Get = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pPrev <> 0 And uB_tmp=0 AND pTemp <> this.pGarbage ) : pTemp = pTemp->pPrev : pCurrentPanCakeTMP=pTemp->ListData : If pCurrentPanCakeTMP<>0 Then : If this.TagC_Get = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ELSE
                uB_tmp=0 : If pTemp->ListData<>0 Then : If pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pPrev <> 0 And  uB_tmp=0  AND pTemp <> this.pGarbage ) : pTemp = pTemp->pPrev : If pTemp->ListData<>0 Then : If pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ENDIF
        End If   
    Else
        pTemp = this.pNode : If pTemp=0 Then : pTemp = this.pFirstNode : End If
        If uTag=0 Then
            If pTemp->ListData<>0 Then : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : ElseIf *pTemp->ListData->str_flat_tag="" And pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If : ElseIf pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If
            While (pTemp->pNext <> 0 And uB_tmp=0 AND pTemp <> this.pLastNode )
                pTemp = pTemp->pNext
                If pTemp->ListData<>0 Then : If *pTemp->ListData->str_flat_tag=str_Tag Then : uB_tmp=1 : ElseIf *pTemp->ListData->str_flat_tag="" And pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If : ElseIf pTemp->Tag0=str_Tag Then : uB_tmp=1 : End If
            Wend               
        Else
            # IF TagMode=0
                If pTemp->ListData<>0 Then : If *pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pNext <> 0 And uB_tmp=0 AND pTemp <> this.pLastNode ) : pTemp = pTemp->pNext : If pTemp->ListData<>0 Then : If *pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ELSEIF TagMode=1
                pCurrentPanCakeTMP=pTemp->ListData : uB_ind=uTag
                uB_tmp=0 : If pCurrentPanCakeTMP<>0 Then : If this.TagC_Get = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pNext <> 0 And uB_tmp=0 AND pTemp <> this.pLastNode ) : pTemp = pTemp->pNext : pCurrentPanCakeTMP=pTemp->ListData : If pCurrentPanCakeTMP<>0 Then : If this.TagC_Get = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ELSE
                If pTemp->ListData<>0 Then : If pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If
                While (pTemp->pNext <> 0 And uB_tmp=0 AND pTemp <> this.pLastNode ) : pTemp = pTemp->pNext : If pTemp->ListData<>0 Then : If pTemp->ListData->str_tag_C(uTag) = str_Tag Then : uB_tmp=1 : End If : End If : Wend
            # ENDIF
        End If     
    End If   
    If uB_tmp=1  Then
        this.pSearchNode=pTemp : this.bSearchRes=1 : If this.bAutoCursor=1 Then : pNode=pTemp : End If  : Return 1
    Else : this.bSearchRes = 0 : Return 0 : End If   
End Property

Property List.BlindTag(str_Tag As String) As Byte
    Dim pTemp As ListNode Ptr : Dim item As ListContainer
    pTemp = this.pLastNode : this.uCount+=1 : pTemp->pNext = this.AllowCake 'And eat it
    pTemp->pNext->pPrev = this.pLastNode :
    If uTag=0 And uB_IsTree=1 Then : pTemp->pNext->Tag0 = str_Tag
    Else
        pTemp->pNext->Tag0=str_Tag : If pTemp->pNext->ListData=0 Then : pTemp->pNext->ListData=AllowPanCake() : End If : pCurrentPanCakeTMP=pTemp->pNext->ListData
        If uTag=0 Then : this.FlatTagSet(Str_Tag)
        ElseIf uSortTag<>-1 Then : uB_ind=uTag : this.TagC_Set(Str_Tag)  ' pTemp->pNext->ListData->str_tag_C(uTag)=str_Tag
        End If
    End If
    pTemp = pTemp->pNext : this.pLastNode = pTemp : this.pNode = pTemp
    If bBranchCountDown=1 Then : this.BCountDown(1) : End If : Return 1
End Property

Property List.Insert(str_Tag As String) As Byte
    Dim pTemp As ListNode Ptr : Dim item As ListContainer
    pTemp = this.pNode : this.uCount+=1 : pTemp->pNext = this.AllowCake 'And eat it
    pTemp->pNext->pPrev = this.pNode :
    If uTag=0 And uB_IsTree=1 Then : pTemp->pNext->Tag0 = str_Tag
    Else
        pTemp->pNext->Tag0=str_Tag : If pTemp->pNext->ListData=0 Then : pTemp->pNext->ListData=AllowPanCake() : End If : pCurrentPanCakeTMP=pTemp->pNext->ListData
        If uTag=0 Then : this.FlatTagSet(Str_Tag)
        ElseIf uSortTag<>-1 Then : uB_ind=uTag : this.TagC_Set(Str_Tag)  ' pTemp->pNext->ListData->str_tag_C(uTag)=str_Tag
        End If
    End If : If pLastNode=pTemp Then : pLastNode = pTemp->pNext : End If
    this.pNode = pTemp->pNext : If bBranchCountDown=1 Then : this.BCountDown(1) : End If : Return 1
End Property

Property List.RwTag(s_Tag As String) As Byte
    If  uTag<>0  Then : If pNode->ListData=0 Then : this.pNode->ListData=AllowPanCake() : End If : pCurrentPanCakeTMP=pNode->ListData : uB_ind=uTag : this.TagC_Set(s_Tag) : Return 1 ' pNode->ListData->str_tag_C(uTag)=s_Tag
    Else
        this.pNode->Tag0=s_Tag ': If uB_IsTree=1 Then : Return 1 : End If
        If pNode->ListData=0 Then : Return 1 : End If : pCurrentPanCakeTMP=pNode->ListData : uB_ind=uTag : this.FlatTagSet(s_Tag) : Return 1
    End If
End Property
Property List.RwTag0(s_Tag As String) As Byte : uB_tmp=uTag : uTag=0 : this.RwTag(s_Tag ) : uTag=uB_tmp : Return 1 : End Property
Property List.RwTag1(s_Tag As String) As Byte : uB_tmp=uTag : uTag=1 : this.RwTag(s_Tag ) : uTag=uB_tmp : Return 1 : End Property
Property List.RwTag2(s_Tag As String) As Byte : uB_tmp=uTag : uTag=2 : this.RwTag(s_Tag ) : uTag=uB_tmp : Return 1 : End Property
Property List.RwTag3(s_Tag As String) As Byte : uB_tmp=uTag : uTag=3 : this.RwTag(s_Tag ) : uTag=uB_tmp : Return 1 : End Property
Property List.RwTag4(s_Tag As String) As Byte : uB_tmp=uTag : uTag=4 : this.RwTag(s_Tag ) : uTag=uB_tmp : Return 1 : End Property

Property List.ColTags As Byte : Return(this.uTag) : End Property
Property List.ColTags(i as Byte) As Byte : this.sSearchTag = "" : this.bSearchRes=0 : If i > MAX_COLS then : this.uTag=MAX_COLS : Return 0 : Else : this.uTag=i : Return 1 : End If : End Property

Property List.AllOf As uInteger
    Dim pContextRetour As ListContext
    If this.IsDestroyed=1 Then : Print "Error List destroyed : this list instance cannot be re-used" : Return 0 : End If :
    Dim  As ListNode Ptr pTemp, pTemp2 : If bTracking=1 Then : this.TrackCompute : End If '  bTracking=0 : 
    If pFirstNode=pFIRSTFIRSTNode Then : If pLastNode<>pWhyteMove Then : this.Root : End If : End If
    this.NodeRecycle : this.NodeRecycle2
    pContextRetour.pNode=pNode : pContextRetour.pFirstNode=This.pFirstNode : pContextRetour.pLastNode=This.pLastNode : pContextRetour.uCount=This.uCount
    this.AllOfPrivate
    pNode=pContextRetour.pNode : This.pFirstNode=pContextRetour.pFirstNode : This.pLastNode=pContextRetour.pLastNode : uCount=pContextRetour.uCount
    pNode=AllowCake : pLocalMove=pNode
    If this.pFirstNode=this.pFirstFIRSTNode Then : pNode->pNext=pGarbage->pNext : Else : pNode->pNext=pFirstNode->pNext : End If
    If pLastNode=pWhyteMove And pLastNode->pPrev<>0 Then : pNode->pPrev=pLastNode->pPrev : Else : pNode->pPrev=pLastNode : End If
    Return this.Count
End Property

Property List.Count As uInteger
    Dim pTemp As ListNode Ptr
    If pWhyteMove=0 And pFirstNode=pFIRSTFIRSTNode Then : pTemp=this.pNode : this.uCount-=2 : this.BlindTag("") : this.pWhyteMove=this.pNode : this.pNode=pTemp : End If : Return this.uCount
End Property

Property List.First As Byte : If pFirstNode=pFirstFIRSTNode Then : pNode=pGarbage : Else : this.pNode=This.pFirstNode->pNext : End If : Return 1 : End Property
Property List.Last As Byte : this.pNode=This.pLastNode : Return 1 : End Property

Property List.Val(str_value As String) As Byte : this.pValTmp=this.pNode : this.ValPrivate(str_value) : Return 1 : End Property
Property List.Val As String : pValTmp=pNode : Return this.ValPrivate : End Property
Property List.ValTag(str_value As String) As String
    If bSearchRes=1 Then : If str_value=this.Tag(uTag) Then : pValTmp=pSearchNode : Return this.ValPrivate : End If
    ElseIf this.HasTag(str_value)=1 Then : pValTmp=pSearchNode : Return this.ValPrivate
    End If : Return("")
End Property

Property List.fStep As Byte : If pNode=pLastNode Or bfStepZero=1 Or pNode->pNext=pWhyteMove Then : bfStepZero=0 : Return 0 : Else : pNode = pNode->pNext : Return 1 : End If : End Property ' Or pNode->pNext=pEndFlat
Property List.fStepRev As Byte : If pNode->pPrev=pFirstNode Or pNode->pPrev=pGarbage Or bfStepZero=1 Then : bfStepZero=0 : Return 0 : Else : pNode = pNode->pPrev : Return 1 : End If : End Property
Property List.bStep As Byte : this.pNode = this.pNode->pNext : Return 1 : End Property
Property List.BlindStep As Byte : If this.pNode->pNext<>0 Then : this.pNode = this.pNode->pNext : Return 1 : Else   : Return 0 : End If : End Property
Property List.BlindStep(top As Integer) As Byte
    Dim As Integer i : Dim As Byte istep
    If top>0 Then : istep=1 : For i=1 To top step istep : this.pNode = this.pNode->pNext : Next i : ElseIf top = 0 Then : this.pNode = this.pLastNode : Return 1 : Else : istep=-1 : For i=-1 To top step istep : this.pNode = this.pNode->pPrev : Next i : End If
    Return 1
End Property
Property List.fMove(nbMove As Integer) As Byte
    Dim As ListNode Ptr pFirst, pTemp : Dim i As Integer=0
    If pNode->Tag0=LIST_DEL Or pNode->Tag0=LIST_RES Or pNode=pWhyteMove Or pNode=pEndFlat  Or pNode=pLocalMove Or pNode=pLocalRoot Then : Return 0 : End If
    If pFirstNode=pFirstFIRSTnode Then : pFirst=pGarbage : Else : pFirst=pFirstNode : End If
    If pNode=pLastNode Then : pLastNode=pNode->pPrev : Else : pNode->pNext->pPrev=pNode->pPrev : End If
    pNode->pPrev->pNext=pNode->pNext : pTemp=pNode
    If nbMove>0 Then : For i=0 To nbMove-1 : If pNode<>pLastNode Then : pTemp=pTemp->pNext : End If : Next i
    Else : For i=nbMove To 0 : If pTemp<>pFirstNode Then : pTemp=pTemp->pPrev : End If : Next i
    End If
    If pTemp<>pLastNode Then : pTemp->pNext->pPrev=pNode : pNode->pNext=pTemp->pNext
    Else : If  pTemp->pNext<>0 Then : pNode->pNext=pTemp->pNext : End If : pLastNode=pNode
    End If
    pTemp->pNext=pNode : pNode->pPrev=pTemp
    Return 1
End Property

'==========================================================================================TYPE LIST PUBLIC PROPERTIES - SORTING
Property List.ColSort(i as Byte) As Byte : If i > MAX_COLS then : this.uTag=MAX_COLS : Return 0 : Else : this.uSortTag=i : Return 1 : End If : End Property
Property List.fSortMethod(bsortM As Byte) As Byte : If bsortM=-1 Then : this.bSortMT=-1 : Else : this.bSortMT=1 : End If : Return 1 : End Property
Property List.fSort As Byte
    Dim As ListNode Ptr pTemp1=pFirstNode, pTemp2, pTemp3, pTemp4, pTemp5=pLastNode->pNext : Dim as byte  by=1 : Dim As uByte tmpIsTree=this.uB_IsTree : this.uB_IsTree=0
    If pFirstNode=pFirstFIRSTnode Then : pTemp1=pGarbage : End If
    'Trie+Insert Sort - non recursive   
    gCollector.SetRelation(1) : gCollector.HashKeyUnique(1) : gCollector.HashSort(1) : gCollector.fSortMethod(this.bSortMT) : gCollector.HashLen(1) : gCollector.GarbageSnatch(this)
    this.pFirstNode->BranchCount = this.uCount : this.pFirstNode->pBranchLastNode = this.pLastNode
    pTemp3=pTemp1 : pNode=pTemp1->pNext : If pNode=pFirstNode Then : pTemp4=pFirstNode->pNext : Else : pTemp4=pNode : End If
    While pNode<>pLastNode and by=1
        If gCollector.HashTag( this.Tag(this.uSortTag) )=1 Then : gCollector.HashKeyUnique(0) : gCollector.SeekMethod(1) : gCollector.HashTag( this.Tag(this.uSortTag) ) : gCollector.HashKeyUnique(1) : : End If
        gCollector.SetRelation1(this.pNode) : by=this.fStep
    Wend
    If pFirstNode<>pFirstFIRSTnode Then
        If gCollector.HashTag( this.Tag(this.uSortTag) )=1 Then : gCollector.HashKeyUnique(0) : gCollector.SeekMethod(1) : gCollector.HashTag( this.Tag(this.uSortTag) ) : gCollector.HashKeyUnique(1) : End If
        gCollector.SetRelation1(this.pNode)
    End If
    gCollector.Root
    If this.bSortMT=1 Then : While gCollector.KeyStep : If this.Follow(gCollector) Then : pTemp3->pNext=this.pNode : pNode->pPrev=pTemp3 : pTemp3=pNode : End If : Wend         
    Else : While gCollector.KeyStepRev : If this.Follow(gCollector) Then : pTemp3->pNext=this.pNode : pNode->pPrev=pTemp3 : pTemp3=pNode : End If : Wend
    End If
    pFirstNode->pBranchLastNode=pTemp3 : this.pLastNode=pTemp3 : pNode=pTemp4
    If pFirstNode=pFirstFIRSTnode Then : pWhyteMove->pPrev=pLastNode : End If
    gCollector.Recycle : this.AllOf : this.GarbageSnatch(gCollector) :  this.uB_IsTree=tmpIsTree
    Return 1
End Property

Property List.Sort as Byte : this.Sort(this.bSortMT) : Return 1 : End Property
Property List.Sort(bSortMth As Byte) as Byte
    Dim As ListNode Ptr s_pNode=pNode, s_pFirstNode=pFirstNode
    Dim As uInteger s_uCount=uCount : Dim as Byte bHashSort=this.bSortMT : this.bSortMT=0
    If this.Up Then : this.Down : End If : If bSortMth=-1 Then : this.fSortMethod(-1) : Else : this.fSortMethod(1) : End If  : this.HashSort(0) :
    this.Root : this.fSort :  this.Root : this.pNode=pGarbage
    While this.HashStepTrace : If bHStepTrace=-1 Then : this.fSort : pNode=this.pFirstNode->pNext : End If : Wend
    pNode=s_pNode : pFirstNode=s_pFirstNode : pLastNode=pFirstNode->pBranchLastNode : uCount=s_uCount : bSortMT=bHashSort
    Return 1
End Property
Property List.HashSort(ub as Byte) As Byte : If ub=1 And this.bSortMT=-1 Then : this.bSortMT=1 : End If : If ub=0 Or ub=1 Then : bHTmethod=ub : uSortTag=uTag : Return 1 : Else : Return 0 : End If : End Property
End
