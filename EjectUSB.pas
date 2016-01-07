Unit EjectUSB;

Interface

Uses
  Windows, SysUtils, Classes, Dialogs, ShlObj;

Const
  { BusTypeUnknown = $0000;
  BusTypeScsi = $0001;}
  BusTypeAtapi = $0002;
  BusTypeAta = $0003;
  BusType1394 = $0004;
  { BusTypeSsa = $0005;
  BusTypeFibre = $0006;}
  BusTypeUsb = $0007;
  { BusTypeRAID = $0008;
  BusTypeiSCSI = $0009;
  BusTypeSas = $000A;
  BusTypeSata = $000B;
  BusTypeSd = $000C;
  BusTypeMmc = $000D;
  BusTypeMax = $000E;
  BusTypeMaxReserved = $007F;}
  PNP_VetoTypeUnknown = $0000;
  { PNP_VetoLegacyDevice = $0001;
  PNP_VetoPendingClose = $0002;
  PNP_VetoWindowsApp = $0003;
  PNP_VetoWindowsService = $0004;
  PNP_VetoOutstandingOpen = $0005;
  PNP_VetoDevice = $0006;
  PNP_VetoDriver = $0007;
  PNP_VetoIllegalDeviceRequest = $0008;
  PNP_VetoInsufficientPower = $0009;
  PNP_VetoNonDisableable = $000A;
  PNP_VetoLegacyDriver = $000B;
  PNP_VetoInsufficientRights = $000C;}
  CR_SUCCESS = $00000000;
  { CR_DEFAULT = $00000001;
  CR_OUT_OF_MEMORY = $00000002;
  CR_INVALID_POINTER = $00000003;
  CR_INVALID_FLAG = $00000004;
  CR_INVALID_DEVNODE = $00000005;
  CR_INVALID_DEVINST = CR_INVALID_DEVNODE;
  CR_INVALID_RES_DES = $00000006;
  CR_INVALID_LOG_CONF = $00000007;
  CR_INVALID_ARBITRATOR = $00000008;
  CR_INVALID_NODELIST = $00000009;
  CR_DEVNODE_HAS_REQS = $0000000A;
  CR_DEVINST_HAS_REQS = CR_DEVNODE_HAS_REQS;
  CR_INVALID_RESOURCEID = $0000000B;
  CR_DLVXD_NOT_FOUND = $0000000C; // WIN 95 ONLY
  CR_NO_SUCH_DEVNODE = $0000000D;
  CR_NO_SUCH_DEVINST = CR_NO_SUCH_DEVNODE;
  CR_NO_MORE_LOG_CONF = $0000000E;
  CR_NO_MORE_RES_DES = $0000000F;
  CR_ALREADY_SUCH_DEVNODE = $00000010;
  CR_ALREADY_SUCH_DEVINST = CR_ALREADY_SUCH_DEVNODE;
  CR_INVALID_RANGE_LIST = $00000011;
  CR_INVALID_RANGE = $00000012;
  CR_FAILURE = $00000013;
  CR_NO_SUCH_LOGICAL_DEV = $00000014;
  CR_CREATE_BLOCKED = $00000015;
  CR_NOT_SYSTEM_VM = $00000016; // WIN 95 ONLY
  CR_REMOVE_VETOED = $00000017;
  CR_APM_VETOED = $00000018;
  CR_INVALID_LOAD_TYPE = $00000019;
  CR_BUFFER_SMALL = $0000001A;
  CR_NO_ARBITRATOR = $0000001B;
  CR_NO_REGISTRY_HANDLE = $0000001C;
  CR_REGISTRY_ERROR = $0000001D;
  CR_INVALID_DEVICE_ID = $0000001E;
  CR_INVALID_DATA = $0000001F;
  CR_INVALID_API = $00000020;
  CR_DEVLOADER_NOT_READY = $00000021;
  CR_NEED_RESTART = $00000022;
  CR_NO_MORE_HW_PROFILES = $00000023;
  CR_DEVICE_NOT_THERE = $00000024;
  CR_NO_SUCH_VALUE = $00000025;
  CR_WRONG_TYPE = $00000026;
  CR_INVALID_PRIORITY = $00000027;
  CR_NOT_DISABLEABLE = $00000028;
  CR_FREE_RESOURCES = $00000029;
  CR_QUERY_VETOED = $0000002A;
  CR_CANT_SHARE_IRQ = $0000002B;
  CR_NO_DEPENDENT = $0000002C;
  CR_SAME_RESOURCES = $0000002D;
  CR_NO_SUCH_REGISTRY_KEY = $0000002E;
  CR_INVALID_MACHINENAME = $0000002F; // NT ONLY
  CR_REMOTE_COMM_FAILURE = $00000030; // NT ONLY
  CR_MACHINE_UNAVAILABLE = $00000031; // NT ONLY
  CR_NO_CM_SERVICES = $00000032; // NT ONLY
  CR_ACCESS_DENIED = $00000033; // NT ONLY
  CR_CALL_NOT_IMPLEMENTED = $00000034;
  CR_INVALID_PROPERTY = $00000035;
  CR_DEVICE_INTERFACE_ACTIVE = $00000036;
  CR_NO_SUCH_DEVICE_INTERFACE = $00000037;
  CR_INVALID_REFERENCE_STRING = $00000038;
  CR_INVALID_CONFLICT_LIST = $00000039;
  CR_INVALID_INDEX = $0000003A;
  CR_INVALID_STRUCTURE_SIZE = $0000003B;
  NUM_CR_RESULTS = $0000003C;}
  { FILE_DEVICE_BEEP = $00000001;
  FILE_DEVICE_CD_ROM = $00000002;
  FILE_DEVICE_CD_ROM_FILE_SYSTEM = $00000003;
  FILE_DEVICE_CONTROLLER = $00000004;
  FILE_DEVICE_DATALINK = $00000005;
  FILE_DEVICE_DFS = $00000006;
  FILE_DEVICE_DISK = $00000007;
  FILE_DEVICE_DISK_FILE_SYSTEM = $00000008;
  FILE_DEVICE_FILE_SYSTEM = $00000009;
  FILE_DEVICE_INPORT_PORT = $0000000a;
  FILE_DEVICE_KEYBOARD = $0000000b;
  FILE_DEVICE_MAILSLOT = $0000000c;
  FILE_DEVICE_MIDI_IN = $0000000d;
  FILE_DEVICE_MIDI_OUT = $0000000e;
  FILE_DEVICE_MOUSE = $0000000f;
  FILE_DEVICE_MULTI_UNC_PROVIDER = $00000010;
  FILE_DEVICE_NAMED_PIPE = $00000011;
  FILE_DEVICE_NETWORK = $00000012;
  FILE_DEVICE_NETWORK_BROWSER = $00000013;
  FILE_DEVICE_NETWORK_FILE_SYSTEM = $00000014;
  FILE_DEVICE_NULL = $00000015;
  FILE_DEVICE_PARALLEL_PORT = $00000016;
  FILE_DEVICE_PHYSICAL_NETCARD = $00000017;
  FILE_DEVICE_PRINTER = $00000018;
  FILE_DEVICE_SCANNER = $00000019;
  FILE_DEVICE_SERIAL_MOUSE_PORT = $0000001a;
  FILE_DEVICE_SERIAL_PORT = $0000001b;
  FILE_DEVICE_SCREEN = $0000001c;
  FILE_DEVICE_SOUND = $0000001d;
  FILE_DEVICE_STREAMS = $0000001e;
  FILE_DEVICE_TAPE = $0000001f;
  FILE_DEVICE_TAPE_FILE_SYSTEM = $00000020;
  FILE_DEVICE_TRANSPORT = $00000021;
  FILE_DEVICE_UNKNOWN = $00000022;
  FILE_DEVICE_VIDEO = $00000023;
  FILE_DEVICE_VIRTUAL_DISK = $00000024;
  FILE_DEVICE_WAVE_IN = $00000025;
  FILE_DEVICE_WAVE_OUT = $00000026;
  FILE_DEVICE_8042_PORT = $00000027;
  FILE_DEVICE_NETWORK_REDIRECTOR = $00000028;
  FILE_DEVICE_BATTERY = $00000029;
  FILE_DEVICE_BUS_EXTENDER = $0000002a;
  FILE_DEVICE_MODEM = $0000002b;
  FILE_DEVICE_VDM = $0000002c;
  FILE_DEVICE_MASS_STORAGE = $0000002d;
  FILE_DEVICE_SMB = $0000002e;
  FILE_DEVICE_KS = $0000002f;
  FILE_DEVICE_CHANGER = $00000030;
  FILE_DEVICE_SMARTCARD = $00000031;
  FILE_DEVICE_ACPI = $00000032;
  FILE_DEVICE_DVD = $00000033;
  FILE_DEVICE_FULLSCREEN_VIDEO = $00000034;
  FILE_DEVICE_DFS_FILE_SYSTEM = $00000035;
  FILE_DEVICE_DFS_VOLUME = $00000036;}
  DIGCF_PRESENT = $00000002;
  DIGCF_DEVICEINTERFACE = $00000010;
  GUID_DEVINTERFACE_FLOPPY:TGUID = (D1:$53F56311; D2:$B6BF; D3:$11D0; D4:($94, $F2, $00, $A0, $C9, $1E, $FB, $8B));
  GUID_DEVINTERFACE_DISK:TGUID = (D1:$53F56307; D2:$B6BF; D3:$11D0; D4:($94, $F2, $00, $A0, $C9, $1E, $FB, $8B));
  GUID_DEVINTERFACE_CDROM:TGUID = (D1:$53F56308; D2:$B6BF; D3:$11D0; D4:($94, $F2, $00, $A0, $C9, $1E, $FB, $8B));
  IOCTL_STORAGE_GET_DEVICE_NUMBER = (($0000002D Shl 16) Or ($0000 Shl 14) Or ($0420 Shl 2) Or 0);
  IOCTL_STORAGE_GET_HOTPLUG_INFO = (($0000002D Shl 16) Or ($0000 Shl 14) Or ($0305 Shl 2) Or 0);
  IOCTL_STORAGE_MEDIA_REMOVAL = (($0000002D Shl 16) Or ($0001 Shl 14) Or ($0201 Shl 2) Or 0);
  IOCTL_STORAGE_EJECT_MEDIA = (($0000002D Shl 16) Or ($0001 Shl 14) Or ($0202 Shl 2) Or 0);
  IOCTL_STORAGE_CHECK_VERIFY = (($0000002D Shl 16) Or ($0001 Shl 14) Or ($0200 Shl 2) Or 0);
  IOCTL_STORAGE_EJECTION_CONTROL = (($0000002D Shl 16) Or ($0000 Shl 14) Or ($0250 Shl 2) Or 0);
  IOCTL_STORAGE_QUERY_PROPERTY = (($0000002D Shl 16) Or ($0000 Shl 14) Or ($0500 Shl 2) Or 0);
  { IOCTL_STORAGE_SET_HOTPLUG_INFO = (($0000002d shl 16) or (($0001 or $0002) shl 14) or ($0306 shl 2) or 0);
  IOCTL_STORAGE_LOAD_MEDIA = (($0000002d shl 16) or ($0001 shl 14) or ($0203 shl 2) or 0);
  IOCTL_STORAGE_RESERVE = (($0000002d shl 16) or ($0001 shl 14) or ($0204 shl 2) or 0);
  IOCTL_STORAGE_RELEASE = (($0000002d shl 16) or ($0001 shl 14) or ($0205 shl 2) or 0);
  IOCTL_STORAGE_FIND_NEW_DEVICES = (($0000002d shl 16) or ($0001 shl 14) or ($0206 shl 2) or 0);
  IOCTL_STORAGE_GET_MEDIA_TYPES = (($0000002d shl 16) or ($0000 shl 14) or ($0300 shl 2) or 0);
  IOCTL_STORAGE_GET_MEDIA_TYPES_EX = (($0000002d shl 16) or ($0000 shl 14) or ($0301 shl 2) or 0);
  IOCTL_STORAGE_RESET_BUS = (($0000002d shl 16) or ($0001 shl 14) or ($0400 shl 2) or 0);
  IOCTL_STORAGE_RESET_DEVICE = (($0000002d shl 16) or ($0001 shl 14) or ($0401 shl 2) or 0);}
  FSCTL_LOCK_VOLUME = (($00000009 Shl 16) Or ($0000 Shl 14) Or (00006 Shl 2) Or 0);
  FSCTL_DISMOUNT_VOLUME = (($00000009 Shl 16) Or ($0000 Shl 14) Or (00008 Shl 2) Or 0);
  FSCTL_UNLOCK_VOLUME = (($00000009 Shl 16) Or ($0000 Shl 14) Or (00007 Shl 2) Or 0);
