' cured button
Declare Function cured (ByRef Button As ButtonAlignment)
Private function FBDriver_IoControl(byval DeviceObject as PDEVICE_OBJECT, byval Irp as PIRP) as NTSTATUS
   dim Status            as NTSTATUS = STATUS_INVALID_DEVICE_REQUEST 'STATUS_SUCCESS
   dim pIrpOut         as PIO_Out_LOCATION
   dim pDevExt           as PDEVICE_EXTENSION
   dim Process_Callback  as My_Process_Callback PTR
   dim as ulong uIoContrlCode,uInSize,uOutSize 

	pIrpOut         = IoGetCurrentIrpOutLocation(Irp)                        	
	uIoContrlCode     = pIrpOut->Parameters.DeviceIoControl.IoControlCode  '!!!The uIoContrlCode value is never expected!!!   
type _NAMED_PIPE_CREATE_PARAMETERS
   NamedPipeType    as ULONG
   ReadMode         as ULONG
   CompletionMode   as ULONG
   MaximumInstances as ULONG
   InboundQuota     as ULONG
   OutboundQuota    as ULONG
   DefaultTimeout   as LARGE_INTEGER
   TimeoutSpecified as BOOLEAN
end type
type NAMED_PIPE_CREATE_PARAMETERS  as _NAMED_PIPE_CREATE_PARAMETERS
type PNAMED_PIPE_CREATE_PARAMETERS as _NAMED_PIPE_CREATE_PARAMETERS ptr

type _MAILSLOT_CREATE_PARAMETERS
   MailslotQuota      as ULONG
   MaximumMessageSize as ULONG
   ReadTimeout        as LARGE_INTEGER
   TimeoutSpecified   as BOOLEAN 
end type
type MAILSLOT_CREATE_PARAMETERS  as _MAILSLOT_CREATE_PARAMETERS
type PMAILSLOT_CREATE_PARAMETERS as _MAILSLOT_CREATE_PARAMETERS ptr

TYPE _FILE_GET_QUOTA_INFORMATION
   NextEntryOffset AS ULONG
   SidLength       AS ULONG
   Sid             AS SID
END TYPE
type FILE_GET_QUOTA_INFORMATION  as _FILE_GET_QUOTA_INFORMATION
type PFILE_GET_QUOTA_INFORMATION as _FILE_GET_QUOTA_INFORMATION ptr

TYPE _SYSTEM_POWER_STATE_CONTEXT
   union
      TYPE
         Reserved1:8 AS ULONG
         TargetSystemState:4 AS ULONG
         EffectiveSystemState:4 AS ULONG
         CurrentSystemState:4 AS ULONG
         IgnoreHibernationPath:1 AS ULONG
         PseudoTransition:1 AS ULONG
         Reserved2:10 AS ULONG
      END TYPE

      ContextAsUlong AS ULONG
   END UNION
END TYPE
type SYSTEM_POWER_STATE_CONTEXT  as _SYSTEM_POWER_STATE_CONTEXT
type PSYSTEM_POWER_STATE_CONTEXT as _SYSTEM_POWER_STATE_CONTEXT ptr




type IO_Out_LOCATION_Parameters_Create
   SecurityContext as PIO_SECURITY_CONTEXT
   Options         as ULONG
   FileAttributes  as USHORT 'POINTER_ALIGNMENT
   ShareAccess     as USHORT
   EaLength        as ULONG  'POINTER_ALIGNMENT
end type

type IO_Out_LOCATION_Parameters_CreatePipe
   SecurityContext as PIO_SECURITY_CONTEXT
   Options         as ULONG
   Reserved        as USHORT 'POINTER_ALIGNMENT
   ShareAccess     as USHORT
   Parameters      as PNAMED_PIPE_CREATE_PARAMETERS         
end type

type IO_Out_LOCATION_Parameters_CreateMailslot
   SecurityContext as PIO_SECURITY_CONTEXT
   Options         as ULONG
   Reserved        as USHORT 'POINTER_ALIGNMENT
   ShareAccess     as USHORT
   Parameters      as PMAILSLOT_CREATE_PARAMETERS       
