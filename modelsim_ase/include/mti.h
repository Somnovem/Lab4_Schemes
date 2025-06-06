/*****************************************************************************
 *
 * C Foreign Language Interface Definitions
 *
 * Copyright 1991-2009 Mentor Graphics Corporation
 *
 * All Rights Reserved.
 *
 * THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
 * MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
 * $Revision: #1 $
 * $Id: //dvt/mti/rel/6.5b/src/vsim/mti.h#1 $
 *
 *****************************************************************************/

#ifndef MTI_H
#define MTI_H

#ifndef DEFINE_UCDBT
#define DEFINE_UCDBT
typedef void* ucdbT;          /* generic handle to a UCDB */
#endif
/*****************************************************************************
 * DEFINES
 *****************************************************************************/

#ifndef PROTO
#if defined(_WIN32) || defined(__STDC__) || defined(__cplusplus)
#define PROTO(arg) arg
#else
#define PROTO(arg) ()
#endif
#endif /* PROTO */

#define mti_GetNumRecordElements(type)      mti_TickLength(type)
#define mti_GetSignalValueIndirect(sig,val) mti_GetArraySignalValue(sig,val)
#define mti_GetVarValueIndirect(var,val)    mti_GetArrayVarValue(var,val)

/*****************************************************************************
 * TYPE DEFINITIONS
 *****************************************************************************/

typedef struct mtiDriverIdTag   * mtiDriverIdT;  /* Handle to a signal drvr */
typedef struct mtiProcessIdTag  * mtiProcessIdT; /* Handle to a process     */
typedef struct mtiRegionIdTag   * mtiRegionIdT;  /* Handle to a region      */
typedef struct mtiSignalIdTag   * mtiSignalIdT;  /* Handle to a signal      */
typedef struct mtiTypeIdTag     * mtiTypeIdT;    /* Handle to a type desc   */
typedef struct mtiVariableIdTag * mtiVariableIdT;/* Handle to a variable    */
typedef struct mtiValueIdTag    * mtiValueIdT;   /* Handle to a value desc  */
typedef struct mtiCompValueIdTag * mtiCompValueIdT; /* Handle to a composite value desc  */

typedef int          mtiInt32T;
typedef unsigned int mtiUInt32T;

typedef mtiInt32T    mtiDelayT;

typedef void (*mtiEnvCBFuncPtrT)       PROTO((void * param, void * context));
typedef void (*mtiSimStatusCBFuncPtrT) PROTO((void * param, int running));
typedef void (*mtiVoidFuncPtrT)        PROTO((void * param));
typedef void (*mtiUCDBSaveFuncPtrT)    PROTO((ucdbT ucdb, 
                                              mtiRegionIdT region, 
                                              void * param));
typedef void (*mtiNoParamFuncPtrT)     PROTO((void));

/* Types */

typedef enum mtiTypeKindEnum_ {
    MTI_TYPE_SCALAR   =  0,        /* Integer types                          */
    MTI_TYPE_ARRAY    =  1,
    MTI_TYPE_RECORD   =  2,
    MTI_TYPE_ENUM     =  3,
    MTI_TYPE_INTEGER  =  4,        /* not used (use MTI_TYPE_SCALAR instead) */
    MTI_TYPE_PHYSICAL =  5,
    MTI_TYPE_REAL     =  6,
    MTI_TYPE_ACCESS   =  7,
    MTI_TYPE_FILE     =  8,
    MTI_TYPE_TIME     =  9,
	MTI_TYPE_REG      = 10,
	MTI_TYPE_NET      = 11,
	MTI_TYPE_MEMELEM  = 13,
    MTI_TYPE_C_REAL   = 15,
    MTI_TYPE_C_ENUM   = 264
} mtiTypeKindT;

/* Directions */

typedef enum mtiDirectionEnum_ {
    MTI_INTERNAL,
    MTI_DIR_IN,
    MTI_DIR_OUT,
    MTI_DIR_INOUT
} mtiDirectionT;

/* Process triggers */

typedef enum mtiProcessTriggerEnum_ {
    MTI_ACTIVE,
    MTI_EVENT
} mtiProcessTriggerT;

/* Driver modes */

typedef enum mtiDriverModeEnum_ {
    MTI_INERTIAL,
    MTI_TRANSPORT
} mtiDriverModeT;

/* Force types */

typedef enum mtiForceTypeEnum_ {
    MTI_FORCE_DEFAULT,
    MTI_FORCE_DEPOSIT,
    MTI_FORCE_DRIVE,
    MTI_FORCE_FREEZE
} mtiForceTypeT;