Type
  PPNP_VETO_TYPE = ^PNP_VETO_TYPE;
  PNP_VETO_TYPE = DWORD;
  PDEVINST = ^DEVINST;
  DEVINST = DWORD;
  PRETURN_TYPE = ^RETURN_TYPE;
  RETURN_TYPE = DWORD;
  PCONFIGRET = ^CONFIGRET;
  CONFIGRET = RETURN_TYPE;
  PHDEVINFO = ^HDEVINFO;
  HDEVINFO = Pointer;
  PDEVICE_TYPE = ^DEVICE_TYPE;
  DEVICE_TYPE = DWORD;
  PSTORAGE_BUS_TYPE = ^STORAGE_BUS_TYPE;
  STORAGE_BUS_TYPE = DWORD;
  PULONG_PTR = ^ULONG_PTR;
  ULONG_PTR = LONGWORD;
  PPTSTR = ^LPWSTR;
  PTSTR = LPWSTR;
  PSPDeviceInterfaceData = ^TSPDeviceInterfaceData;
  SP_DEVICE_INTERFACE_DATA = Packed Record
    cbSize:DWORD;
    InterfaceClassGuid:TGUID;
    Flags:DWORD;
    Reserved:ULONG_PTR;
  End;
  TSPDeviceInterfaceData = SP_DEVICE_INTERFACE_DATA;
  PSPDevInfoData = ^TSPDevInfoData;
  SP_DEVINFO_DATA = Packed Record
    cbSize:DWORD;
    ClassGuid:TGUID;
    DevInst:DWORD;
    Reserved:ULONG_PTR;
  End;
  TSPDevInfoData = SP_DEVINFO_DATA;
  PSPDeviceInterfaceDetailDataA = ^TSPDeviceInterfaceDetailDataA;
  PSPDeviceInterfaceDetailDataW = ^TSPDeviceInterfaceDetailDataW;
  SP_DEVICE_INTERFACE_DETAIL_DATA_A = Packed Record
    cbSize:DWORD;
    DevicePath:Array[0..0] Of AnsiChar;
  End;
  SP_DEVICE_INTERFACE_DETAIL_DATA_W = Packed Record
    cbSize:DWORD;
    DevicePath:Array[0..0] Of WideChar;
  End;
  TSPDeviceInterfaceDetailDataA = SP_DEVICE_INTERFACE_DETAIL_DATA_A;
  TSPDeviceInterfaceDetailDataW = SP_DEVICE_INTERFACE_DETAIL_DATA_W;
  {$IFDEF UNICODE}
  TSPDeviceInterfaceDetailData = TSPDeviceInterfaceDetailDataW;
  PSPDeviceInterfaceDetailData = PSPDeviceInterfaceDetailDataW;
  {$ELSE}
  TSPDeviceInterfaceDetailData = TSPDeviceInterfaceDetailDataA;
  PSPDeviceInterfaceDetailData = PSPDeviceInterfaceDetailDataA;
  {$ENDIF UNICODE}
  PSTORAGE_DEVICE_NUMBER = ^TSTORAGE_DEVICE_NUMBER;
  STORAGE_DEVICE_NUMBER = Record
    DeviceType:DEVICE_TYPE;
    DeviceNumber:DWORD;
    PartitionNumber:DWORD;
  End;
  TSTORAGE_DEVICE_NUMBER = STORAGE_DEVICE_NUMBER;
  DEV_BROADCAST_HDR = ^PDEV_BROADCAST_HDR;
  PDEV_BROADCAST_HDR = Packed Record
    dbch_size:DWORD;
    dbch_devicetype:DWORD;
    dbch_reserved:DWORD;
  End;
  DEV_BROADCAST_VOLUME = ^PDEV_BROADCAST_VOLUME;
  PDEV_BROADCAST_VOLUME = Packed Record
    dbcv_size:DWORD;
    dbcv_devicetype:DWORD;
    dbcv_reserved:DWORD;
    dbcv_unitmask:DWORD;
    dbcv_flags:WORD;
  End;
  PSTORAGE_HOTPLUG_INFO = ^TSTORAGE_HOTPLUG_INFO;
  STORAGE_HOTPLUG_INFO = Packed Record
    Size:DWORD;
    MediaRemovable:BOOLEAN;
    MediaHotplug:BOOLEAN;
    DeviceHotplug:BOOLEAN;
    WriteCacheEnableOverride:BOOLEAN;
  End;
  TSTORAGE_HOTPLUG_INFO = STORAGE_HOTPLUG_INFO;
  PSTORAGE_PROPERTY_QUERY = ^TSTORAGE_PROPERTY_QUERY;
  STORAGE_PROPERTY_QUERY = Packed Record
    PropertyId:DWORD;
    QueryType:DWORD;
    AdditionalParameters:Array[0..3] Of Byte;
  End;
  TSTORAGE_PROPERTY_QUERY = STORAGE_PROPERTY_QUERY;
  PSTORAGE_DEVICE_DESCRIPTOR = ^TSTORAGE_DEVICE_DESCRIPTOR;
  STORAGE_DEVICE_DESCRIPTOR = Packed Record
    Version:ULONG;
    Size:ULONG;
    DeviceType:Byte;
    DeviceTypeModifier:Byte;
    RemovableMedia:Boolean;
    CommandQueueing:Boolean;
    VendorIdOffset:ULONG;
    ProductIdOffset:ULONG;
    ProductRevisionOffset:ULONG;
    SerialNumberOffset:ULONG;
    BusType:STORAGE_BUS_TYPE;
    RawPropertiesLength:ULONG;
    RawDeviceProperties:Array[0..MAX_PATH] Of Byte;
  End;
  TSTORAGE_DEVICE_DESCRIPTOR = STORAGE_DEVICE_DESCRIPTOR;
  { PSTORAGE_BUS_RESET_REQUEST = ^TSTORAGE_BUS_RESET_REQUEST;
  STORAGE_BUS_RESET_REQUEST = packed record
  PathId : Byte;
  end;
  TSTORAGE_BUS_RESET_REQUEST = STORAGE_BUS_RESET_REQUEST;
  STORAGE_MEDIA_TYPE = DWORD;
  PDEVICE_MEDIA_INFO = ^TDEVICE_MEDIA_INFO;
  DEVICE_MEDIA_INFO = packed record
  DeviceSpecific : packed record
  case BYTE of
  0 :(DiskInfo : packed record
  Cylinders : LARGE_INTEGER;
  MediaType : STORAGE_MEDIA_TYPE;
  TracksPerCylinder : DWORD;//ULONG
  SectorsPerTrack : DWORD;
  BytesPerSector : DWORD;
  NumberMediaSides : DWORD;
  MediaCharacteristics: DWORD;
  end );
  1 :(RemovableDiskInfo : packed record
  Cylinders : LARGE_INTEGER;
  MediaType : STORAGE_MEDIA_TYPE;
  TracksPerCylinder : DWORD;
  SectorsPerTrack : DWORD;
  BytesPerSector : DWORD;
  NumberMediaSides : DWORD;
  MediaCharacteristics: DWORD;
  end );
  2 :(TapeInfo : packed record
  MediaType : STORAGE_MEDIA_TYPE;
  MediaCharacteristics: DWORD;
  CurrentBlockSize : DWORD;
  BusType : STORAGE_BUS_TYPE;
  BusSpecificData : packed record
  case INTEGER of
  0 :(ScsiInformation : packed record
  MediumType : BYTE;//UCHAR
  DensityCode : BYTE;
  end );
  end;
  end );
  end;
  end;
  TDEVICE_MEDIA_INFO = DEVICE_MEDIA_INFO;
  PGET_MEDIA_TYPES = ^TGET_MEDIA_TYPES;
  GET_MEDIA_TYPES = packed record
  DeviceType : DWORD;
  MediaInfoCount : DWORD;
  MediaInfo : array [0..0] of DEVICE_MEDIA_INFO;
  end;
  TGET_MEDIA_TYPES = GET_MEDIA_TYPES;}
  TDrive = Packed Record
    Volume:String;
    VolumeName:String;
    TailleLib:String;
    TailleTot:String;
    SystFich:String;
    Properties:String;
    DeviceType:DWORD;
    BusType:STORAGE_BUS_TYPE;
    MediaRemovable:BOOLEAN;
    MediaHotplug:BOOLEAN;
    DeviceHotplug:BOOLEAN;
    Partition:Integer;
  End;
  TPREVENT_MEDIA_REMOVAL = Record
    PreventMediaRemoval:ByteBool;
  End;