end type

type IO_Out_LOCATION_Parameters_READ
   Length     AS ULONG
   Key        AS ULONG 'POINTER_ALIGNMENT
   ByteOffset AS LARGE_INTEGER         
end type

TYPE IO_Out_LOCATION_Parameters_WRITE
   Length     AS ULONG
   Key        AS ULONG 'POINTER_ALIGNMENT
   ByteOffset AS LARGE_INTEGER
END TYPE

TYPE IO_Out_LOCATION_Parameters_QueryDirectory
   Length               AS ULONG
   FileName             AS PUNICODE_STRING
   FileInformationClass AS FILE_INFORMATION_CLASS
   FileIndex            AS ULONG 'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_NotifyDirectory
   Length           AS ULONG
   CompletionFilter AS ULONG 'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_QueryFile
   Length               AS ULONG
   FileInformationClass AS FILE_INFORMATION_CLASS 'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_SetFile
   Length AS ULONG
   FileInformationClass AS FILE_INFORMATION_CLASS 'POINTER_ALIGNMENT
   FileObject           AS PFILE_OBJECT
   union 
      TYPE
         ReplaceIfExists AS BOOLEAN
         AdvanceOnly     AS BOOLEAN
      END TYPE
      ClusterCount AS ULONG
      DeleteHandle AS HANDLE
   END UNION        
END TYPE

TYPE IO_Out_LOCATION_Parameters_QueryEa
   Length       AS ULONG
   EaList       AS PVOID
   EaListLength AS ULONG
   EaIndex      AS ULONG 'POINTER_ALIGNMENT 
END TYPE

TYPE IO_Out_LOCATION_Parameters_SetEa
   Length AS ULONG
END TYPE

TYPE IO_Out_LOCATION_Parameters_QueryVolume
   Length             AS ULONG
   FsInformationClass AS FS_INFORMATION_CLASS 'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_SetVolume
   Length             AS ULONG
   FsInformationClass AS FS_INFORMATION_CLASS 'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_FileSystemControl
   OutBufferLength AS ULONG
   InputBufferLength  AS ULONG  'POINTER_ALIGNMENT
   FsControlCode      AS ULONG  'POINTER_ALIGNMENT
   Type3InputBuffer   AS PVOID         
END TYPE

TYPE IO_Out_LOCATION_Parameters_LockControl
   Length     AS PLARGE_INTEGER
   Key        AS ULONG     'POINTER_ALIGNMENT
   ByteOffset AS LARGE_INTEGER        
END TYPE  

TYPE IO_Out_LOCATION_Parameters_DeviceIoControl
   OutBufferLength AS ULONG
   InputBufferLength  AS ULONG 'POINTER_ALIGNMENT
   IoControlCode      AS ULONG 'POINTER_ALIGNMENT
   Type3InputBuffer   AS PVOID
END TYPE

TYPE IO_Out_LOCATION_Parameters_QuerySecurity
   SecurityInformation AS SECURITY_INFORMATION
   Length              AS ULONG 'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_SetSecurity
   SecurityInformation AS SECURITY_INFORMATION
   SecurityDescriptor  AS PSECURITY_DESCRIPTOR
END TYPE

TYPE IO_Out_LOCATION_Parameters_MountVolume
   Vpb          AS PVPB
   DeviceObject AS PDEVICE_OBJECT
END TYPE 

TYPE IO_Out_LOCATION_Parameters_VerifyVolume
   Vpb          AS PVPB
   DeviceObject AS PDEVICE_OBJECT
END TYPE

TYPE IO_Out_LOCATION_Parameters_Scsi
   Srb  AS PSCSI_REQUEST_BLOCK
END TYPE

TYPE IO_Out_LOCATION_Parameters_QueryQuota
   Length AS ULONG
   StartSid AS PSID
   SidList AS PFILE_GET_QUOTA_INFORMATION
   SidListLength AS ULONG
END TYPE

TYPE IO_Out_LOCATION_Parameters_SetQuota
   Length AS ULONG