/* SystemC Control/Observe Compatibility mode */

typedef enum mtiCntrlObsrvCompatEnum_ {
    MTI_SCCO_DEFAULT, /* default behaviour for SignalSpy call */
    MTI_SCCO_CONTROL, /* control_foreign_signal compatibility mode */
    MTI_SCCO_OBSERVE,  /* observe_foreign_signal compatibility mode */
    MTI_SCCO_SCV_CONNECT  /* scv_connect compatibility mode */
} mtiCntrlObsrvCompatT;

/* Process priority */

typedef enum mtiProcessPriorityEnum_ {
    MTI_PROC_NORMAL    = 0,    /* Normal processes run (when triggered)      */
                               /* after all immediate processes have run and */
                               /* settled. They can run once per delta and   */
                               /* can schedule events in zero delay.         */

    MTI_PROC_IMMEDIATE = 1,    /* All immediate processes run immediately    */
                               /* after signal activation (if triggered). If */
                               /* any immediate process activates any        */
                               /* signals, then the signals are reevaluated  */
                               /* and all immediate processes (if triggered) */
                               /* are run again in the same delta. This      */
                               /* cycle continues until no more signals are  */
                               /* activated.                                 */

    MTI_PROC_POSTPONED = 2,    /* Postponed processes run once (when         */
                               /* triggered) at the end of the time step for */
                               /* which they are scheduled after all         */
                               /* immediate, normal, synchronized, and NBA   */
                               /* processes.  They cannot schedule anything  */
                               /* in zero delay.  (In Verilog, these types   */
                               /* of processes are also known as read-only   */
                               /* synchronization processes or $monitor()    */
                               /* processes.)                                */

    MTI_PROC_NBA       = 3,    /* Non-Blocking Assignment processes (when    */
                               /* triggered) run after synchronized          */
                               /* processes, but before postponed processes. */
                               /* They can run once per delta and can        */
                               /* schedule events in zero delay.             */

    MTI_PROC_SYNCH     = 4     /* Synchronized processes (when triggered)    */
                               /* run after immediate and normal processes,  */
                               /* but before NBA processes. They can run     */
                               /* once per delta and can schedule events in  */
                               /* zero delay.                                */
} mtiProcessPriorityT;

/* Time format conversion */

typedef enum mtiTimeFlagEnum_ {
	MTI_TIME_BEST_UNITS    = 1,   /* Determine automatically the units to use */
	MTI_TIME_INSERT_COMMAS = 2,   /* Insert commas every three digits */
	MTI_TIME_NO_DEF_UNIT   = 8,   /* Do not display default units */
	MTI_TIME_FREQUENCY     = 16   /* Display time as 1/t in hz */
} mtiTimeFlagT;

/* -------------------- Data structure for time values -------------------- */

#if (defined(_LP64) || defined(__LP64__) || defined(__64BIT__)) \
    && !defined(NOINT64)

/* 64-bit scalar time type */

typedef long mtiTime64T;
#define MTI_TIME64_INIT(h,l)    ((long)(h)<<32 | (unsigned int)(l))
#define MTI_TIME64_HI32(t)      ((mtiInt32T)((t)>>32))
#define MTI_TIME64_LO32(t)      ((mtiUInt32T)(t))
#define MTI_TIME64_ASGN(t,h,l)  {(t) = (long)(h)<<32 | (unsigned int)(l);}

#elif defined(USE_INTTYPES)

/* 64-bit scalar time type */

# include <sys/types.h>
typedef int64 mtiTime64T;
#define MTI_TIME64_INIT(h,l)    ((int64)(h)<<32 | (unsigned int)(l))
#define MTI_TIME64_HI32(t)      ((mtiInt32T)((t)>>32))
#define MTI_TIME64_LO32(t)      ((mtiUInt32T)(t))
#define MTI_TIME64_ASGN(t,h,l)  {(t) = (int64)(h)<<32 | (unsigned int)(l);}

#else  /* 64-bit aligned time structure */

struct mtiInt64TimeVal_ {
#if defined(_WIN32) || defined(linux) || (defined(SUNOS5) && !defined(__sparc))
	unsigned int lo;
	int          hi;
# define MTI_TIME64_INIT(h,l)    {{(l), (h)}}
# else
	int          hi;
	unsigned int lo;
# define MTI_TIME64_INIT(h,l)    {{(h), (l)}}
# endif
};