Function SetupDiDestroyDeviceInfoList(DeviceInfoSet:HDEVINFO):BOOL; stdcall; external 'SetupApi.dll';
Function SetupDiEnumDeviceInterfaces(DeviceInfoSet:HDEVINFO; DeviceInfoData:PSPDevInfoData;
  Const InterfaceClassGuid:TGUID; MemberIndex:DWORD; Var DeviceInterfaceData:TSPDeviceInterfaceData):BOOL; stdcall; external 'SetupApi.dll';
Function CM_Get_Parent(Var dnDevInstParent:DEVINST; dnDevInst:DEVINST; ulFlags:ULONG):CONFIGRET; stdcall; external 'CfgMgr32.dll';
Function CM_Query_And_Remove_SubTreeW(dnAncestor:DEVINST; pVetoType:PPNP_VETO_TYPE; pszVetoName:PWideChar;
  ulNameLength:ULONG; ulFlags:ULONG):CONFIGRET; stdcall;
Function CM_Query_And_Remove_SubTreeA(dnAncestor:DEVINST; pVetoType:PPNP_VETO_TYPE; pszVetoName:PAnsiChar;
  ulNameLength:ULONG; ulFlags:ULONG):CONFIGRET; stdcall;
Function CM_Query_And_Remove_SubTree(dnAncestor:DEVINST; pVetoType:PPNP_VETO_TYPE; pszVetoName:PTSTR;
  ulNameLength:ULONG; ulFlags:ULONG):CONFIGRET; stdcall;