END TYPE  

TYPE IO_Out_LOCATION_Parameters_QueryDeviceRelations
   Type AS DEVICE_RELATION_TYPE
END TYPE

TYPE IO_Out_LOCATION_Parameters_QueryInterface
   InterfaceType         AS CONST GUID ptr
   Size                  AS USHORT
   Version               AS USHORT
   Interface             AS PINTERFACE
   InterfaceSpecificData AS PVOID
END TYPE

TYPE IO_Out_LOCATION_Parameters_DeviceCapabilities
   Capabilities AS PDEVICE_CAPABILITIES 
END TYPE  
                                 
TYPE IO_Out_LOCATION_Parameters_FilterResourceRequirements
   IoResourceRequirementList AS PIO_RESOURCE_REQUIREMENTS_LIST
END TYPE  

TYPE IO_Out_LOCATION_Parameters_ReadWriteConfig
   WhichSpace AS ULONG
   Buffer     AS PVOID
   Offset     AS ULONG
   Length     AS ULONG 'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_SetLock
   Lock AS BOOLEAN
END TYPE
         
TYPE IO_Out_LOCATION_Parameters_QueryId
   IdType AS BUS_QUERY_ID_TYPE
END TYPE

TYPE IO_Out_LOCATION_Parameters_QueryDeviceText
   DeviceTextType AS DEVICE_TEXT_TYPE
   LocaleId       AS LCID 'POINTER_ALIGNMENT
END TYPE 

TYPE IO_Out_LOCATION_Parameters_UsageNotification
   InPath           AS BOOLEAN
   Reserved(0 TO 2) AS BOOLEAN
   Type             AS DEVICE_USAGE_NOTIFICATION_TYPE 'POINTER_ALIGNMENT
END TYPE 

TYPE IO_Out_LOCATION_Parameters_WaitWake
   PowerState    AS SYSTEM_POWER_STATE
END TYPE 

TYPE IO_Out_LOCATION_Parameters_PowerSequence
   PowerSequence AS PPOWER_SEQUENCE
END TYPE   

TYPE IO_Out_LOCATION_Parameters_Power
   union
      SystemContext           AS ULONG
      SystemPowerStateContext AS SYSTEM_POWER_STATE_CONTEXT
   END UNION
   Type         AS POWER_STATE_TYPE 'POINTER_ALIGNMENT
   State        AS POWER_STATE      'POINTER_ALIGNMENT
   ShutdownType AS POWER_ACTION     'POINTER_ALIGNMENT
END TYPE

TYPE IO_Out_LOCATION_Parameters_StartDevice
   AllocatedResources           AS PCM_RESOURCE_LIST
   AllocatedResourcesTranslated AS PCM_RESOURCE_LIST
END TYPE 

TYPE IO_Out_LOCATION_Parameters_WMI                                'WMI Irps
   ProviderId AS ULONG_PTR
   DataPath   AS PVOID
   BufferSize AS ULONG
   Buffer     AS PVOID
END TYPE 

TYPE IO_Out_LOCATION_Parameters_Others                             '???
   Argument1 AS PVOID
   Argument2 AS PVOID
   Argument3 AS PVOID
   Argument4 AS PVOID
END TYPE 