typedef union mtiTime64Union_ {
	struct mtiInt64TimeVal_ s;
# if defined(_LP64) || defined(__LP64__) || defined(__64BIT__)
    long v;
# elif defined (__GNUC__) && !defined(__STRICT_ANSI__)
    long long v;
# else
    double d;
# endif
} mtiTime64T;
#define MTI_TIME64_ASGN(t,h,l)    {(t).s.hi = (h); (t).s.lo = (l);}
#define MTI_TIME64_HI32(t)        ((t).s.hi)
#define MTI_TIME64_LO32(t)        ((t).s.lo)

#endif

/* Types to handle Real values as return values of foreign functions. */

typedef union {
    mtiTime64T val64;
    mtiInt32T  val32;
    long       val_long;
    double     val_real;
    char *     val_ptr;
} mtiUniversalValueT;

typedef mtiUniversalValueT mtiRealT;

#define MTI_GET_REAL_VALUE(r) ((r).val_real)
#define MTI_ASSIGN_TO_REAL(target,source) ((target).val_real = source)

/* Data structure for physical type units */

typedef struct mtiPhysicalDataStruct_ mtiPhysicalDataT;
struct mtiPhysicalDataStruct_ {
    mtiPhysicalDataT  * next;           /* Ptr to next unit; NULL at end     */
    char              * unit_name;      /* Name of unit                      */
    mtiInt32T           position;       /* Multiple of primary unit          */
};

/* Data structure for ports and generics */

/*****************************************************************************
 * NOTE: For generics of type string, generic_array_value is NOT
 *       null-terminated.  See the FLI manual for information
 *       on accessing VHDL array values.
 *****************************************************************************/

union mtiGenericValUnion_{
  mtiInt32T       generic_value;         /* Integer/physical/enum generic     */
										 /* value                             */
  double          generic_value_real;    /* Real generic value                */
  mtiTime64T      generic_value_time;    /* Time generic value                */
  void          * generic_array_value;   /* Array generic value               */
  mtiVariableIdT  generic_record_varid;  /* Generic record variable           */
  mtiSignalIdT    port;                  /* Signal ID of port                 */
#if defined(_POWER)
  long long      _qalign_natural;        /** force 8-byte alignment of union **/
#endif /* _POWER (IBM cc) */
};

typedef struct mtiInterfaceListStruct_ mtiInterfaceListT;
struct mtiInterfaceListStruct_ {
    char            * name;                  /* Simple name of generic/port       */
    mtiTypeIdT        type;                  /* Type of generic/port              */
    mtiDirectionT     port_dir;              /* Direction of port                 */
                                             /* (All generics are INTERNAL)       */
	union mtiGenericValUnion_ u;
    mtiInterfaceListT *nxt;                  /* Next generic/port in list         */
};

/*****************************************************************************
 * FUNCTION PROTOTYPES
 *****************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/***********
 * Regions *
 ***********/

extern mtiRegionIdT        mti_CreateRegion         PROTO((mtiRegionIdT parent,
                                                           char * name));
extern mtiRegionIdT        mti_FindRegion           PROTO((char * name));
extern mtiRegionIdT        mti_FirstLowerRegion     PROTO((mtiRegionIdT reg));
extern mtiRegionIdT        mti_GetCallingRegion     PROTO((void));
extern mtiRegionIdT        mti_GetCurrentRegion     PROTO((void));
extern mtiRegionIdT        mti_GetTopRegion         PROTO((void));
extern mtiRegionIdT        mti_HigherRegion         PROTO((mtiRegionIdT reg));
extern mtiRegionIdT        mti_NextRegion           PROTO((mtiRegionIdT reg));

extern char              * mti_GetLibraryName       PROTO((mtiRegionIdT reg));
extern char              * mti_GetPrimaryName       PROTO((mtiRegionIdT reg));
extern char              * mti_GetRegionFullName    PROTO((mtiRegionIdT reg));
extern char              * mti_GetRegionName        PROTO((mtiRegionIdT reg));
extern char              * mti_GetRegionSourceName  PROTO((mtiRegionIdT reg));
extern char              * mti_GetSecondaryName     PROTO((mtiRegionIdT reg));

extern int                 mti_GetRegionKind        PROTO((mtiRegionIdT reg));

extern mtiInterfaceListT * mti_GetGenericList       PROTO((mtiRegionIdT reg));

/*************
 * Processes *
 *************/

extern mtiProcessIdT  mti_CreateProcess      PROTO((char * name,
                                                    mtiVoidFuncPtrT func,
                                                    void * param));