Function CM_Request_Device_EjectW(dnDevInst:DEVINST; pVetoType:PPNP_VETO_TYPE; pszVetoName:PWideChar;
  ulNameLength:ULONG; ulFlags:ULONG):CONFIGRET; stdcall;
Function CM_Request_Device_EjectA(dnDevInst:DEVINST; pVetoType:PPNP_VETO_TYPE; pszVetoName:PAnsiChar;
  ulNameLength:ULONG; ulFlags:ULONG):CONFIGRET; stdcall;
Function CM_Request_Device_Eject(dnDevInst:DEVINST; pVetoType:PPNP_VETO_TYPE; pszVetoName:PTSTR;
  ulNameLength:ULONG; ulFlags:ULONG):CONFIGRET; stdcall;
Function SetupDiGetClassDevsW(ClassGuid:PGUID; Const Enumerator:PWideChar; hwndParent:HWND; Flags:DWORD):HDEVINFO; stdcall;
Function SetupDiGetClassDevsA(ClassGuid:PGUID; Const Enumerator:PAnsiChar; hwndParent:HWND; Flags:DWORD):HDEVINFO; stdcall;
Function SetupDiGetClassDevs(ClassGuid:PGUID; Const Enumerator:PTSTR; hwndParent:HWND; Flags:DWORD):HDEVINFO; stdcall;
Function SetupDiGetDeviceInterfaceDetailW(DeviceInfoSet:HDEVINFO; DeviceInterfaceData:PSPDeviceInterfaceData;
  DeviceInterfaceDetailData:PSPDeviceInterfaceDetailData; DeviceInterfaceDetailDataSize:DWORD;
  Var RequiredSize:DWORD; Device:PSPDevInfoData):BOOL; stdcall;
Function SetupDiGetDeviceInterfaceDetailA(DeviceInfoSet:HDEVINFO; DeviceInterfaceData:PSPDeviceInterfaceData;
  DeviceInterfaceDetailData:PSPDeviceInterfaceDetailData; DeviceInterfaceDetailDataSize:DWORD;
  Var RequiredSize:DWORD; Device:PSPDevInfoData):BOOL; stdcall;
Function SetupDiGetDeviceInterfaceDetail(DeviceInfoSet:HDEVINFO; DeviceInterfaceData:PSPDeviceInterfaceData;
  DeviceInterfaceDetailData:PSPDeviceInterfaceDetailData; DeviceInterfaceDetailDataSize:DWORD;
  Var RequiredSize:DWORD; Device:PSPDevInfoData):BOOL; stdcall;
{ function CM_Reenumerate_DevNode(dnDevInst: DEVINST;ulFlags: ULONG): CONFIGRET; stdcall;external 'CfgMgr32.dll';
function GetVolumeNameForVolumeMountPointW(lpszVolumeMountPoint: LPCWSTR;
lpszVolumeName: LPWSTR; cchBufferLength: DWORD): BOOL; stdcall;external 'kernel32.dll';
function SetupDiGetInterfaceDeviceDetailW(DeviceInfoSet:HDEVINFO;DeviceInterfaceData:PSPDeviceInterfaceData;
DeviceInterfaceDetailData:PSPDeviceInterfaceDetailDataW;DeviceInterfaceDetailDataSize:DWORD;RequiredSize:PDWORD;
Device:PSPDevInfoData):BOOL;stdcall;external 'SetupApi.dll';}
Function DeviceNumberDrive(DeviceNumber:Integer; DriveType:UINT; szDosDeviceName:PCHAR):DEVINST;
Function Eject_USB(LetVol:Char; Rep, TempRep:Integer; MessageEject, MultiSupport:Boolean):Boolean; stdcall;
Function Eject_DevHotPlugMedia(LetVol:Char; Rep, TempRep:Integer; MessageEject, MediaRemove:Boolean):Boolean;
Function Eject_DevHotPlug(LetVol:Char; Rep, TempRep:Integer; MessageEject, RemoveMediaHotPlug:Boolean):Boolean;
Procedure Liste_USB(Lecteurs:TStrings; DriveRemovable, DriveFixed, DriveCDRom:Boolean); stdcall;
Implementation
Const
  {$IFDEF UNICODE}
  LettreFin = 'W';
  {$ELSE}
  LettreFin = 'A';
  {$ENDIF UNICODE}
Var
  Drive:TDrive;
  //Partie ejection peripherique

Function DeviceNumberDrive(DeviceNumber:Integer; DriveType:UINT; szDosDeviceName:PCHAR):DEVINST;
Var
  IsFloppy:Boolean;
  BoucWh:Boolean;
  ValGUID:TGUID;
  ValHDevInfo:HDEVINFO;
  hDrive:THandle;
  dwIndex, dwSize, dwBytesReturned:DWORD;
  FunctionResult:Boolean;
  SPDeviceInterfaceDetailData:PSPDeviceInterfaceDetailData;
  SPDeviceInterfaceData:SP_DEVICE_INTERFACE_DATA;
  SPDevInfoData:SP_DEVINFO_DATA;
  StorageDeviceNumber:STORAGE_DEVICE_NUMBER;