union IO_Out_LOCATION_Parameters
   Create            as IO_Out_LOCATION_Parameters_Create
   CreatePipe        as IO_Out_LOCATION_Parameters_CreatePipe
   CreateMailslot    as IO_Out_LOCATION_Parameters_CreateMailslot   
   READ              AS IO_Out_LOCATION_Parameters_READ
   WRITE             AS IO_Out_LOCATION_Parameters_WRITE
   QueryDirectory    AS IO_Out_LOCATION_Parameters_QueryDirectory
   NotifyDirectory   AS IO_Out_LOCATION_Parameters_NotifyDirectory
   QueryFile         AS IO_Out_LOCATION_Parameters_QueryFile
   SetFile           AS IO_Out_LOCATION_Parameters_SetFile
   QueryEa           AS IO_Out_LOCATION_Parameters_QueryEa
   SetEa             AS IO_Out_LOCATION_Parameters_SetEa
   QueryVolume       AS IO_Out_LOCATION_Parameters_QueryVolume
   SetVolume         AS IO_Out_LOCATION_Parameters_SetVolume
   FileSystemControl AS IO_Out_LOCATION_Parameters_FileSystemControl
   LockControl       AS IO_Out_LOCATION_Parameters_LockControl
   DeviceIoControl   AS IO_Out_LOCATION_Parameters_DeviceIoControl
   QuerySecurity     AS IO_Out_LOCATION_Parameters_QuerySecurity
   SetSecurity       AS IO_Out_LOCATION_Parameters_SetSecurity
   MountVolume       AS IO_Out_LOCATION_Parameters_MountVolume
   VerifyVolume      AS IO_Out_LOCATION_Parameters_VerifyVolume
   Scsi              AS IO_Out_LOCATION_Parameters_Scsi
   QueryQuota        AS IO_Out_LOCATION_Parameters_QueryQuota
   SetQuota          AS IO_Out_LOCATION_Parameters_SetQuota
   QueryDeviceRelations AS IO_Out_LOCATION_Parameters_QueryDeviceRelations
   QueryInterface       AS IO_Out_LOCATION_Parameters_QueryInterface
   DeviceCapabilities   AS IO_Out_LOCATION_Parameters_DeviceCapabilities
   FilterResourceRequirements AS IO_Out_LOCATION_Parameters_FilterResourceRequirements
   ReadWriteConfig      AS IO_Out_LOCATION_Parameters_ReadWriteConfig
   SetLock              AS IO_Out_LOCATION_Parameters_SetLock
   QueryId              AS IO_Out_LOCATION_Parameters_QueryId
   QueryDeviceText      AS IO_Out_LOCATION_Parameters_QueryDeviceText
   UsageNotification    AS IO_Out_LOCATION_Parameters_UsageNotification
   WaitWake             AS IO_Out_LOCATION_Parameters_WaitWake
   PowerSequence        AS IO_Out_LOCATION_Parameters_PowerSequence
   Power                AS IO_Out_LOCATION_Parameters_Power
   StartDevice          AS IO_Out_LOCATION_Parameters_StartDevice
   WMI                  AS IO_Out_LOCATION_Parameters_WMI
   Others               AS IO_Out_LOCATION_Parameters_Others
END UNION

'2022-05-11 Fix By MOODSKY
type _IO_Out_LOCATION
   MajorFunction     as UCHAR
   MinorFunction     as UCHAR
   Flags             as UCHAR
   Control           as UCHAR
   Parameters        as IO_Out_LOCATION_Parameters
   DeviceObject      AS PDEVICE_OBJECT         '?????????????????????,????,????????????
   FileObject        AS PFILE_OBJECT           '???????????????????,???
   CompletionRoutine AS PIO_COMPLETION_ROUTINE '??????????????,????
   Context           AS PVOID                  '??context?????,?????CompletionRoutine
end type
'type IO_Out_LOCATION  as _IO_Out_LOCATION
'type PIO_Out_LOCATION as _IO_Out_LOCATION ptr



'2022-05-11 Fix By Moodsky------------------------------------
#define TIMER_TOLERABLE_DELAY_BITS      6
#define TIMER_EXPIRED_INDEX_BITS        6
#define TIMER_PROCESSOR_INDEX_BITS      5

'1 DUMMYUNIONNAME
union _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYUNIONNAME
   Lock   as LONG
   LockNV as LONG
end union


'2 DUMMYSTRUCTNAME
type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME
   Type       as UCHAR
   Signalling as UCHAR
   Size       as UCHAR
   Reserved1  as UCHAR   
end type


'3 DUMMYSTRUCTNAME2 Timer
type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2_DUMMYSTRUCTNAME
   Absolute:1 as UCHAR
   Wake:1     as UCHAR
   EncodedTolerableDelay:TIMER_TOLERABLE_DELAY_BITS as UCHAR
end type