extern mtiProcessIdT  mti_CreateProcessWithPriority
                                             PROTO((char * name,
                                                 mtiVoidFuncPtrT func,
                                                 void * param,
                                                 mtiProcessPriorityT priority));
extern mtiProcessIdT  mti_FirstProcess       PROTO((mtiRegionIdT reg));
extern mtiProcessIdT  mti_NextProcess        PROTO((void));

extern char         * mti_GetProcessName     PROTO((mtiProcessIdT proc));
extern mtiRegionIdT   mti_GetProcessRegion   PROTO((mtiProcessIdT proc));

extern void           mti_Desensitize        PROTO((mtiProcessIdT proc));
extern void           mti_ScheduleWakeup     PROTO((mtiProcessIdT proc,
                                                    mtiDelayT delay));
extern void           mti_ScheduleWakeup64   PROTO((mtiProcessIdT proc,
                                                    mtiTime64T delay));
extern void           mti_Sensitize          PROTO((mtiProcessIdT proc,
                                                    mtiSignalIdT sig,
                                                    mtiProcessTriggerT when));

/***********
 * Signals *
 ***********/

extern mtiSignalIdT   mti_CreateSignal         PROTO((char * name,
                                                      mtiRegionIdT reg,
                                                      mtiTypeIdT type));
extern mtiSignalIdT   mti_FindPort             PROTO((mtiInterfaceListT * list,
                                                      char * name));
extern mtiSignalIdT   mti_FindSignal           PROTO((char * name));
extern mtiSignalIdT   mti_FirstSignal          PROTO((mtiRegionIdT reg));
extern mtiSignalIdT   mti_NextSignal           PROTO((void));

extern int            mti_ForceSignal          PROTO((mtiSignalIdT sigid,
                                                    char        * value_string,
                                                    mtiDelayT     delay,
                                                    mtiForceTypeT force_type,
                                                    mtiInt32T     cancel_period,
                                                    mtiInt32T     repeat_period
                                                    ));
extern int            mti_ReleaseSignal        PROTO((mtiSignalIdT sigid));

extern void         * mti_GetArraySignalValue  PROTO((mtiSignalIdT sig,
                                                      void * buf));
extern mtiSignalIdT * mti_GetDrivingSignals    PROTO((char * name));
extern mtiSignalIdT   mti_GetParentSignal      PROTO((mtiSignalIdT sig));
extern mtiSignalIdT   mti_GetResolvedSignalParent  PROTO((mtiSignalIdT sig));
extern mtiSignalIdT   mti_GetEquivSignal       PROTO((mtiSignalIdT sig));
extern mtiDirectionT  mti_GetSignalMode        PROTO((mtiSignalIdT sig));
extern char         * mti_GetSignalName        PROTO((mtiSignalIdT sig));
extern char         * mti_GetSignalNameIndirect  PROTO((mtiSignalIdT sig,
                                                        char * buf,
                                                        int length));
extern mtiRegionIdT   mti_GetSignalRegion      PROTO((mtiSignalIdT sig));
extern mtiSignalIdT * mti_GetSignalSubelements PROTO((mtiSignalIdT sig,
                                                      mtiSignalIdT * buf));
extern mtiTypeIdT     mti_GetSignalType        PROTO((mtiSignalIdT sig));
extern mtiInt32T      mti_GetSignalValue       PROTO((mtiSignalIdT sig));

extern void           mti_SetSignalValue       PROTO((mtiSignalIdT sig,
                                                      long val));

extern char         * mti_SignalImage          PROTO((mtiSignalIdT sig));
extern int            mti_SignalIsResolved     PROTO((mtiSignalIdT sig));
extern void           mti_SignalDump           PROTO((mtiSignalIdT sig));

/***********
 * Drivers *
 ***********/

extern mtiDriverIdT   mti_CreateDriver         PROTO((mtiSignalIdT sig));
extern mtiDriverIdT   mti_FindDriver           PROTO((mtiSignalIdT sig));
extern mtiDriverIdT * mti_GetDriverSubelements PROTO((mtiDriverIdT drv,
                                                      mtiDriverIdT * buf));
extern char        ** mti_GetDriverNames       PROTO((mtiSignalIdT sig,
                                                      mtiInt32T * length));
extern char         * mti_GetDriverValues      PROTO((mtiSignalIdT sig,
                                                      mtiInt32T * length));