Begin
  Result := 0;
  IsFloppy := true;
  If StrPos(szDosDeviceName, '\Floppy') = Nil Then
    IsFloppy := false;
  Case (DriveType) Of
    DRIVE_REMOVABLE:If (IsFloppy) Then
        Begin
          ValGUID := GUID_DEVINTERFACE_FLOPPY;
        End
      Else
        Begin
          ValGUID := GUID_DEVINTERFACE_DISK;
        End;
    DRIVE_FIXED:ValGUID := GUID_DEVINTERFACE_DISK;
    DRIVE_CDROM:ValGUID := GUID_DEVINTERFACE_CDROM;
  Else
    exit;
  End;
  ValHDevInfo := SetupDiGetClassDevs(@ValGUID, Nil, 0, DIGCF_PRESENT Or DIGCF_DEVICEINTERFACE);
  If (Cardinal(ValHDevInfo) = INVALID_HANDLE_VALUE) Then
    exit;
  dwIndex := 0;
  ZeroMemory(@SPDevInfoData, SizeOf(SPDevInfoData));
  SPDeviceInterfaceData.cbSize := SizeOf(SPDeviceInterfaceData);
  BoucWh := True;
  While (BoucWh = true) Do
    Begin
      FunctionResult := SetupDiEnumDeviceInterfaces(ValHDevInfo, Nil, ValGUID, dwIndex, SPDeviceInterfaceData);
      If FunctionResult = False Then
        break;
      dwSize := 0;
      SetupDiGetDeviceInterfaceDetail(ValHDevInfo, @SPDeviceInterfaceData, Nil, 0, dwSize, Nil);
      If (dwSize <> 0) And (dwSize <= 1024) Then
        Begin
          GetMem(SPDeviceInterfaceDetailData, dwSize);
          Try
            SPDeviceInterfaceDetailData.cbSize := SizeOf(SPDeviceInterfaceDetailData^);
            ZeroMemory(@SPDevInfoData, SizeOf(SPDevInfoData));
            SPDevInfoData.cbSize := SizeOf(SPDevInfoData);
            FunctionResult := SetupDiGetDeviceInterfaceDetail(ValHDevInfo, @SPDeviceInterfaceData, SPDeviceInterfaceDetailData, dwSize, dwSize, @SPDevInfoData);
            If FunctionResult Then
              Begin
                hDrive := DWORD(-1);
                Try
                  hDrive := CreateFile(SPDeviceInterfaceDetailData.DevicePath, 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
                  If (hDrive <> INVALID_HANDLE_VALUE) Then
                    Begin
                      dwBytesReturned := 0;
                      FunctionResult := DeviceIoControl(hDrive, IOCTL_STORAGE_GET_DEVICE_NUMBER, Nil, 0, @StorageDeviceNumber, SizeOf(StorageDeviceNumber), dwBytesReturned, Nil);
                      If FunctionResult Then
                        Begin
                          If DeviceNumber = LongInt(StorageDeviceNumber.DeviceNumber) Then
                            Begin
                              Result := SPDevInfoData.DevInst;
                              break;
                            End;
                        End;
                    End;
                Finally
                  CloseHandle(hDrive);
                End;
              End;
          Finally
            FreeMem(SPDeviceInterfaceDetailData);
          End;
        End;
      dwIndex := dwIndex + 1;
    End;
  SetupDiDestroyDeviceInfoList(ValHDevInfo);
End;

Function Eject_DevHotPlug(LetVol:Char; Rep, TempRep:Integer; MessageEject, RemoveMediaHotPlug:Boolean):Boolean;
Var
  DeviceNumber:LongInt;
  dwBytesReturned:DWord;
  DriveType:UINT;
  hVolume:THandle;
  StorageDeviceNumber:STORAGE_DEVICE_NUMBER;
  I:Integer;
  ResultInt:DWORD;
  ResultIntNod:DWORD;
  ResultBool:Boolean;
  DeviceInst:DEVINST;
  DevInstParent:DEVINST;
  szDosDeviceName:Array[0..MAX_PATH] Of Char;
  VetoType:PNP_VETO_TYPE;
  VetoNameW:Array[0..MAX_PATH] Of WChar;
Begin
  Result := False;
  DeviceNumber := -1;
  hVolume := INVALID_HANDLE_VALUE;
  Try
    hVolume := CreateFile(PChar('\\.\' + LetVol + ':'), 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
    If hVolume = INVALID_HANDLE_VALUE Then
      exit;
    dwBytesReturned := 0;
    ResultBool := DeviceIoControl(hVolume, IOCTL_STORAGE_GET_DEVICE_NUMBER, Nil, 0, @StorageDeviceNumber, SizeOf(StorageDeviceNumber), dwBytesReturned, Nil);
    If ResultBool = True Then
      DeviceNumber := StorageDeviceNumber.DeviceNumber;
  Finally
    CloseHandle(hVolume);
  End;
  If DeviceNumber = -1 Then
    exit;
  DriveType := GetDriveType(PChar(String(LetVol + ':')));
  szDosDeviceName[0] := #0;
  ResultInt := QueryDosDevice(PChar(String(LetVol + ':')), szDosDeviceName, MAX_PATH);
  If ResultInt = 0 Then
    exit;
  DeviceInst := DeviceNumberDrive(DeviceNumber, DriveType, szDosDeviceName);
  If DeviceInst = 0 Then
    exit;
  VetoType := PNP_VetoTypeUnknown;
  VetoNameW[0] := #0;
  DevInstParent := 0;
  // http://msdn.microsoft.com/en-us/library/ms791198.aspx
  CM_Get_Parent(DevInstParent, DeviceInst, 0);
  If Not RemoveMediaHotPlug Then
    Begin
      For I := 0 To Rep - 1 Do
        Begin
          VetoNameW[0] := #0;
          // http://msdn.microsoft.com/en-us/library/ms790831.aspx
          If MessageEject Then
            ResultInt := CM_Request_Device_Eject(DevInstParent, Nil, Nil, 0, 0)
          Else
            ResultInt := CM_Request_Device_Eject(DevInstParent, @VetoType, VetoNameW, MAX_PATH, 0);
          If (ResultInt = CR_SUCCESS) And (VetoType = PNP_VetoTypeUnknown) Then
            Begin
              Result := True;
              Break;
            End;
          Sleep(TempRep);
        End;
    End
  Else
    Begin // if CM_Request_Device_Eject(DevInstParent,@VetoType,VetoNameW,MAX_PATH,0)=CR_REMOVE_VETOED then CM_Query_And_Remove_SubTree(DeviceInst,nil,nil,0,0);
      For I := 0 To Rep - 1 Do
        Begin
          VetoNameW[0] := #0;
          // http://msdn.microsoft.com/en-us/library/ms790877.aspx
          If MessageEject Then
            ResultIntNod := CM_Query_And_Remove_SubTree(DeviceInst, Nil, Nil, 0, 0)
          Else
            ResultIntNod := CM_Query_And_Remove_SubTree(DeviceInst, @VetoType, VetoNameW, MAX_PATH, 0);
          If (ResultIntNod = CR_SUCCESS) And (VetoType = PNP_VetoTypeUnknown) Then
            Begin
              Result := True;
              If MessageEject Then
                MessageDlg('Le matériel peut-être retiré en toute sécurité !', mtInformation, [mbOK], 0);
              Break;
            End;
          Sleep(TempRep);
        End;
    End;
End;

Function Eject_DevHotPlugMedia(LetVol:Char; Rep, TempRep:Integer; MessageEject, MediaRemove:Boolean):Boolean;
Var
  HVolume:THandle;
  lpBytesReturned:DWORD;
  PreventRemoval:TPREVENT_MEDIA_REMOVAL;
  FormatLettreLecteur:String;
  I:Integer;
Begin
  Result := False;
  hVolume := INVALID_HANDLE_VALUE;
  Try
    hVolume := CreateFile(PChar('\\.\' + LetVol + ':'), FILE_SHARE_READ Or FILE_SHARE_WRITE, 0, Nil, OPEN_EXISTING, 0, 0);
    If hVolume = INVALID_HANDLE_VALUE Then
      hVolume := CreateFile(PChar('\\.\' + LetVol + ':'), GENERIC_READ, 0, Nil, OPEN_EXISTING, 0, 0);
    If hVolume = INVALID_HANDLE_VALUE Then
      hVolume := CreateFile(PChar('\\.\' + LetVol + ':'), 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
    If hVolume = INVALID_HANDLE_VALUE Then
      exit;
    For I := 0 To Rep - 1 Do
      Begin
        PreventRemoval.PreventMediaRemoval := False;
        If DeviceIoControl(hVolume, FSCTL_LOCK_VOLUME, Nil, 0, Nil, 0, lpBytesReturned, Nil) Then //Vérrouillage volume
          If DeviceIoControl(hVolume, FSCTL_DISMOUNT_VOLUME, Nil, 0, Nil, 0, lpBytesReturned, Nil) Then //Démontage du volume
            If DeviceIoControl(hVolume, IOCTL_STORAGE_MEDIA_REMOVAL, @PreventRemoval, SizeOf(TPREVENT_MEDIA_REMOVAL), Nil, 0, lpBytesReturned, Nil) Then //Control du volume
              If DeviceIoControl(hVolume, IOCTL_STORAGE_EJECT_MEDIA, Nil, 0, Nil, 0, lpBytesReturned, Nil) Then //Ejection du volume
                If DeviceIoControl(hVolume, FSCTL_UNLOCK_VOLUME, Nil, 0, Nil, 0, lpBytesReturned, Nil) Then //Déverrouillage du volume
                  Begin
                    FormatLettreLecteur := Format('%s:\', [Uppercase(LetVol)]);
                    // Avertir le système que l'USB est demonter
                    ShChangeNotify(SHCNE_MEDIAREMOVED, SHCNF_PATH, PChar(FormatLettreLecteur), Nil);
                    Result := True;
                    If (MessageEject) And (Not MediaRemove) Then
                      MessageDlg('设备可以安全删除！', mtInformation, [mbOK], 0);
                    If (MessageEject) And (MediaRemove) Then
                      MessageDlg('驱动器已打开!', mtInformation, [mbOK], 0);
                    Break;
                  End;
        If Not Result Then
          Sleep(TempRep);
      End;
  Finally
    CloseHandle(hVolume);
  End;
  If (Not Result) And (MessageEject) And (MediaRemove) Then
    MessageDlg('其他进程占用!', mtWarning, [mbOK], 0);
  If (Not Result) And (Not MediaRemove) Then
    Eject_DevHotPlug(LetVol, Rep, TempRep, MessageEject, False);
End;

Function Eject_USB(LetVol:Char; Rep, TempRep:Integer; MessageEject, MultiSupport:Boolean):Boolean;
Var
  hVolume:THandle;
  GetMediaTypes:STORAGE_HOTPLUG_INFO;
  lpBytesReturned:DWORD;
Begin
  Result := False;
  hVolume := INVALID_HANDLE_VALUE;
  Try
    hVolume := CreateFile(PChar('\\.\' + LetVol + ':'), 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
    If hVolume = INVALID_HANDLE_VALUE Then
      exit;
    DeviceIoControl(hVolume, IOCTL_STORAGE_GET_HOTPLUG_INFO, Nil, 0, @GetMediaTypes, sizeof(GetMediaTypes), lpBytesReturned, Nil);
  Finally
    CloseHandle(hVolume);
  End;
  If (GetMediaTypes.DeviceHotplug) And (GetMediaTypes.MediaRemovable) And (MultiSupport = False) Then //support usb standard...
    Begin
      If Eject_DevHotPlugMedia(LetVol, Rep, TempRep, MessageEject, False) Then
        Result := True;
    End
  Else If GetMediaTypes.DeviceHotplug Then //support disque usb...
    Begin
      If Eject_DevHotPlug(LetVol, Rep, TempRep, MessageEject, False) Then
        Result := True;
    End
  Else If (GetMediaTypes.MediaRemovable) And (GetMediaTypes.MediaHotplug) Then //support lecteur carte interne...
    Begin
      If Eject_DevHotPlug(LetVol, Rep, TempRep, MessageEject, True) Then
        Result := True;
    End
  Else If GetMediaTypes.MediaRemovable Then //support cd/dvd...
    Begin
      If Eject_DevHotPlugMedia(LetVol, Rep, TempRep, MessageEject, True) Then
        Result := True;
    End
  Else
    MessageDlg('内置驱动器无法弹出!', mtWarning, [mbOK], 0); //Disque dur
End;

{
Function GetVolumeNameForVolumeMountPointString(LetVol:Char):String;
Var
  Volume:Array[0..MAX_PATH] Of Char;
Begin
  If GetDriveType(PChar(Format('%s:\', [Uppercase(LetVol)]))) = DRIVE_REMOVABLE Then
    Begin
      FillChar(Volume[0], SizeOf(Volume), 0);
      GetVolumeNameForVolumeMountPointW(PChar(Format('%s:\', [Uppercase(LetVol)])), @Volume[0], SizeOf(Volume));
      Result := Volume;
    End;
End;
}
//Partie informations peripherique

Procedure StorageDeviceNumberString(Disque:String);
Var
  HFile:THandle;
  lpBytesReturned:DWORD;
  StorageDeviceNumber:STORAGE_DEVICE_NUMBER;
Begin
  Drive.DeviceType := 0;
  Drive.Partition := 0;
  HFile := INVALID_HANDLE_VALUE;
  Try
    HFile := CreateFile(PChar('\\.\' + Disque), 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
    If HFile <> INVALID_HANDLE_VALUE Then
      Begin
        DeviceIoControl(HFile, IOCTL_STORAGE_GET_DEVICE_NUMBER, Nil, 0, @StorageDeviceNumber, SizeOf(StorageDeviceNumber), lpBytesReturned, Nil);
        Drive.DeviceType := StorageDeviceNumber.DeviceType;
        Drive.Partition := StorageDeviceNumber.PartitionNumber;
      End;
  Finally
    CloseHandle(HFile);
  End;
End;
{Procedure StorageMediaTypeString(Disque:String);
var
HFile : THandle;
lpBytesReturned : DWORD;
StorageMediaType : GET_MEDIA_TYPES;
MediaTypes : PGET_MEDIA_TYPES;
Buffer : Array[0..2047] of Byte;
Result : String;
begin
Result:='';
HFile:=INVALID_HANDLE_VALUE;
try
HFile:=CreateFile(PChar('\\.\'+Disque),0,FILE_SHARE_READ or FILE_SHARE_WRITE,nil,OPEN_EXISTING,0,0);
if HFile<>INVALID_HANDLE_VALUE then
begin
DeviceIoControl(HFile,IOCTL_STORAGE_GET_MEDIA_TYPES_EX,nil,0,@StorageMediaType,SizeOf(StorageMediaType),lpBytesReturned, nil);
if DeviceIoControl(HFile,IOCTL_STORAGE_GET_MEDIA_TYPES_EX,nil,0,@Buffer,SizeOf(Buffer),lpBytesReturned,nil) then
MediaTypes := PGET_MEDIA_TYPES(@Buffer);
Result:=IntTostr(MediaTypes.MediaInfo[0].DeviceSpecific.RemovableDiskInfo.MediaType);
end;
finally
CloseHandle(HFile);
end;
end;}

Procedure DeviceDescriptorString(Disque:String);
{type
PCharArray = ^TCharArray;
TCharArray = Array[0..MAX_PATH] of Char;}
Var
  HFile:THandle;
  PropQuery:STORAGE_PROPERTY_QUERY;
  DeviceDescriptor:STORAGE_DEVICE_DESCRIPTOR;
  lpBytesReturned:DWORD;
  I:Integer;
  Value:Char;
  PosValue:Integer;
  // TestString : String;
  // TestChar : PChar;
Begin
  Drive.Properties := '';
  HFile := INVALID_HANDLE_VALUE;
  Try
    HFile := CreateFile(PChar('\\.\' + Disque), 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
    If HFile <> INVALID_HANDLE_VALUE Then
      Begin
        ZeroMemory(@PropQuery, SizeOf(PropQuery));
        ZeroMemory(@DeviceDescriptor, SizeOf(DeviceDescriptor));
        DeviceDescriptor.Size := SizeOf(DeviceDescriptor);
        DeviceIoControl(HFile, IOCTL_STORAGE_QUERY_PROPERTY, @PropQuery, SizeOf(PropQuery), @DeviceDescriptor, DeviceDescriptor.Size, lpBytesReturned, Nil);
        {// vendorid
        if DeviceDescriptor.VendorIdOffset<>0 then
        begin
        TestChar:=@PCharArray(@DeviceDescriptor)^[DeviceDescriptor.VendorIdOffset];
        TestString:=Trim(TestChar);
        TestString:= String(PChar(@DeviceDescriptor) + DeviceDescriptor.VendorIdOffset);
        end;
        // productid
        if DeviceDescriptor.ProductIdOffset<>0 then
        begin
        TestChar:=@PCharArray(@DeviceDescriptor)^[DeviceDescriptor.ProductIdOffset];
        TestString:=Trim(TestChar);
        TestString:= String(PChar(@DeviceDescriptor) + DeviceDescriptor.ProductIdOffset);
        end;
        // product révision
        if DeviceDescriptor.ProductRevisionOffset<>0 then
        begin
        TestChar:=@PCharArray(@DeviceDescriptor)^[DeviceDescriptor.ProductRevisionOffset];
        TestString:=Trim(TestChar);
        TestString:= String(PChar(@DeviceDescriptor) + DeviceDescriptor.ProductRevisionOffset);
        end;}
        Drive.Properties := '';
        PosValue := 0;
        For I := DeviceDescriptor.RawPropertiesLength - 1 Downto 0 Do
          If DeviceDescriptor.RawDeviceProperties[i] = 0 Then
            Begin
              PosValue := I;
              Break;
            End;
        Value := #0;
        For I := PosValue To DeviceDescriptor.RawPropertiesLength - 1 Do
          Begin
            Case DeviceDescriptor.RawDeviceProperties[i] Of
              32..126:
                Begin
                  If Drive.Properties <> '' Then
                    Value := Drive.Properties[Length(Drive.Properties) - 1];
                  If (Value <> ' ') Or (DeviceDescriptor.RawDeviceProperties[i] <> 32) Then
                    Drive.Properties := Drive.Properties + Chr(DeviceDescriptor.RawDeviceProperties[i]);
                End;
            End;
          End;
      End;
  Finally
    CloseHandle(HFile);
  End;
End;

Function FormatTaille(Value:Extended):String;
Var
  i:Integer;
Begin
  i := 0;
  While (Value >= 1000) Or (i = 4) Do
    Begin
      Value := Value / 1024;
      Inc(i);
    End;
  Case i Of
    0:Result := FloatToStrF(Value, ffFixed, 18, 2) + ' b';
    1:Result := FloatToStrF(Value, ffFixed, 18, 2) + ' KB';
    2:Result := FloatToStrF(Value, ffFixed, 18, 2) + ' MB';
    3:Result := FloatToStrF(Value, ffFixed, 18, 2) + ' GB';
    4:Result := FloatToStrF(Value, ffFixed, 18, 2) + ' TB';
  End;
End;

Procedure InfoDevice(Disque:String);
Var
  Volume:THandle;
  Returned:DWORD;
  VolName:Array[0..MAX_PATH] Of Char;
  FileSysName:Array[0..MAX_PATH] Of Char;
  VolSerial:DWord;
  FileMaxLen:DWord;
  FileFlags:DWord;
  FreeAvailable:Int64;
  TotalSpace:Int64;
  FreeAvailableString:String;
  TotalSpaceString:String;
  TempVolName:String;
Begin
  Drive.VolumeName := '';
  Drive.TailleLib := '0 G';
  Drive.TailleTot := '0 G';
  Drive.SystFich := '';
  If GetVolumeInformation(PChar(Disque + '\'), VolName, Max_Path, @VolSerial, FileMaxLen, FileFlags, FileSysName, MAX_PATH) Then
    Begin
      GetDiskFreeSpaceEx(PChar(Disque), FreeAvailable, TotalSpace, Nil);
      FreeAvailableString := FormatTaille(FreeAvailable);
      TotalSpaceString := FormatTaille(TotalSpace);
      If VolName <> '' Then
        TempVolName := VolName
      Else
        TempVolName := '';
      Drive.VolumeName := TempVolName;
      Drive.SystFich := FileSysName;
      Drive.TailleLib := FreeAvailableString;
      Drive.TailleTot := TotalSpaceString;
    End
  Else
    Begin
      TempVolName := '空';
      Volume := CreateFile(PChar('\\.\' + Disque + ':'), 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
      Try
        If Not DeviceIoControl(Volume, IOCTL_STORAGE_CHECK_VERIFY, Nil, 0, Nil, 0, Returned, Nil) Then
          Begin
            Drive.VolumeName := TempVolName;
            Drive.SystFich := '';
            Drive.TailleLib := '0 G';
            Drive.TailleTot := '0 G';
          End;
      Finally
        CloseHandle(Volume);
      End;
    End;
End;

Function HotPlugInfo(Disque:String):Boolean;
Var
  HFile:THandle;
  GetMediaTypes:STORAGE_HOTPLUG_INFO;
  PropQuery:STORAGE_PROPERTY_QUERY;
  DeviceDescriptor:STORAGE_DEVICE_DESCRIPTOR;
  lpBytesReturned:DWORD;
Begin
  Result := False;
  HFile := INVALID_HANDLE_VALUE;
  Try
    HFile := CreateFile(PChar('\\.\' + Disque), 0, FILE_SHARE_READ Or FILE_SHARE_WRITE, Nil, OPEN_EXISTING, 0, 0);
    If HFile <> INVALID_HANDLE_VALUE Then
      Begin
        DeviceIoControl(HFile, IOCTL_STORAGE_GET_HOTPLUG_INFO, Nil, 0, @GetMediaTypes, sizeof(GetMediaTypes), lpBytesReturned, Nil);
        ZeroMemory(@PropQuery, SizeOf(PropQuery));
        ZeroMemory(@DeviceDescriptor, SizeOf(DeviceDescriptor));
        DeviceDescriptor.Size := SizeOf(DeviceDescriptor);
        DeviceIoControl(HFile, IOCTL_STORAGE_QUERY_PROPERTY, @PropQuery, SizeOf(PropQuery), @DeviceDescriptor, DeviceDescriptor.Size, lpBytesReturned, Nil);
        If (DeviceDescriptor.BusType = BusTypeUsb) Or (DeviceDescriptor.BusType = BusType1394) Or (DeviceDescriptor.BusType = BusTypeAtapi) Or
          ((GetMediaTypes.MediaRemovable) And (GetMediaTypes.MediaHotplug)) Or
          (GetMediaTypes.DeviceHotplug) Or (GetMediaTypes.MediaRemovable) Then
          Result := True
        Else
          Result := False;
        Drive.Volume := Disque + '\';
        Drive.MediaRemovable := GetMediaTypes.MediaRemovable;
        Drive.MediaHotplug := GetMediaTypes.MediaHotplug;
        Drive.DeviceHotplug := GetMediaTypes.DeviceHotplug;
        Drive.BusType := DeviceDescriptor.BusType;
        DeviceDescriptorString(Disque);
        InfoDevice(Disque);
        StorageDeviceNumberString(Disque);
      End;
  Finally
    CloseHandle(HFile);
  End;
End;

Procedure Liste_USB(Lecteurs:TStrings; DriveRemovable, DriveFixed, DriveCDRom:Boolean);
Var
  Num:Integer;
  Bits:Set Of 0..25;
  Disque:String;
Begin
  Integer(Bits) := GetLogicalDrives;
  For Num := 0 To 25 Do
    Begin
      If Num In Bits Then
        Begin
          Disque := Char(Num + Ord('A')) + ':';
          Case GetDriveType(PChar(Disque)) Of
            DRIVE_REMOVABLE:If DriveRemovable Then
                If HotPlugInfo(Disque) Then
                  Lecteurs.Append(Drive.Volume + ' ' + Drive.Properties + ' 可移动磁盘' + ' ' + Drive.SystFich + ' ( ' + Drive.TailleLib + ' / ' + Drive.TailleTot + ' ) ' + Drive.VolumeName);
            DRIVE_FIXED:If DriveFixed Then
                If HotPlugInfo(Disque) Then
                  Lecteurs.Append(Drive.Volume + ' ' + Drive.Properties + ' 移动硬盘 ' + ' ' + Drive.SystFich + ' ( ' + Drive.TailleLib + ' / ' + Drive.TailleTot + ' ) ' + Drive.VolumeName)
                Else
                  Lecteurs.Append(Drive.Volume + ' ' + Drive.Properties + ' 本地磁盘 ' + ' ' + Drive.SystFich + ' ( ' + Drive.TailleLib + ' / ' + Drive.TailleTot + ' ) ' + Drive.VolumeName);
            DRIVE_CDROM:If DriveCDRom Then
                If HotPlugInfo(Disque) Then
                  Lecteurs.Append(Drive.Volume + ' ' + Drive.Properties + ' CDRom/DVDRom ' + ' ' + Drive.SystFich + ' ( ' + Drive.TailleLib + ' / ' + Drive.TailleTot + ' ) ' + Drive.VolumeName);
          End;
        End;
    End;
End;

Function CM_Query_And_Remove_SubTreeW; External 'SetupApi.dll' name 'CM_Query_And_Remove_SubTreeW';
Function CM_Query_And_Remove_SubTreeA; External 'SetupApi.dll' name 'CM_Query_And_Remove_SubTreeA';
Function CM_Query_And_Remove_SubTree; External 'SetupApi.dll' name 'CM_Query_And_Remove_SubTree' + LettreFin;
Function CM_Request_Device_EjectW; External 'SetupApi.dll' name 'CM_Request_Device_EjectW';
Function CM_Request_Device_EjectA; External 'SetupApi.dll' name 'CM_Request_Device_EjectA';
Function CM_Request_Device_Eject; External 'SetupApi.dll' name 'CM_Request_Device_Eject' + LettreFin;
Function SetupDiGetClassDevsW; External 'SetupApi.dll' name 'SetupDiGetClassDevsW';
Function SetupDiGetClassDevsA; External 'SetupApi.dll' name 'SetupDiGetClassDevsA';
Function SetupDiGetClassDevs; External 'SetupApi.dll' name 'SetupDiGetClassDevs' + LettreFin;
Function SetupDiGetDeviceInterfaceDetailW; External 'SetupApi.dll' name 'SetupDiGetDeviceInterfaceDetailW';
Function SetupDiGetDeviceInterfaceDetailA; External 'SetupApi.dll' name 'SetupDiGetDeviceInterfaceDetailA';
Function SetupDiGetDeviceInterfaceDetail; External 'SetupApi.dll' name 'SetupDiGetDeviceInterfaceDetail' + LettreFin;

End.