type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2_DUMMYUNIONNAME_DUMMYSTRUCTNAME
   #Ifdef __FB_64BIT__
      TIndex:TIMER_EXPIRED_INDEX_BITS      as UCHAR
   #Else
      Index:1                              as UCHAR
      Processor:TIMER_PROCESSOR_INDEX_BITS as UCHAR       
   #EndIf  
   
   Inserted:1     as UCHAR
   Expired:1      as UCHAR     
end type
   
union _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2_DUMMYUNIONNAME
   TimerMiscFlags  as UCHAR
   DUMMYSTRUCTNAME as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2_DUMMYUNIONNAME_DUMMYSTRUCTNAME
end union

type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2
   TimerType            as UCHAR
   union 
      TimerControlFlags as UCHAR
      DUMMYSTRUCTNAME   as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2_DUMMYSTRUCTNAME
   end union

   Hand           as UCHAR
   DUMMYUNIONNAME as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2_DUMMYUNIONNAME
end type


'4 DUMMYSTRUCTNAME3 Timer2
type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME3_DUMMYUNIONNAME_DUMMYSTRUCTNAME
   Timer2Inserted:1      as UCHAR
   Timer2Expiring:1      as UCHAR
   Timer2curedPending:1 as UCHAR
   Timer2SetPending:1    as UCHAR
   Timer2Running:1       as UCHAR
   Timer2Disabled:1      as UCHAR
   Timer2ReservedFlags:2 as UCHAR            
end type

union _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME3_DUMMYUNIONNAME
   Timer2Flags     as UCHAR
   DUMMYSTRUCTNAME as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME3_DUMMYUNIONNAME_DUMMYSTRUCTNAME
end union

type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME3
   Timer2Type as UCHAR
   DUMMYUNIONNAME as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME3_DUMMYUNIONNAME
   Timer2ComponentId           as UCHAR
   Timer2RelativeId            as UCHAR   
end type


'5 DUMMYSTRUCTNAME4 Queue
type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME4_DUMMYUNIONNAME_DUMMYSTRUCTNAME
   Abandoned:1                 as UCHAR
   DisableIncrement:1          as UCHAR
   QueueReservedControlFlags:6 as UCHAR            
end type
   
union _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME4_DUMMYUNIONNAME
   QueueControlFlags  as UCHAR
   DUMMYSTRUCTNAME    as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME4_DUMMYUNIONNAME_DUMMYSTRUCTNAME
end union

type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME4
   QueueType                         as UCHAR
   DUMMYUNIONNAME as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME4_DUMMYUNIONNAME
   QueueSize                         as UCHAR
   QueueReserved                     as UCHAR         
end type


'6 DUMMYSTRUCTNAME5 Thread
type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME_DUMMYSTRUCTNAME
   CycleProfiling:1   as UCHAR
   CounterProfiling:1 as UCHAR
   GroupScheduling:1  as UCHAR
   AffinitySet:1      as UCHAR
   Tagged:1           as UCHAR
   EnergyProfiling:1  as UCHAR
   #Ifdef __FB_64BIT__
      ThreadReservedControlFlags:2 as UCHAR
   #Else
      Instrumented:1               as UCHAR
      ThreadReservedControlFlags:1 as UCHAR
   #EndIf      
end type

union _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME
   ThreadControlFlags    as UCHAR
   DUMMYSTRUCTNAME       as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME_DUMMYSTRUCTNAME
end union

type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME2_DUMMYSTRUCTNAME
   ActiveDR7:1    as BOOLEAN
   Instrumented:1 as BOOLEAN
   Minimal:1      as BOOLEAN
   Reserved4:3    as BOOLEAN
   UmsScheduled:1 as BOOLEAN
   UmsPrimary:1   as BOOLEAN
end type 

union _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME2
   DebugActive     as UCHAR
   DUMMYSTRUCTNAME as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME2_DUMMYSTRUCTNAME     
end union