extern void           mti_ScheduleDriver       PROTO((mtiDriverIdT drv,
                                                      long value,
                                                      mtiDelayT delay,
                                                      mtiDriverModeT mode));
extern void           mti_ScheduleDriver64     PROTO((mtiDriverIdT drv,
                                                      long value,
                                                      mtiTime64T delay,
                                                      mtiDriverModeT mode));
extern void           mti_SetDriverOwner       PROTO((mtiDriverIdT drv,
                                                      mtiProcessIdT proc));

/*************
 * Variables *
 *************/

extern mtiVariableIdT   mti_FindVar            PROTO((char * name));
extern mtiVariableIdT   mti_FirstVar           PROTO((mtiProcessIdT proc));
extern mtiVariableIdT   mti_FirstVarByRegion   PROTO((mtiRegionIdT reg));
extern mtiVariableIdT   mti_NextVar            PROTO((void));

extern void           * mti_GetArrayVarValue   PROTO((mtiVariableIdT var,
                                                      void * buf));
extern void           * mti_GetVarAddr         PROTO((char * name));
extern char           * mti_GetVarImage        PROTO((char * name));
extern char           * mti_GetVarImageById    PROTO((mtiVariableIdT var));
extern char           * mti_GetVarName         PROTO((mtiVariableIdT var));
extern mtiVariableIdT * mti_GetVarSubelements  PROTO((mtiVariableIdT var,
                                                      mtiVariableIdT * buf));
extern mtiTypeIdT       mti_GetVarType         PROTO((mtiVariableIdT var));
extern mtiInt32T        mti_GetVarValue        PROTO((mtiVariableIdT var));

extern void             mti_SetVarValue        PROTO((mtiVariableIdT var,
                                                      long val));

/*********
 * Types *
 *********/

extern mtiTypeIdT      mti_CreateArrayType     PROTO((mtiInt32T  left,
                                                      mtiInt32T  right,
                                                      mtiTypeIdT elem_type));
extern mtiTypeIdT      mti_CreateEnumType      PROTO((mtiInt32T size,
                                                      mtiInt32T count,
                                                      char **   literals));
extern mtiTypeIdT      mti_CreateRealType      PROTO((void));
extern mtiTypeIdT      mti_CreateScalarType    PROTO((mtiInt32T left,
                                                      mtiInt32T right));
extern mtiTypeIdT      mti_CreateTimeType      PROTO((void));

extern mtiTypeIdT      mti_GetArrayElementType PROTO((mtiTypeIdT type));
extern char         ** mti_GetEnumValues       PROTO((mtiTypeIdT type));
extern mtiPhysicalDataT * mti_GetPhysicalData  PROTO((mtiTypeIdT type));
extern mtiTypeKindT    mti_GetTypeKind         PROTO((mtiTypeIdT type));
extern int             mti_IsSystemcType       PROTO((mtiTypeIdT type));
extern int             mti_IsSystemcSignedType PROTO((mtiTypeIdT type));

extern char          * mti_Image               PROTO((void * value,
                                                      mtiTypeIdT type));

extern mtiInt32T       mti_TickDir             PROTO((mtiTypeIdT type));
extern mtiInt32T       mti_TickHigh            PROTO((mtiTypeIdT type));
extern mtiInt32T       mti_TickLeft            PROTO((mtiTypeIdT type));
extern mtiInt32T       mti_TickLength          PROTO((mtiTypeIdT type));
extern mtiInt32T       mti_TickLow             PROTO((mtiTypeIdT type));
extern mtiInt32T       mti_TickRight           PROTO((mtiTypeIdT type));

/*************
 * Callbacks *
 *************/

extern void  mti_AddInputReadyCB               PROTO((int file_desc,
                                                      mtiVoidFuncPtrT func,
                                                      void * param));
extern void  mti_AddOutputReadyCB              PROTO((int file_desc,
                                                      mtiVoidFuncPtrT func,
                                                      void * param));

extern void  mti_AddSocketInputReadyCB         PROTO((int socket_desc,
                                                      mtiVoidFuncPtrT func,
                                                      void * param));
extern void  mti_AddSocketOutputReadyCB        PROTO((int socket_desc,
                                                      mtiVoidFuncPtrT func,
                                                      void * param));

extern void  mti_AddEnvCB            PROTO((mtiEnvCBFuncPtrT func,void *param));
extern void  mti_AddLoadDoneCB       PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_AddQuitCB           PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_AddRestartCB        PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_AddRestoreCB        PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_AddRestoreDoneCB    PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_AddSaveCB           PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_AddSimStatusCB      PROTO((mtiSimStatusCBFuncPtrT func,
                                            void *param));
extern void  mti_AddUCDBSaveCB       PROTO((mtiRegionIdT region,
                                            mtiUCDBSaveFuncPtrT func,
                                            void*param));

extern void  mti_RemoveEnvCB         PROTO((mtiEnvCBFuncPtrT func,void *param));
extern void  mti_RemoveLoadDoneCB    PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_RemoveQuitCB        PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_RemoveRestartCB     PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_RemoveRestoreCB     PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_RemoveRestoreDoneCB PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_RemoveSaveCB        PROTO((mtiVoidFuncPtrT func, void *param));
extern void  mti_RemoveSimStatusCB   PROTO((mtiSimStatusCBFuncPtrT func,
                                            void *param));

/*********************
 * Memory Management *
 *********************/

extern void   * mti_Malloc                PROTO((unsigned long size));
extern void   * mti_Realloc               PROTO((void * p, unsigned long size));
extern void     mti_Free                  PROTO((void * p));
extern void     mti_VsimFree              PROTO((void * ptr));

/******************
 * Save & Restore *
 ******************/

extern char   * mti_GetCheckpointFilename PROTO((void));
extern int      mti_IsRestore             PROTO((void));
extern int      mti_IsColdRestore         PROTO((void));
extern void     mti_SaveBlock             PROTO((char * p, unsigned long size));
extern void     mti_SaveChar              PROTO((char data));
extern void     mti_SaveLong              PROTO((long data));
extern void     mti_SaveShort             PROTO((short data));
extern void     mti_SaveString            PROTO((char * data));
extern void     mti_RestoreBlock          PROTO((char * p));
extern char     mti_RestoreChar           PROTO((void));
extern long     mti_RestoreLong           PROTO((void));
extern short    mti_RestoreShort          PROTO((void));
extern char   * mti_RestoreString         PROTO((void));
extern void     mti_RestoreProcess        PROTO((mtiProcessIdT   proc,
                                                 char *          name,
                                                 mtiVoidFuncPtrT func,
                                                 void *          param));

/*****************
 * Time & Events *
 *****************/

extern mtiUInt32T    mti_Delta            PROTO((void));
extern mtiInt32T     mti_Now              PROTO((void));
extern mtiTime64T  * mti_NowIndirect      PROTO((mtiTime64T *timep));
extern mtiInt32T     mti_NowUpper         PROTO((void));
extern char        * mti_NowFormatted     PROTO((mtiTimeFlagT flags));
extern char        * mti_TimeToString     PROTO((mtiTime64T  *timep, 
												 mtiTimeFlagT  flags));

extern int      mti_GetNextEventTime      PROTO((mtiTime64T * timep));
extern int      mti_GetNextNextEventTime  PROTO((mtiTime64T * timep));
extern int      mti_GetResolutionLimit    PROTO((void));
extern void     mti_GetRunStopTime        PROTO((mtiTime64T * timep));

/****************************
 * Communication & Commands *
 ****************************/

extern void     mti_AddCommand            PROTO((char * cmd_name,
                                                 mtiVoidFuncPtrT func));

#ifdef _TCL
extern void     mti_AddTclCommand         PROTO((char *          cmd_name,
                                                 Tcl_CmdProc *   func,
                                                 void *          param,
                                                 mtiVoidFuncPtrT funcDeleteCB));
#endif /* _TCL */

extern void     mti_Command               PROTO((char * cmd));
extern int      mti_Cmd                   PROTO((char * cmd));
extern void   * mti_Interp                PROTO((void));

extern int      mti_AskStdin              PROTO((char * buf, char * prompt));
extern void     mti_PrintMessage          PROTO((char * msg));
extern void     mti_PrintFormatted        PROTO((char * format, ...));

extern void     mti_Break                 PROTO((void));
extern void     mti_FatalError            PROTO((void));
extern void     mti_Quit                  PROTO((void));

/*****************
 * Miscellaneous *
 *****************/

extern char   * mti_GetProductVersion     PROTO((void));
extern char   * mti_GetWlfFilename        PROTO((void));

extern char   * mti_FindProjectEntry      PROTO((char * section,
                                                 char * name,
                                                 int    expand));
extern void     mti_WriteProjectEntry     PROTO((char * key, char * val));

extern int      mti_IsFirstInit           PROTO((void));

extern void     mti_KeepLoaded            PROTO((void));

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* MTI_H */

/* ***************************** End of Header ***************************** */