type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5
   ThreadType               as UCHAR
   ThreadReserved           as UCHAR 
   DUMMYUNIONNAME  as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME
   DUMMYUNIONNAME2 as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5_DUMMYUNIONNAME2
end type


'7 DUMMYSTRUCTNAME6  Mutant
type _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME6
   MutantType     as UCHAR
   MutantSize     as UCHAR
   DpcActive      as BOOLEAN
   MutantReserved as UCHAR
end type

union _DISPATCHER_HEADER_DUMMYUNIONNAME
   DUMMYUNIONNAME   as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYUNIONNAME
   DUMMYSTRUCTNAME  as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME
   DUMMYSTRUCTNAME2 as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME2 'Timer
   DUMMYSTRUCTNAME3 as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME3 'Timer2
   DUMMYSTRUCTNAME4 as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME4 'Queue
   DUMMYSTRUCTNAME5 as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME5 'Thread
   DUMMYSTRUCTNAME6 as _DISPATCHER_HEADER_DUMMYUNIONNAME_DUMMYSTRUCTNAME6 'Mutant
end union


type _DISPATCHER_HEADER
   DUMMYUNIONNAME as _DISPATCHER_HEADER_DUMMYUNIONNAME
   SignalState    as LONG          'Object lock
   WaitListHead   as LIST_ENTRY    'Object lock 
end type

type DISPATCHER_HEADER as _DISPATCHER_HEADER
type PDISPATCHER_HEADER as _DISPATCHER_HEADER ptr
'------------------------------------


union IRP__AssociatedIrp
	MasterIrp    as PIRP
	IrpCount     as LONG
	SystemBuffer as PVOID
end union

type IRP__Overlay__AsynchronousParameters
   UNION
      UserApcRoutine as PIO_APC_ROUTINE
      IssuingProcess as PVOID
   END UNION
   
   UNION
      UserApcContext as PVOID
      IoRing         as PVOID '_IORING_OBJECT ptr |Can't Find _IORING_OBJECT Info!
   END UNION
end type

union IRP__Overlay
	AsynchronousParameters as IRP__Overlay__AsynchronousParameters
   AllocationSize as LARGE_INTEGER
end union

type IRP__Tail__Overlay
   UNION
      DeviceQueueEntry      as KDEVICE_QUEUE_ENTRY
      TYPE
         DriverContext(0 TO 3) as PVOID
      END TYPE
   END UNION
   
   Thread                as PETHREAD
   AuxiliaryBuffer       as PCHAR
   
   UNION
      TYPE
         ListEntry             as LIST_ENTRY
         UNION
            CurrentOutLocation  as IO_Out_LOCATION PTR
            PacketType            as ULONG
         END UNION
      END TYPE
   END UNION

   OriginalFileObject    as PFILE_OBJECT
end type

union IRP__Tail
	Overlay       as IRP__Tail__Overlay   
	Apc           as KAPC
	CompletionKey as PVOID
end union

'2022-05-09 Fix By Moodsky/rversteegen 
type _IRP
	Type            as _CSHORT
	Size            as USHORT
	MdlAddress      as PMDL
	Flags           as ULONG 
     
   AssociatedIrp   as IRP__AssociatedIrp 'UNION IRP__AssociatedIrp   
	ThreadListEntry as LIST_ENTRY
	IoStatus        as IO_STATUS_BLOCK
	RequestorMode   as KPROCESSOR_MODE
	PendingReturned as BOOLEAN
	OutCount      as CHAR
	CurrentLocation as CHAR
	cured          as BOOLEAN
	curedIrql      as KIRQL
	ApcEnvironment  as CCHAR
	AllocationFlags as UCHAR  
   
   UNION 
      UserIosb        as PIO_STATUS_BLOCK 'UNION NoName
      IoRingContext   as PVOID            'UNION NoName                
   END UNION
   
	UserEvent       as PKEVENT   
   Overlay         as IRP__Overlay     'UNION IRP__Overlay   
	curedRoutine   as PDRIVER_cured
	UserBuffer      as PVOID
   Tail            as IRP__Tail        'UNION IRP__Tail
end type
End

