 
/*------------------------------------------------------------------------
   File        : Form1
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : 
   Created     : 
   Notes       : 
 ----------------------------------------------------------------------*/
USING System.*. 


USING Progress.Json.ObjectModel.JsonArray FROM PROPATH.
USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.
USING Telerik.WinControls.UI.RadForm FROM ASSEMBLY.
USING se.afa.mega.general.anropaRest FROM PROPATH.
USING se.afa.mega.general.kod FROM PROPATH.
USING Telerik.WinControls.ThemeResolutionService FROM ASSEMBLY.
USING Progress.Json.ObjectModel.ObjectModelParser FROM PROPATH.
USING OpenEdge.Logging.LogMessage FROM PROPATH.
USING System.Threading.Tasks.Task FROM ASSEMBLY.
USING System.Threading.SynchronizationContext FROM ASSEMBLY.
USING System.Windows.Forms.WindowsFormsSynchronizationContext FROM ASSEMBLY.
USING System.Runtime.CompilerServices.TaskAwaiter FROM ASSEMBLY.
USING System.Reflection.*.
USING se.afa.mega.general.HttpGet FROM PROPATH.
USING com.stomp.stomp_mqc FROM PROPATH.


/*USING Progress.Windows.Form.*/



CLASS Form1 INHERITS RadForm : 
	
    DEFINE PRIVATE VARIABLE bindingSource1                 AS Progress.Data.BindingSource                          NO-UNDO.
    DEFINE PRIVATE VARIABLE bindingSource2                 AS Progress.Data.BindingSource                          NO-UNDO.
    DEFINE PRIVATE VARIABLE bindingSource3                 AS Progress.Data.BindingSource                          NO-UNDO.
    DEFINE PRIVATE VARIABLE bindingSource4                 AS Progress.Data.BindingSource                          NO-UNDO.
    DEFINE PRIVATE VARIABLE commandBarSeparator1           AS Telerik.WinControls.UI.CommandBarSeparator           NO-UNDO.
    
    DEFINE PRIVATE VARIABLE commandBarSeparator2           AS Telerik.WinControls.UI.CommandBarSeparator           NO-UNDO.
    DEFINE PRIVATE VARIABLE commandBarSeparator3           AS Telerik.WinControls.UI.CommandBarSeparator           NO-UNDO.
    DEFINE PRIVATE VARIABLE commandBarSeparator5           AS Telerik.WinControls.UI.CommandBarSeparator           NO-UNDO.
    DEFINE PRIVATE VARIABLE commandBarSeparator4           AS Telerik.WinControls.UI.CommandBarSeparator           NO-UNDO.
    DEFINE PRIVATE VARIABLE commandBarSeparator7           AS Telerik.WinControls.UI.CommandBarSeparator           NO-UNDO.
    DEFINE PRIVATE VARIABLE commandBarSeparator6           AS Telerik.WinControls.UI.CommandBarSeparator           NO-UNDO.
    DEFINE PRIVATE VARIABLE components                     AS System.ComponentModel.IContainer                     NO-UNDO.
    /*    DEFINE PRIVATE VARIABLE MasterTemplate                 AS Telerik.WinControls.UI.RadGridView                   NO-UNDO.*/
    DEFINE PRIVATE VARIABLE office2013DarkTheme1           AS Telerik.WinControls.Themes.Office2013DarkTheme       NO-UNDO.
    DEFINE PRIVATE VARIABLE office2013LightTheme1          AS Telerik.WinControls.Themes.Office2013LightTheme      NO-UNDO.
    DEFINE PRIVATE VARIABLE radButton1                     AS Telerik.WinControls.UI.RadButton                     NO-UNDO.
    DEFINE PRIVATE VARIABLE radButton2                     AS Telerik.WinControls.UI.RadButton                     NO-UNDO.
    DEFINE PRIVATE VARIABLE radDesktopAlert1               AS Telerik.WinControls.UI.RadDesktopAlert               NO-UNDO.
    DEFINE PRIVATE VARIABLE radGridView1                   AS Telerik.WinControls.UI.RadGridView                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radGridView2                   AS Telerik.WinControls.UI.RadGridView                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radGridView3                   AS Telerik.WinControls.UI.RadGridView                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radGridView4                   AS Telerik.WinControls.UI.RadGridView                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radLabel1                      AS Telerik.WinControls.UI.RadLabel                      NO-UNDO.
    DEFINE PRIVATE VARIABLE radLabelElement1               AS Telerik.WinControls.UI.RadLabelElement               NO-UNDO.
    DEFINE PRIVATE VARIABLE radLabelBarAerenden            AS Telerik.WinControls.UI.RadLabelElement               NO-UNDO.
    DEFINE PRIVATE VARIABLE radLabelElement2               AS Telerik.WinControls.UI.RadLabelElement               NO-UNDO.
    DEFINE PRIVATE VARIABLE radLabelElement3               AS Telerik.WinControls.UI.RadLabelElement               NO-UNDO.
    DEFINE PRIVATE VARIABLE radLabelElement4               AS Telerik.WinControls.UI.RadLabelElement               NO-UNDO.
    DEFINE PRIVATE VARIABLE radMenuItem3                   AS Telerik.WinControls.UI.RadMenuItem                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radMenuItem4                   AS Telerik.WinControls.UI.RadMenuItem                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radMenuItem5                   AS Telerik.WinControls.UI.RadMenuItem                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radOffice2007ScreenTipElement1 AS Telerik.WinControls.UI.RadOffice2007ScreenTipElement NO-UNDO.
    DEFINE PRIVATE VARIABLE radProgressBarElement1         AS Telerik.WinControls.UI.RadProgressBarElement         NO-UNDO.
    DEFINE PRIVATE VARIABLE radProgressBarElement2         AS Telerik.WinControls.UI.RadProgressBarElement         NO-UNDO.
    DEFINE PRIVATE VARIABLE radProgressBarLyssna           AS Telerik.WinControls.UI.RadProgressBar                NO-UNDO.
    DEFINE PRIVATE VARIABLE radSplitButton1                AS Telerik.WinControls.UI.RadSplitButton                NO-UNDO.
    DEFINE PRIVATE VARIABLE radMenuItem2                   AS Telerik.WinControls.UI.RadMenuItem                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radMenuItem1                   AS Telerik.WinControls.UI.RadMenuItem                   NO-UNDO.
    DEFINE PRIVATE VARIABLE radStatusStrip1                AS Telerik.WinControls.UI.RadStatusStrip                NO-UNDO.
    DEFINE PRIVATE VARIABLE soekPers                       AS Telerik.WinControls.UI.RadTextBox                    NO-UNDO.
    DEFINE         VARIABLE rest                           AS HttpGet                                              NO-UNDO.
    
    
    DEFINE TEMP-TABLE ttAerende LIKE aerende.
    DEFINE TEMP-TABLE ttSignal LIKE signal.
    DEFINE TEMP-TABLE ttBet LIKE bet.
    DEFINE TEMP-TABLE ttDok LIKE dok.
    DEFINE PRIVATE VARIABLE bs_ttEng               AS Progress.Data.BindingSource                      NO-UNDO.
    DEFINE         VARIABLE kodklass               AS CLASS                                            Kod.
    DEFINE PRIVATE VARIABLE statusbet              AS Telerik.WinControls.UI.RadLabelElement           NO-UNDO.
    DEFINE PRIVATE VARIABLE statusbettid           AS Telerik.WinControls.UI.RadLabelElement           NO-UNDO.
    DEFINE PRIVATE VARIABLE statusprogdok          AS Telerik.WinControls.UI.RadProgressBarElement     NO-UNDO.
    DEFINE PRIVATE VARIABLE statusdoktid           AS Telerik.WinControls.UI.RadLabelElement           NO-UNDO.
    DEFINE PRIVATE VARIABLE statusdokant           AS Telerik.WinControls.UI.RadLabelElement           NO-UNDO.
    DEFINE PRIVATE VARIABLE statusProgressBet      AS Telerik.WinControls.UI.RadProgressBarElement     NO-UNDO.
    DEFINE PRIVATE VARIABLE statussignalant        AS Telerik.WinControls.UI.RadLabelElement           NO-UNDO.
    DEFINE PRIVATE VARIABLE statussignaltid        AS Telerik.WinControls.UI.RadLabelElement           NO-UNDO.
    DEFINE PRIVATE VARIABLE statustid              AS Telerik.WinControls.UI.RadLabelElement           NO-UNDO.
    DEFINE PRIVATE VARIABLE telerikMetroBlueTheme1 AS Telerik.WinControls.Themes.TelerikMetroBlueTheme NO-UNDO.
    DEFINE PRIVATE VARIABLE telerikMetroTheme1     AS Telerik.WinControls.Themes.TelerikMetroTheme     NO-UNDO.
/*    DEFINE         VARIABLE hAppSrv                AS HANDLE.                                                     */
/*    DEFINE         VARIABLE canropaRest            AS CLASS                                            anropaRest.*/
    
    CONSTRUCTOR PUBLIC Form1 (  ):
        DEFINE VARIABLE ret       AS LOGICAL   NO-UNDO.
        DEFINE VARIABLE cnctParam AS CHARACTER NO-UNDO.
        
        SUPER().
        InitializeComponent().
        rest = NEW HttpGet().
/*        canropaRest = NEW anropaRest().*/
        soekPers:RootElement:Children:Item[0]:ToolTipText = "Ange 12 siffror".
        
        
        
        kodklass:ToString() NO-ERROR.
        progressbarstuff(10).
        IF ERROR-STATUS:ERROR THEN 
        DO:
            kodklass = NEW kod().
            ASSIGN 
                ERROR-STATUS:ERROR = FALSE.
                
        END.    
        
    /*        CREATE SERVER hAppSrv.                                                      */
    /*                                                                                    */
    /*        cnctParam = "-URL http://localhost:8080/apsv -sessionModel Session-Managed".*/
    /*                                                                                    */
    /*        ret = hAppSrv:CONNECT(cnctParam).                                           */
    /*                                                                                    */
    /*        IF NOT ret THEN                                                             */
    /*          RETURN ERROR "Failed to connect to AppServer".                            */

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID Form1_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
        RETURN.

    END METHOD.

    METHOD PRIVATE VOID InitializeComponent(  ):
		
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:components = NEW System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn1 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn1 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn1 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn1 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn1 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn1 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn2 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn2 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn2 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn2 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn3 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn3 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn3 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn3 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn4 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn4 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn5 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn5 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn2 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn2 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn6 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn6 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewCheckBoxColumn1 AS Telerik.WinControls.UI.GridViewCheckBoxColumn NO-UNDO.
        gridViewCheckBoxColumn1 = NEW Telerik.WinControls.UI.GridViewCheckBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn3 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn3 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn4 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn4 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn4 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn4 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn5 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn5 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn5 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn5 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn6 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn6 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE sortDescriptor1 AS Telerik.WinControls.Data.SortDescriptor NO-UNDO.
        sortDescriptor1 = NEW Telerik.WinControls.Data.SortDescriptor().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE sortDescriptor2 AS Telerik.WinControls.Data.SortDescriptor NO-UNDO.
        sortDescriptor2 = NEW Telerik.WinControls.Data.SortDescriptor().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableViewDefinition1 AS Telerik.WinControls.UI.TableViewDefinition NO-UNDO.
        tableViewDefinition1 = NEW Telerik.WinControls.UI.TableViewDefinition().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc1 = NEW Progress.Data.TableDesc("ttAerende").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc2 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc2 = NEW Progress.Data.TableDesc("ttSignal").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn7 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn7 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn6 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn6 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn7 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn7 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn8 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn8 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewCheckBoxColumn2 AS Telerik.WinControls.UI.GridViewCheckBoxColumn NO-UNDO.
        gridViewCheckBoxColumn2 = NEW Telerik.WinControls.UI.GridViewCheckBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn9 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn9 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn10 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn10 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn8 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn8 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn11 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn11 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableViewDefinition2 AS Telerik.WinControls.UI.TableViewDefinition NO-UNDO.
        tableViewDefinition2 = NEW Telerik.WinControls.UI.TableViewDefinition().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn9 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn9 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn10 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn10 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn7 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn7 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn11 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn11 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn12 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn12 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn13 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn13 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn12 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn12 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn14 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn14 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn13 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn13 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn14 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn14 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn15 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn15 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn15 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn15 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn16 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn16 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewCheckBoxColumn3 AS Telerik.WinControls.UI.GridViewCheckBoxColumn NO-UNDO.
        gridViewCheckBoxColumn3 = NEW Telerik.WinControls.UI.GridViewCheckBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn17 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn17 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn18 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn18 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn19 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn19 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewCheckBoxColumn4 AS Telerik.WinControls.UI.GridViewCheckBoxColumn NO-UNDO.
        gridViewCheckBoxColumn4 = NEW Telerik.WinControls.UI.GridViewCheckBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn20 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn20 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn21 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn21 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn22 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn22 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn8 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn8 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn16 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn16 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableViewDefinition3 AS Telerik.WinControls.UI.TableViewDefinition NO-UNDO.
        tableViewDefinition3 = NEW Telerik.WinControls.UI.TableViewDefinition().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc3 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc3 = NEW Progress.Data.TableDesc("ttBet").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc4 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc4 = NEW Progress.Data.TableDesc("ttDok").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn9 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn9 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn17 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn17 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn10 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn10 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn11 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn11 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn18 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn18 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn19 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn19 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn20 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn20 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDecimalColumn23 AS Telerik.WinControls.UI.GridViewDecimalColumn NO-UNDO.
        gridViewDecimalColumn23 = NEW Telerik.WinControls.UI.GridViewDecimalColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn21 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn21 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewTextBoxColumn22 AS Telerik.WinControls.UI.GridViewTextBoxColumn NO-UNDO.
        gridViewTextBoxColumn22 = NEW Telerik.WinControls.UI.GridViewTextBoxColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE gridViewDateTimeColumn12 AS Telerik.WinControls.UI.GridViewDateTimeColumn NO-UNDO.
        gridViewDateTimeColumn12 = NEW Telerik.WinControls.UI.GridViewDateTimeColumn().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableViewDefinition4 AS Telerik.WinControls.UI.TableViewDefinition NO-UNDO.
        tableViewDefinition4 = NEW Telerik.WinControls.UI.TableViewDefinition().
        THIS-OBJECT:soekPers = NEW Telerik.WinControls.UI.RadTextBox().
        THIS-OBJECT:radGridView1 = NEW Telerik.WinControls.UI.RadGridView().
        THIS-OBJECT:bindingSource1 = NEW Progress.Data.BindingSource(THIS-OBJECT:components).
        THIS-OBJECT:radLabel1 = NEW Telerik.WinControls.UI.RadLabel().
        THIS-OBJECT:radSplitButton1 = NEW Telerik.WinControls.UI.RadSplitButton().
        THIS-OBJECT:radMenuItem1 = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:radMenuItem2 = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:radMenuItem3 = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:radMenuItem4 = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:radMenuItem5 = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:radStatusStrip1 = NEW Telerik.WinControls.UI.RadStatusStrip().
        THIS-OBJECT:radLabelElement1 = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:radLabelBarAerenden = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:commandBarSeparator1 = NEW Telerik.WinControls.UI.CommandBarSeparator().
        THIS-OBJECT:radProgressBarElement1 = NEW Telerik.WinControls.UI.RadProgressBarElement().
        THIS-OBJECT:statustid = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:commandBarSeparator2 = NEW Telerik.WinControls.UI.CommandBarSeparator().
        THIS-OBJECT:radLabelElement2 = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:statussignalant = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:commandBarSeparator3 = NEW Telerik.WinControls.UI.CommandBarSeparator().
        THIS-OBJECT:radProgressBarElement2 = NEW Telerik.WinControls.UI.RadProgressBarElement().
        THIS-OBJECT:statussignaltid = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:commandBarSeparator4 = NEW Telerik.WinControls.UI.CommandBarSeparator().
        THIS-OBJECT:radLabelElement3 = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:statusbet = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:commandBarSeparator5 = NEW Telerik.WinControls.UI.CommandBarSeparator().
        THIS-OBJECT:statusProgressBet = NEW Telerik.WinControls.UI.RadProgressBarElement().
        THIS-OBJECT:statusbettid = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:commandBarSeparator6 = NEW Telerik.WinControls.UI.CommandBarSeparator().
        THIS-OBJECT:radLabelElement4 = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:statusdokant = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:commandBarSeparator7 = NEW Telerik.WinControls.UI.CommandBarSeparator().
        THIS-OBJECT:statusprogdok = NEW Telerik.WinControls.UI.RadProgressBarElement().
        THIS-OBJECT:statusdoktid = NEW Telerik.WinControls.UI.RadLabelElement().
        THIS-OBJECT:bindingSource2 = NEW Progress.Data.BindingSource(THIS-OBJECT:components).
        THIS-OBJECT:radGridView2 = NEW Telerik.WinControls.UI.RadGridView().
        THIS-OBJECT:radGridView3 = NEW Telerik.WinControls.UI.RadGridView().
        THIS-OBJECT:bindingSource3 = NEW Progress.Data.BindingSource(THIS-OBJECT:components).
        THIS-OBJECT:radOffice2007ScreenTipElement1 = NEW Telerik.WinControls.UI.RadOffice2007ScreenTipElement().
        THIS-OBJECT:telerikMetroTheme1 = NEW Telerik.WinControls.Themes.TelerikMetroTheme().
        THIS-OBJECT:office2013LightTheme1 = NEW Telerik.WinControls.Themes.Office2013LightTheme().
        THIS-OBJECT:telerikMetroBlueTheme1 = NEW Telerik.WinControls.Themes.TelerikMetroBlueTheme().
        THIS-OBJECT:office2013DarkTheme1 = NEW Telerik.WinControls.Themes.Office2013DarkTheme().
        THIS-OBJECT:bindingSource4 = NEW Progress.Data.BindingSource(THIS-OBJECT:components).
        THIS-OBJECT:radDesktopAlert1 = NEW Telerik.WinControls.UI.RadDesktopAlert(THIS-OBJECT:components).
        THIS-OBJECT:radGridView4 = NEW Telerik.WinControls.UI.RadGridView().
        THIS-OBJECT:radButton1 = NEW Telerik.WinControls.UI.RadButton().
        THIS-OBJECT:radProgressBarLyssna = NEW Telerik.WinControls.UI.RadProgressBar().
        THIS-OBJECT:radButton2 = NEW Telerik.WinControls.UI.RadButton().
        CAST(THIS-OBJECT:soekPers, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView1:MasterTemplate, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radLabel1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radSplitButton1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radStatusStrip1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:bindingSource2, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView2, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView2:MasterTemplate, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView3, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView3:MasterTemplate, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:bindingSource3, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:bindingSource4, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView4, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radGridView4:MasterTemplate, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radButton1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radProgressBarLyssna, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radButton2, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* soekPers */
        /*  */
        THIS-OBJECT:soekPers:AcceptsReturn = TRUE.
        THIS-OBJECT:soekPers:EnableGestures = FALSE.
        THIS-OBJECT:soekPers:Location = NEW System.Drawing.Point(106, 12).
        THIS-OBJECT:soekPers:Name = "soekPers".
        THIS-OBJECT:soekPers:Size = NEW System.Drawing.Size(112, 20).
        THIS-OBJECT:soekPers:TabIndex = 0.
        THIS-OBJECT:soekPers:TextChanged:Subscribe(THIS-OBJECT:soekPers_TextChanged).
        /*  */
        /* radGridView1 */
        /*  */
        THIS-OBJECT:radGridView1:BackColor = System.Drawing.SystemColors:Control.
        THIS-OBJECT:radGridView1:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:radGridView1:Font = NEW System.Drawing.Font("Segoe UI", Progress.Util.CastUtil:ToSingle(8.25)).
        THIS-OBJECT:radGridView1:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:radGridView1:ImeMode = System.Windows.Forms.ImeMode:NoControl.
        THIS-OBJECT:radGridView1:Location = NEW System.Drawing.Point(12, 54).
        /*  */
        /*  */
        /*  */
        THIS-OBJECT:radGridView1:MasterTemplate:AllowAddNewRow = FALSE.
        THIS-OBJECT:radGridView1:MasterTemplate:AllowDeleteRow = FALSE.
        THIS-OBJECT:radGridView1:MasterTemplate:AllowEditRow = FALSE.
        THIS-OBJECT:radGridView1:MasterTemplate:AutoSizeColumnsMode = Telerik.WinControls.UI.GridViewAutoSizeColumnsMode:Fill.
        gridViewDateTimeColumn1:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn1:FieldName = "TolkAerendeDat".
        gridViewDateTimeColumn1:Format = System.Windows.Forms.DateTimePickerFormat:Custom.
        gridViewDateTimeColumn1:FormatString = "~{0:yyyy-MM-dd~}".
        gridViewDateTimeColumn1:HeaderText = "Tolkat ärendedatum".
        gridViewDateTimeColumn1:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDateTimeColumn1:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn1:Name = "TolkAerendeDat".
/*        gridViewDateTimeColumn1:SortOrder = Telerik.WinControls.UI.RadSortOrder:Descending.*/
        gridViewDateTimeColumn1:Width = 167.
        gridViewTextBoxColumn1:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn1:FieldName = "ProduktGrpAvk".
        gridViewTextBoxColumn1:HeaderText = "Produktgrupp".
        gridViewTextBoxColumn1:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewTextBoxColumn1:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn1:Name = "ProduktGrpAvk".
        gridViewTextBoxColumn1:Width = 167.
        gridViewDecimalColumn1:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn1:FieldName = "AerendeNr".
        gridViewDecimalColumn1:FormatString = "~{0:000-000-000-0~}".
        gridViewDecimalColumn1:HeaderText = "Ärendenummer".
        gridViewDecimalColumn1:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDecimalColumn1:IsAutoGenerated = TRUE.
        gridViewDecimalColumn1:Name = "AerendeNr".
        gridViewDecimalColumn1:TextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDecimalColumn1:Width = 181.
        gridViewTextBoxColumn2:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn2:FieldName = "AerendeStatAvk".
        gridViewTextBoxColumn2:HeaderText = "Status".
        gridViewTextBoxColumn2:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewTextBoxColumn2:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn2:Name = "AerendeStatAvk".
        gridViewTextBoxColumn2:Width = 164.
        gridViewDateTimeColumn2:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn2:FieldName = "AerendeStatUpdDat".
        gridViewDateTimeColumn2:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn2:FormatString = "~{0:yyyy-MM-dd~}".
        gridViewDateTimeColumn2:HeaderText = "Senast uppdaterad".
        gridViewDateTimeColumn2:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDateTimeColumn2:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn2:Name = "AerendeStatUpdDat".
        gridViewDateTimeColumn2:Width = 164.
        gridViewDateTimeColumn3:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn3:FieldName = "AnkDat".
        gridViewDateTimeColumn3:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn3:FormatString = "~{0:yyyy-MM-dd~}".
        gridViewDateTimeColumn3:HeaderText = "Inkom datum".
        gridViewDateTimeColumn3:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDateTimeColumn3:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn3:Name = "AnkDat".
        gridViewDateTimeColumn3:Width = 164.
        gridViewTextBoxColumn3:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn3:FieldName = "AnmAvk".
        gridViewTextBoxColumn3:HeaderText = "Anmälningstyp".
        gridViewTextBoxColumn3:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewTextBoxColumn3:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn3:Name = "AnmAvk".
        gridViewTextBoxColumn3:Width = 164.
        gridViewTextBoxColumn4:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn4:FieldName = "AnmFullmAvk".
        gridViewTextBoxColumn4:HeaderText = "Fullmakt".
        gridViewTextBoxColumn4:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn4:IsVisible = FALSE.
        gridViewTextBoxColumn4:Name = "AnmFullmAvk".
        gridViewTextBoxColumn4:Width = 45.
        gridViewTextBoxColumn5:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn5:FieldName = "AnmHaelsofullmAvk".
        gridViewTextBoxColumn5:HeaderText = "Hälsofullmakt".
        gridViewTextBoxColumn5:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn5:IsVisible = FALSE.
        gridViewTextBoxColumn5:Name = "AnmHaelsofullmAvk".
        gridViewTextBoxColumn5:Width = 42.
        gridViewDecimalColumn2:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn2:FieldName = "AnvId".
        gridViewDecimalColumn2:HeaderText = "Användarid".
        gridViewDecimalColumn2:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDecimalColumn2:IsAutoGenerated = TRUE.
        gridViewDecimalColumn2:Name = "AnvId".
        gridViewDecimalColumn2:TextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDecimalColumn2:Width = 164.
        gridViewTextBoxColumn6:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn6:FieldName = "FlerArbGivAvk".
        gridViewTextBoxColumn6:HeaderText = "Fler arbetsgivare".
        gridViewTextBoxColumn6:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn6:IsVisible = FALSE.
        gridViewTextBoxColumn6:Name = "FlerArbGivAvk".
        gridViewTextBoxColumn6:Width = 51.
        gridViewCheckBoxColumn1:EnableExpressionEditor = FALSE.
        gridViewCheckBoxColumn1:FieldName = "GrundDataAendr".
        gridViewCheckBoxColumn1:HeaderText = "Ändrad".
        gridViewCheckBoxColumn1:IsAutoGenerated = TRUE.
        gridViewCheckBoxColumn1:IsVisible = FALSE.
        gridViewCheckBoxColumn1:MinWidth = 20.
        gridViewCheckBoxColumn1:Name = "GrundDataAendr".
        gridViewCheckBoxColumn1:Width = 39.
        gridViewDecimalColumn3:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn3:FieldName = "KopplId".
        gridViewDecimalColumn3:HeaderText = "Kopplingsid".
        gridViewDecimalColumn3:IsAutoGenerated = TRUE.
        gridViewDecimalColumn3:IsVisible = FALSE.
        gridViewDecimalColumn3:Name = "KopplId".
        gridViewDecimalColumn3:Width = 37.
        gridViewDateTimeColumn4:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn4:FieldName = "SkapDat".
        gridViewDateTimeColumn4:Format = System.Windows.Forms.DateTimePickerFormat:Short.
        gridViewDateTimeColumn4:HeaderText = "Skapad".
        gridViewDateTimeColumn4:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn4:IsVisible = FALSE.
        gridViewDateTimeColumn4:Name = "SkapDat".
/*        gridViewDateTimeColumn4:SortOrder = Telerik.WinControls.UI.RadSortOrder:Ascending.*/
        gridViewDateTimeColumn4:Width = 62.
        gridViewDecimalColumn4:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn4:FieldName = "DokId".
        gridViewDecimalColumn4:HeaderText = "Dokumentid".
        gridViewDecimalColumn4:HeaderTextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDecimalColumn4:IsAutoGenerated = TRUE.
        gridViewDecimalColumn4:Name = "DokId".
        gridViewDecimalColumn4:TextAlignment = System.Drawing.ContentAlignment:MiddleLeft.
        gridViewDecimalColumn4:Width = 160.
        gridViewDecimalColumn5:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn5:FieldName = "AerendeId".
        gridViewDecimalColumn5:HeaderText = "ÄrendeId".
        gridViewDecimalColumn5:IsAutoGenerated = TRUE.
        gridViewDecimalColumn5:IsVisible = FALSE.
        gridViewDecimalColumn5:Name = "AerendeId".
        gridViewDecimalColumn5:Width = 35.
        gridViewDateTimeColumn5:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn5:FieldName = "AerendeDat".
        gridViewDateTimeColumn5:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn5:HeaderText = "Ärendedatum".
        gridViewDateTimeColumn5:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn5:IsVisible = FALSE.
        gridViewDateTimeColumn5:Name = "AerendeDat".
        gridViewDateTimeColumn5:Width = 52.
        gridViewDecimalColumn6:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn6:FieldName = "UtanordAnvId".
        gridViewDecimalColumn6:HeaderText = "null".
        gridViewDecimalColumn6:IsAutoGenerated = TRUE.
        gridViewDecimalColumn6:IsVisible = FALSE.
        gridViewDecimalColumn6:Name = "UtanordAnvId".
        gridViewDecimalColumn6:Width = 21.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar0 AS Telerik.WinControls.UI.GridViewDataColumn EXTENT 18 NO-UNDO.
        arrayvar0[1] = gridViewDateTimeColumn1.
        arrayvar0[2] = gridViewTextBoxColumn1.
        arrayvar0[3] = gridViewDecimalColumn1.
        arrayvar0[4] = gridViewTextBoxColumn2.
        arrayvar0[5] = gridViewDateTimeColumn2.
        arrayvar0[6] = gridViewDateTimeColumn3.
        arrayvar0[7] = gridViewTextBoxColumn3.
        arrayvar0[8] = gridViewTextBoxColumn4.
        arrayvar0[9] = gridViewTextBoxColumn5.
        arrayvar0[10] = gridViewDecimalColumn2.
        arrayvar0[11] = gridViewTextBoxColumn6.
        arrayvar0[12] = gridViewCheckBoxColumn1.
        arrayvar0[13] = gridViewDecimalColumn3.
        arrayvar0[14] = gridViewDateTimeColumn4.
        arrayvar0[15] = gridViewDecimalColumn4.
        arrayvar0[16] = gridViewDecimalColumn5.
        arrayvar0[17] = gridViewDateTimeColumn5.
        arrayvar0[18] = gridViewDecimalColumn6.
        THIS-OBJECT:radGridView1:MasterTemplate:Columns:AddRange(arrayvar0).
        THIS-OBJECT:radGridView1:MasterTemplate:DataSource = THIS-OBJECT:bindingSource1.
        THIS-OBJECT:radGridView1:MasterTemplate:EnableAlternatingRowColor = TRUE.
        THIS-OBJECT:radGridView1:MasterTemplate:ShowRowHeaderColumn = FALSE.
        sortDescriptor1:Direction = System.ComponentModel.ListSortDirection:Descending.
        sortDescriptor1:PropertyName = "TolkAerendeDat".
        sortDescriptor2:PropertyName = "SkapDat".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar1 AS Telerik.WinControls.Data.SortDescriptor EXTENT 2 NO-UNDO.
        arrayvar1[1] = sortDescriptor1.
        arrayvar1[2] = sortDescriptor2.
        THIS-OBJECT:radGridView1:MasterTemplate:SortDescriptors:AddRange(arrayvar1).
        THIS-OBJECT:radGridView1:MasterTemplate:ViewDefinition = tableViewDefinition1.
        THIS-OBJECT:radGridView1:Name = "radGridView1".
        THIS-OBJECT:radGridView1:ReadOnly = TRUE.
        THIS-OBJECT:radGridView1:RightToLeft = System.Windows.Forms.RightToLeft:No.
        THIS-OBJECT:radGridView1:Size = NEW System.Drawing.Size(1488, 279).
        THIS-OBJECT:radGridView1:TabIndex = 1.
        THIS-OBJECT:radGridView1:Text = "radGridView1".
        THIS-OBJECT:radGridView1:SelectionChanged:Subscribe(THIS-OBJECT:radGridView1_SelectionChanged_1).
        THIS-OBJECT:radGridView1:Click:Subscribe(THIS-OBJECT:radGridView1_Click).
        THIS-OBJECT:radGridView1:DoubleClick:Subscribe(THIS-OBJECT:radGridView1_DoubleClick).
        /*  */
        /* bindingSource1 */
        /*  */
        THIS-OBJECT:bindingSource1:MaxDataGuess = 0.
        THIS-OBJECT:bindingSource1:NoLOBs = FALSE.
        THIS-OBJECT:bindingSource1:Position = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar2 AS "Progress.Data.TableDesc[]" NO-UNDO.
        arrayvar2 = NEW "Progress.Data.TableDesc[]"(0).
        tableDesc1:ChildTables = arrayvar2.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar3 AS Progress.Data.ColumnPropDesc EXTENT 18 NO-UNDO.
        arrayvar3[1] = NEW Progress.Data.ColumnPropDesc("TolkAerendeDat", "Tolkat ärendedatum", Progress.Data.DataType:DATE).
        arrayvar3[2] = NEW Progress.Data.ColumnPropDesc("ProduktGrpAvk", "Produktgrupp", Progress.Data.DataType:CHARACTER).
        arrayvar3[3] = NEW Progress.Data.ColumnPropDesc("AerendeNr", "Ärendenummer", Progress.Data.DataType:DECIMAL).
        arrayvar3[4] = NEW Progress.Data.ColumnPropDesc("AerendeStatAvk", "Status", Progress.Data.DataType:CHARACTER).
        arrayvar3[5] = NEW Progress.Data.ColumnPropDesc("AerendeStatUpdDat", "Senast uppdaterad", Progress.Data.DataType:DATE).
        arrayvar3[6] = NEW Progress.Data.ColumnPropDesc("AnkDat", "Inkom datum", Progress.Data.DataType:DATE).
        arrayvar3[7] = NEW Progress.Data.ColumnPropDesc("AnmAvk", "Anmälningstyp", Progress.Data.DataType:CHARACTER).
        arrayvar3[8] = NEW Progress.Data.ColumnPropDesc("AnmFullmAvk", "Fullmakt", Progress.Data.DataType:CHARACTER).
        arrayvar3[9] = NEW Progress.Data.ColumnPropDesc("AnmHaelsofullmAvk", "Hälsofullmakt", Progress.Data.DataType:CHARACTER).
        arrayvar3[10] = NEW Progress.Data.ColumnPropDesc("AnvId", "Användarid", Progress.Data.DataType:DECIMAL).
        arrayvar3[11] = NEW Progress.Data.ColumnPropDesc("DokId", "Dokumentid", Progress.Data.DataType:DECIMAL).
        arrayvar3[12] = NEW Progress.Data.ColumnPropDesc("FlerArbGivAvk", "Fler arbetsgivare", Progress.Data.DataType:CHARACTER).
        arrayvar3[13] = NEW Progress.Data.ColumnPropDesc("GrundDataAendr", "Ändrad", Progress.Data.DataType:LOGICAL).
        arrayvar3[14] = NEW Progress.Data.ColumnPropDesc("KopplId", "Kopplingsid", Progress.Data.DataType:DECIMAL).
        arrayvar3[15] = NEW Progress.Data.ColumnPropDesc("SkapDat", "Skapat", Progress.Data.DataType:DATE).
        arrayvar3[16] = NEW Progress.Data.ColumnPropDesc("AerendeId", "ÄrendeId", Progress.Data.DataType:DECIMAL).
        arrayvar3[17] = NEW Progress.Data.ColumnPropDesc("AerendeDat", "Ärendedatum", Progress.Data.DataType:DATE).
        arrayvar3[18] = NEW Progress.Data.ColumnPropDesc("UtanordAnvId", "null", Progress.Data.DataType:DECIMAL).
        tableDesc1:Columns = arrayvar3.
        THIS-OBJECT:bindingSource1:TableSchema = tableDesc1.
        /*  */
        /* radLabel1 */
        /*  */
        THIS-OBJECT:radLabel1:Location = NEW System.Drawing.Point(13, 14).
        THIS-OBJECT:radLabel1:Name = "radLabel1".
        THIS-OBJECT:radLabel1:Size = NEW System.Drawing.Size(85, 18).
        THIS-OBJECT:radLabel1:TabIndex = 2.
        THIS-OBJECT:radLabel1:Text = "Personnummer:".
        /*  */
        /* radSplitButton1 */
        /*  */
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar4 AS Telerik.WinControls.RadItem EXTENT 5 NO-UNDO.
        arrayvar4[1] = THIS-OBJECT:radMenuItem1.
        arrayvar4[2] = THIS-OBJECT:radMenuItem2.
        arrayvar4[3] = THIS-OBJECT:radMenuItem3.
        arrayvar4[4] = THIS-OBJECT:radMenuItem4.
        arrayvar4[5] = THIS-OBJECT:radMenuItem5.
        THIS-OBJECT:radSplitButton1:Items:AddRange(arrayvar4).
        THIS-OBJECT:radSplitButton1:Location = NEW System.Drawing.Point(1390, 14).
        THIS-OBJECT:radSplitButton1:Name = "radSplitButton1".
        THIS-OBJECT:radSplitButton1:Size = NEW System.Drawing.Size(110, 24).
        THIS-OBJECT:radSplitButton1:TabIndex = 4.
        THIS-OBJECT:radSplitButton1:Text = "Välj tema".
        /*  */
        /* radMenuItem1 */
        /*  */
        THIS-OBJECT:radMenuItem1:Name = "radMenuItem1".
        THIS-OBJECT:radMenuItem1:Text = "Standard".
        THIS-OBJECT:radMenuItem1:Click:Subscribe(THIS-OBJECT:radMenuItem1_Click).
        /*  */
        /* radMenuItem2 */
        /*  */
        THIS-OBJECT:radMenuItem2:Name = "radMenuItem2".
        THIS-OBJECT:radMenuItem2:Text = "Mörkt".
        THIS-OBJECT:radMenuItem2:Click:Subscribe(THIS-OBJECT:radMenuItem2_Click).
        /*  */
        /* radMenuItem3 */
        /*  */
        THIS-OBJECT:radMenuItem3:Name = "radMenuItem3".
        THIS-OBJECT:radMenuItem3:Text = "Metro".
        THIS-OBJECT:radMenuItem3:Click:Subscribe(THIS-OBJECT:radMenuItem3_Click).
        /*  */
        /* radMenuItem4 */
        /*  */
        THIS-OBJECT:radMenuItem4:Name = "radMenuItem4".
        THIS-OBJECT:radMenuItem4:Text = "Metro Blue".
        THIS-OBJECT:radMenuItem4:Click:Subscribe(THIS-OBJECT:radMenuItem4_Click).
        /*  */
        /* radMenuItem5 */
        /*  */
        THIS-OBJECT:radMenuItem5:Name = "radMenuItem5".
        THIS-OBJECT:radMenuItem5:Text = "Ljust".
        THIS-OBJECT:radMenuItem5:Click:Subscribe(THIS-OBJECT:radMenuItem5_Click).
        /*  */
        /* radStatusStrip1 */
        /*  */
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar5 AS Telerik.WinControls.RadItem EXTENT 23 NO-UNDO.
        arrayvar5[1] = THIS-OBJECT:radLabelElement1.
        arrayvar5[2] = THIS-OBJECT:radLabelBarAerenden.
        arrayvar5[3] = THIS-OBJECT:commandBarSeparator1.
        arrayvar5[4] = THIS-OBJECT:radProgressBarElement1.
        arrayvar5[5] = THIS-OBJECT:statustid.
        arrayvar5[6] = THIS-OBJECT:commandBarSeparator2.
        arrayvar5[7] = THIS-OBJECT:radLabelElement2.
        arrayvar5[8] = THIS-OBJECT:statussignalant.
        arrayvar5[9] = THIS-OBJECT:commandBarSeparator3.
        arrayvar5[10] = THIS-OBJECT:radProgressBarElement2.
        arrayvar5[11] = THIS-OBJECT:statussignaltid.
        arrayvar5[12] = THIS-OBJECT:commandBarSeparator4.
        arrayvar5[13] = THIS-OBJECT:radLabelElement3.
        arrayvar5[14] = THIS-OBJECT:statusbet.
        arrayvar5[15] = THIS-OBJECT:commandBarSeparator5.
        arrayvar5[16] = THIS-OBJECT:statusProgressBet.
        arrayvar5[17] = THIS-OBJECT:statusbettid.
        arrayvar5[18] = THIS-OBJECT:commandBarSeparator6.
        arrayvar5[19] = THIS-OBJECT:radLabelElement4.
        arrayvar5[20] = THIS-OBJECT:statusdokant.
        arrayvar5[21] = THIS-OBJECT:commandBarSeparator7.
        arrayvar5[22] = THIS-OBJECT:statusprogdok.
        arrayvar5[23] = THIS-OBJECT:statusdoktid.
        THIS-OBJECT:radStatusStrip1:Items:AddRange(arrayvar5).
        THIS-OBJECT:radStatusStrip1:Location = NEW System.Drawing.Point(0, 736).
        THIS-OBJECT:radStatusStrip1:Name = "radStatusStrip1".
        THIS-OBJECT:radStatusStrip1:Size = NEW System.Drawing.Size(1516, 26).
        THIS-OBJECT:radStatusStrip1:TabIndex = 5.
        THIS-OBJECT:radStatusStrip1:Text = "radStatusStrip1".
        /*  */
        /* radLabelElement1 */
        /*  */
        THIS-OBJECT:radLabelElement1:Name = "radLabelElement1".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:radLabelElement1, FALSE).
        THIS-OBJECT:radLabelElement1:Text = "Antal ärenden:".
        THIS-OBJECT:radLabelElement1:TextWrap = TRUE.
        /*  */
        /* radLabelBarAerenden */
        /*  */
        THIS-OBJECT:radLabelBarAerenden:Name = "radLabelBarAerenden".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:radLabelBarAerenden, FALSE).
        THIS-OBJECT:radLabelBarAerenden:Text = "".
        THIS-OBJECT:radLabelBarAerenden:TextWrap = TRUE.
        /*  */
        /* commandBarSeparator1 */
        /*  */
        THIS-OBJECT:commandBarSeparator1:Name = "commandBarSeparator1".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:commandBarSeparator1, FALSE).
        THIS-OBJECT:commandBarSeparator1:VisibleInOverflowMenu = FALSE.
        /*  */
        /* radProgressBarElement1 */
        /*  */
        THIS-OBJECT:radProgressBarElement1:Name = "radProgressBarElement1".
        THIS-OBJECT:radProgressBarElement1:SeparatorColor1 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement1:SeparatorColor2 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement1:SeparatorColor3 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement1:SeparatorColor4 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement1:SeparatorGradientAngle = 0.
        THIS-OBJECT:radProgressBarElement1:SeparatorGradientPercentage1 = Progress.Util.CastUtil:ToSingle(0.4).
        THIS-OBJECT:radProgressBarElement1:SeparatorGradientPercentage2 = Progress.Util.CastUtil:ToSingle(0.6).
        THIS-OBJECT:radProgressBarElement1:SeparatorNumberOfColors = 2.
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:radProgressBarElement1, FALSE).
        THIS-OBJECT:radProgressBarElement1:Step = 4.
        THIS-OBJECT:radProgressBarElement1:StepWidth = 33.
        THIS-OBJECT:radProgressBarElement1:SweepAngle = 80.
        THIS-OBJECT:radProgressBarElement1:Text = "".
        THIS-OBJECT:radProgressBarElement1:Value2 = 0.
        /*  */
        /* statustid */
        /*  */
        THIS-OBJECT:statustid:Name = "statustid".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statustid, FALSE).
        THIS-OBJECT:statustid:Text = "".
        THIS-OBJECT:statustid:TextWrap = TRUE.
        /*  */
        /* commandBarSeparator2 */
        /*  */
        THIS-OBJECT:commandBarSeparator2:Name = "commandBarSeparator2".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:commandBarSeparator2, FALSE).
        THIS-OBJECT:commandBarSeparator2:VisibleInOverflowMenu = FALSE.
        /*  */
        /* radLabelElement2 */
        /*  */
        THIS-OBJECT:radLabelElement2:Name = "radLabelElement2".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:radLabelElement2, FALSE).
        THIS-OBJECT:radLabelElement2:Text = "Antal signaler:".
        THIS-OBJECT:radLabelElement2:TextWrap = TRUE.
        /*  */
        /* statussignalant */
        /*  */
        THIS-OBJECT:statussignalant:Name = "statussignalant".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statussignalant, FALSE).
        THIS-OBJECT:statussignalant:Text = "".
        THIS-OBJECT:statussignalant:TextWrap = TRUE.
        /*  */
        /* commandBarSeparator3 */
        /*  */
        THIS-OBJECT:commandBarSeparator3:Name = "commandBarSeparator3".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:commandBarSeparator3, FALSE).
        THIS-OBJECT:commandBarSeparator3:VisibleInOverflowMenu = FALSE.
        /*  */
        /* radProgressBarElement2 */
        /*  */
        THIS-OBJECT:radProgressBarElement2:Name = "radProgressBarElement2".
        THIS-OBJECT:radProgressBarElement2:SeparatorColor1 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement2:SeparatorColor2 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement2:SeparatorColor3 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement2:SeparatorColor4 = System.Drawing.Color:White.
        THIS-OBJECT:radProgressBarElement2:SeparatorGradientAngle = 0.
        THIS-OBJECT:radProgressBarElement2:SeparatorGradientPercentage1 = Progress.Util.CastUtil:ToSingle(0.4).
        THIS-OBJECT:radProgressBarElement2:SeparatorGradientPercentage2 = Progress.Util.CastUtil:ToSingle(0.6).
        THIS-OBJECT:radProgressBarElement2:SeparatorNumberOfColors = 2.
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:radProgressBarElement2, FALSE).
        THIS-OBJECT:radProgressBarElement2:StepWidth = 14.
        THIS-OBJECT:radProgressBarElement2:SweepAngle = 90.
        THIS-OBJECT:radProgressBarElement2:Text = "".
        /*  */
        /* statussignaltid */
        /*  */
        THIS-OBJECT:statussignaltid:Name = "statussignaltid".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statussignaltid, FALSE).
        THIS-OBJECT:statussignaltid:Text = "".
        THIS-OBJECT:statussignaltid:TextWrap = TRUE.
        /*  */
        /* commandBarSeparator4 */
        /*  */
        THIS-OBJECT:commandBarSeparator4:Name = "commandBarSeparator4".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:commandBarSeparator4, FALSE).
        THIS-OBJECT:commandBarSeparator4:VisibleInOverflowMenu = FALSE.
        /*  */
        /* radLabelElement3 */
        /*  */
        THIS-OBJECT:radLabelElement3:Name = "radLabelElement3".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:radLabelElement3, FALSE).
        THIS-OBJECT:radLabelElement3:Text = "Antal betalningar:".
        THIS-OBJECT:radLabelElement3:TextWrap = TRUE.
        /*  */
        /* statusbet */
        /*  */
        THIS-OBJECT:statusbet:Name = "statusbet".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statusbet, FALSE).
        THIS-OBJECT:statusbet:Text = "".
        THIS-OBJECT:statusbet:TextWrap = TRUE.
        /*  */
        /* commandBarSeparator5 */
        /*  */
        THIS-OBJECT:commandBarSeparator5:Name = "commandBarSeparator5".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:commandBarSeparator5, FALSE).
        THIS-OBJECT:commandBarSeparator5:VisibleInOverflowMenu = FALSE.
        /*  */
        /* statusProgressBet */
        /*  */
        THIS-OBJECT:statusProgressBet:Name = "statusProgressBet".
        THIS-OBJECT:statusProgressBet:SeparatorColor1 = System.Drawing.Color:White.
        THIS-OBJECT:statusProgressBet:SeparatorColor2 = System.Drawing.Color:White.
        THIS-OBJECT:statusProgressBet:SeparatorColor3 = System.Drawing.Color:White.
        THIS-OBJECT:statusProgressBet:SeparatorColor4 = System.Drawing.Color:White.
        THIS-OBJECT:statusProgressBet:SeparatorGradientAngle = 0.
        THIS-OBJECT:statusProgressBet:SeparatorGradientPercentage1 = Progress.Util.CastUtil:ToSingle(0.4).
        THIS-OBJECT:statusProgressBet:SeparatorGradientPercentage2 = Progress.Util.CastUtil:ToSingle(0.6).
        THIS-OBJECT:statusProgressBet:SeparatorNumberOfColors = 2.
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statusProgressBet, FALSE).
        THIS-OBJECT:statusProgressBet:StepWidth = 14.
        THIS-OBJECT:statusProgressBet:SweepAngle = 90.
        THIS-OBJECT:statusProgressBet:Text = "".
        /*  */
        /* statusbettid */
        /*  */
        THIS-OBJECT:statusbettid:Name = "statusbettid".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statusbettid, FALSE).
        THIS-OBJECT:statusbettid:Text = "".
        THIS-OBJECT:statusbettid:TextWrap = TRUE.
        /*  */
        /* commandBarSeparator6 */
        /*  */
        THIS-OBJECT:commandBarSeparator6:Name = "commandBarSeparator6".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:commandBarSeparator6, FALSE).
        THIS-OBJECT:commandBarSeparator6:VisibleInOverflowMenu = FALSE.
        /*  */
        /* radLabelElement4 */
        /*  */
        THIS-OBJECT:radLabelElement4:Name = "radLabelElement4".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:radLabelElement4, FALSE).
        THIS-OBJECT:radLabelElement4:Text = "Antal dokument:".
        THIS-OBJECT:radLabelElement4:TextWrap = TRUE.
        /*  */
        /* statusdokant */
        /*  */
        THIS-OBJECT:statusdokant:Name = "statusdokant".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statusdokant, FALSE).
        THIS-OBJECT:statusdokant:Text = "".
        THIS-OBJECT:statusdokant:TextWrap = TRUE.
        /*  */
        /* commandBarSeparator7 */
        /*  */
        THIS-OBJECT:commandBarSeparator7:Name = "commandBarSeparator7".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:commandBarSeparator7, FALSE).
        THIS-OBJECT:commandBarSeparator7:VisibleInOverflowMenu = FALSE.
        /*  */
        /* statusprogdok */
        /*  */
        THIS-OBJECT:statusprogdok:Name = "statusprogdok".
        THIS-OBJECT:statusprogdok:SeparatorColor1 = System.Drawing.Color:White.
        THIS-OBJECT:statusprogdok:SeparatorColor2 = System.Drawing.Color:White.
        THIS-OBJECT:statusprogdok:SeparatorColor3 = System.Drawing.Color:White.
        THIS-OBJECT:statusprogdok:SeparatorColor4 = System.Drawing.Color:White.
        THIS-OBJECT:statusprogdok:SeparatorGradientAngle = 0.
        THIS-OBJECT:statusprogdok:SeparatorGradientPercentage1 = Progress.Util.CastUtil:ToSingle(0.4).
        THIS-OBJECT:statusprogdok:SeparatorGradientPercentage2 = Progress.Util.CastUtil:ToSingle(0.6).
        THIS-OBJECT:statusprogdok:SeparatorNumberOfColors = 2.
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statusprogdok, FALSE).
        THIS-OBJECT:statusprogdok:StepWidth = 14.
        THIS-OBJECT:statusprogdok:SweepAngle = 90.
        THIS-OBJECT:statusprogdok:Text = "".
        /*  */
        /* statusdoktid */
        /*  */
        THIS-OBJECT:statusdoktid:Name = "statusdoktid".
        THIS-OBJECT:radStatusStrip1:SetSpring(THIS-OBJECT:statusdoktid, FALSE).
        THIS-OBJECT:statusdoktid:Text = "".
        THIS-OBJECT:statusdoktid:TextWrap = TRUE.
        /*  */
        /* bindingSource2 */
        /*  */
        THIS-OBJECT:bindingSource2:MaxDataGuess = 0.
        THIS-OBJECT:bindingSource2:NoLOBs = FALSE.
        THIS-OBJECT:bindingSource2:Position = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar6 AS "Progress.Data.TableDesc[]" NO-UNDO.
        arrayvar6 = NEW "Progress.Data.TableDesc[]"(0).
        tableDesc2:ChildTables = arrayvar6.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar7 AS Progress.Data.ColumnPropDesc EXTENT 9 NO-UNDO.
        arrayvar7[1] = NEW Progress.Data.ColumnPropDesc("ProgramAvk", "null", Progress.Data.DataType:CHARACTER).
        arrayvar7[2] = NEW Progress.Data.ColumnPropDesc("SignalDat", "null", Progress.Data.DataType:DATE).
        arrayvar7[3] = NEW Progress.Data.ColumnPropDesc("SignalId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar7[4] = NEW Progress.Data.ColumnPropDesc("SignalParamVaerde", "null", Progress.Data.DataType:CHARACTER).
        arrayvar7[5] = NEW Progress.Data.ColumnPropDesc("SignalStat", "null", Progress.Data.DataType:LOGICAL).
        arrayvar7[6] = NEW Progress.Data.ColumnPropDesc("SignalText", "Namn", Progress.Data.DataType:CHARACTER).
        arrayvar7[7] = NEW Progress.Data.ColumnPropDesc("SignalTextParamVaerde", "null", Progress.Data.DataType:CHARACTER).
        arrayvar7[8] = NEW Progress.Data.ColumnPropDesc("SignalTidp", "Skapad", Progress.Data.DataType:INTEGER).
        arrayvar7[9] = NEW Progress.Data.ColumnPropDesc("SignalTypAvk", "null", Progress.Data.DataType:CHARACTER).
        tableDesc2:Columns = arrayvar7.
        THIS-OBJECT:bindingSource2:TableSchema = tableDesc2.
        /*  */
        /* radGridView2 */
        /*  */
        THIS-OBJECT:radGridView2:BackColor = System.Drawing.SystemColors:Control.
        THIS-OBJECT:radGridView2:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:radGridView2:Font = NEW System.Drawing.Font("Segoe UI", Progress.Util.CastUtil:ToSingle(8.25)).
        THIS-OBJECT:radGridView2:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:radGridView2:ImeMode = System.Windows.Forms.ImeMode:NoControl.
        THIS-OBJECT:radGridView2:Location = NEW System.Drawing.Point(13, 340).
        /*  */
        /*  */
        /*  */
        THIS-OBJECT:radGridView2:MasterTemplate:AllowAddNewRow = FALSE.
        gridViewTextBoxColumn7:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn7:FieldName = "ProgramAvk".
        gridViewTextBoxColumn7:HeaderText = "null".
        gridViewTextBoxColumn7:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn7:IsVisible = FALSE.
        gridViewTextBoxColumn7:Name = "ProgramAvk".
        gridViewDateTimeColumn6:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn6:FieldName = "SignalDat".
        gridViewDateTimeColumn6:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn6:FormatString = "~{0:yyyy-MM-dd~}".
        gridViewDateTimeColumn6:HeaderText = "Datum".
        gridViewDateTimeColumn6:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn6:Name = "SignalDat".
        gridViewDateTimeColumn6:Width = 96.
        gridViewDecimalColumn7:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn7:FieldName = "SignalId".
        gridViewDecimalColumn7:HeaderText = "null".
        gridViewDecimalColumn7:IsAutoGenerated = TRUE.
        gridViewDecimalColumn7:IsVisible = FALSE.
        gridViewDecimalColumn7:Name = "SignalId".
        gridViewTextBoxColumn8:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn8:FieldName = "SignalParamVaerde".
        gridViewTextBoxColumn8:HeaderText = "null".
        gridViewTextBoxColumn8:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn8:IsVisible = FALSE.
        gridViewTextBoxColumn8:Name = "SignalParamVaerde".
        gridViewCheckBoxColumn2:EnableExpressionEditor = FALSE.
        gridViewCheckBoxColumn2:FieldName = "SignalStat".
        gridViewCheckBoxColumn2:HeaderText = "null".
        gridViewCheckBoxColumn2:IsAutoGenerated = TRUE.
        gridViewCheckBoxColumn2:IsVisible = FALSE.
        gridViewCheckBoxColumn2:MinWidth = 20.
        gridViewCheckBoxColumn2:Name = "SignalStat".
        gridViewTextBoxColumn9:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn9:FieldName = "SignalText".
        gridViewTextBoxColumn9:HeaderText = "Namn".
        gridViewTextBoxColumn9:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn9:IsVisible = FALSE.
        gridViewTextBoxColumn9:Name = "SignalText".
        gridViewTextBoxColumn10:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn10:FieldName = "SignalTextParamVaerde".
        gridViewTextBoxColumn10:HeaderText = "null".
        gridViewTextBoxColumn10:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn10:IsVisible = FALSE.
        gridViewTextBoxColumn10:Name = "SignalTextParamVaerde".
        gridViewDecimalColumn8:DataType = Progress.Util.TypeHelper:GetType("System.Int32").
        gridViewDecimalColumn8:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn8:FieldName = "SignalTidp".
        gridViewDecimalColumn8:HeaderText = "Skapad".
        gridViewDecimalColumn8:IsAutoGenerated = TRUE.
        gridViewDecimalColumn8:IsVisible = FALSE.
        gridViewDecimalColumn8:Name = "SignalTidp".
        gridViewTextBoxColumn11:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn11:FieldName = "SignalTypAvk".
        gridViewTextBoxColumn11:HeaderText = "Signaltyp".
        gridViewTextBoxColumn11:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn11:Name = "SignalTypAvk".
        gridViewTextBoxColumn11:Width = 252.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar8 AS Telerik.WinControls.UI.GridViewDataColumn EXTENT 9 NO-UNDO.
        arrayvar8[1] = gridViewTextBoxColumn7.
        arrayvar8[2] = gridViewDateTimeColumn6.
        arrayvar8[3] = gridViewDecimalColumn7.
        arrayvar8[4] = gridViewTextBoxColumn8.
        arrayvar8[5] = gridViewCheckBoxColumn2.
        arrayvar8[6] = gridViewTextBoxColumn9.
        arrayvar8[7] = gridViewTextBoxColumn10.
        arrayvar8[8] = gridViewDecimalColumn8.
        arrayvar8[9] = gridViewTextBoxColumn11.
        THIS-OBJECT:radGridView2:MasterTemplate:Columns:AddRange(arrayvar8).
        THIS-OBJECT:radGridView2:MasterTemplate:DataSource = THIS-OBJECT:bindingSource2.
        THIS-OBJECT:radGridView2:MasterTemplate:ShowRowHeaderColumn = FALSE.
        THIS-OBJECT:radGridView2:MasterTemplate:ViewDefinition = tableViewDefinition2.
        THIS-OBJECT:radGridView2:Name = "radGridView2".
        THIS-OBJECT:radGridView2:ReadOnly = TRUE.
        THIS-OBJECT:radGridView2:RightToLeft = System.Windows.Forms.RightToLeft:No.
        THIS-OBJECT:radGridView2:ShowGroupPanel = FALSE.
        THIS-OBJECT:radGridView2:Size = NEW System.Drawing.Size(351, 390).
        THIS-OBJECT:radGridView2:TabIndex = 6.
        THIS-OBJECT:radGridView2:Text = "radGridView2".
        /*  */
        /* radGridView3 */
        /*  */
        THIS-OBJECT:radGridView3:BackColor = System.Drawing.SystemColors:Control.
        THIS-OBJECT:radGridView3:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:radGridView3:Font = NEW System.Drawing.Font("Segoe UI", Progress.Util.CastUtil:ToSingle(8.25)).
        THIS-OBJECT:radGridView3:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:radGridView3:ImeMode = System.Windows.Forms.ImeMode:NoControl.
        THIS-OBJECT:radGridView3:Location = NEW System.Drawing.Point(370, 340).
        /*  */
        /*  */
        /*  */
        THIS-OBJECT:radGridView3:MasterTemplate:AllowAddNewRow = FALSE.
        gridViewDecimalColumn9:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn9:FieldName = "ArbGivAvgUnderlagBel".
        gridViewDecimalColumn9:HeaderText = "null".
        gridViewDecimalColumn9:IsAutoGenerated = TRUE.
        gridViewDecimalColumn9:IsVisible = FALSE.
        gridViewDecimalColumn9:Name = "ArbGivAvgUnderlagBel".
        gridViewDecimalColumn10:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn10:FieldName = "BeslRadId".
        gridViewDecimalColumn10:HeaderText = "null".
        gridViewDecimalColumn10:IsAutoGenerated = TRUE.
        gridViewDecimalColumn10:IsVisible = FALSE.
        gridViewDecimalColumn10:Name = "BeslRadId".
        gridViewDateTimeColumn7:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn7:FieldName = "BetDat".
        gridViewDateTimeColumn7:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn7:FormatString = "~{0:yyyy-MM-dd~}".
        gridViewDateTimeColumn7:HeaderText = "Betalningsdatum".
        gridViewDateTimeColumn7:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn7:Name = "BetDat".
        gridViewDateTimeColumn7:Width = 102.
        gridViewDecimalColumn11:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn11:FieldName = "BetId".
        gridViewDecimalColumn11:HeaderText = "null".
        gridViewDecimalColumn11:IsAutoGenerated = TRUE.
        gridViewDecimalColumn11:IsVisible = FALSE.
        gridViewDecimalColumn11:Name = "BetId".
        gridViewTextBoxColumn12:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn12:FieldName = "BetMotTypAvk".
        gridViewTextBoxColumn12:HeaderText = "Mottagare".
        gridViewTextBoxColumn12:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn12:IsVisible = FALSE.
        gridViewTextBoxColumn12:Name = "BetMotTypAvk".
        gridViewTextBoxColumn12:Width = 75.
        gridViewTextBoxColumn13:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn13:FieldName = "BetStatAvk".
        gridViewTextBoxColumn13:HeaderText = "Status".
        gridViewTextBoxColumn13:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn13:Name = "BetStatAvk".
        gridViewTextBoxColumn13:Width = 181.
        gridViewDecimalColumn12:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn12:FieldName = "BetTillfId".
        gridViewDecimalColumn12:HeaderText = "null".
        gridViewDecimalColumn12:IsAutoGenerated = TRUE.
        gridViewDecimalColumn12:IsVisible = FALSE.
        gridViewDecimalColumn12:Name = "BetTillfId".
        gridViewTextBoxColumn14:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn14:FieldName = "BetTypAvk".
        gridViewTextBoxColumn14:HeaderText = "Betalningstyp".
        gridViewTextBoxColumn14:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn14:Name = "BetTypAvk".
        gridViewTextBoxColumn14:Width = 88.
        gridViewDecimalColumn13:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn13:FieldName = "Bel".
        gridViewDecimalColumn13:HeaderText = "Belopp".
        gridViewDecimalColumn13:IsAutoGenerated = TRUE.
        gridViewDecimalColumn13:Name = "Bel".
        gridViewDecimalColumn13:ThousandsSeparator = TRUE.
        gridViewDecimalColumn13:Width = 82.
        gridViewDecimalColumn14:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn14:FieldName = "BokfId".
        gridViewDecimalColumn14:HeaderText = "null".
        gridViewDecimalColumn14:IsAutoGenerated = TRUE.
        gridViewDecimalColumn14:IsVisible = FALSE.
        gridViewDecimalColumn14:Name = "BokfId".
        gridViewTextBoxColumn15:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn15:FieldName = "BokfProduktTypKod".
        gridViewTextBoxColumn15:HeaderText = "null".
        gridViewTextBoxColumn15:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn15:IsVisible = FALSE.
        gridViewTextBoxColumn15:Name = "BokfProduktTypKod".
        gridViewDecimalColumn15:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn15:FieldName = "BruttoBel".
        gridViewDecimalColumn15:HeaderText = "Bruttobelopp".
        gridViewDecimalColumn15:IsAutoGenerated = TRUE.
        gridViewDecimalColumn15:Name = "BruttoBel".
        gridViewDecimalColumn15:ThousandsSeparator = TRUE.
        gridViewDecimalColumn15:Width = 88.
        gridViewDecimalColumn16:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn16:FieldName = "EngId".
        gridViewDecimalColumn16:HeaderText = "null".
        gridViewDecimalColumn16:IsAutoGenerated = TRUE.
        gridViewDecimalColumn16:IsVisible = FALSE.
        gridViewDecimalColumn16:Name = "EngId".
        gridViewCheckBoxColumn3:EnableExpressionEditor = FALSE.
        gridViewCheckBoxColumn3:FieldName = "Konv".
        gridViewCheckBoxColumn3:HeaderText = "null".
        gridViewCheckBoxColumn3:IsAutoGenerated = TRUE.
        gridViewCheckBoxColumn3:IsVisible = FALSE.
        gridViewCheckBoxColumn3:MinWidth = 20.
        gridViewCheckBoxColumn3:Name = "Konv".
        gridViewDecimalColumn17:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn17:FieldName = "LoeneSkattBel".
        gridViewDecimalColumn17:HeaderText = "Löneskattbelopp".
        gridViewDecimalColumn17:IsAutoGenerated = TRUE.
        gridViewDecimalColumn17:IsVisible = FALSE.
        gridViewDecimalColumn17:Name = "LoeneSkattBel".
        gridViewDecimalColumn17:Width = 94.
        gridViewDecimalColumn18:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn18:FieldName = "MotGatuId".
        gridViewDecimalColumn18:HeaderText = "null".
        gridViewDecimalColumn18:IsAutoGenerated = TRUE.
        gridViewDecimalColumn18:IsVisible = FALSE.
        gridViewDecimalColumn18:Name = "MotGatuId".
        gridViewDecimalColumn19:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn19:FieldName = "MotKontoId".
        gridViewDecimalColumn19:HeaderText = "null".
        gridViewDecimalColumn19:IsAutoGenerated = TRUE.
        gridViewDecimalColumn19:IsVisible = FALSE.
        gridViewDecimalColumn19:Name = "MotKontoId".
        gridViewCheckBoxColumn4:EnableExpressionEditor = FALSE.
        gridViewCheckBoxColumn4:FieldName = "Raenta".
        gridViewCheckBoxColumn4:HeaderText = "Ränta".
        gridViewCheckBoxColumn4:IsAutoGenerated = TRUE.
        gridViewCheckBoxColumn4:IsVisible = FALSE.
        gridViewCheckBoxColumn4:MinWidth = 20.
        gridViewCheckBoxColumn4:Name = "Raenta".
        gridViewDecimalColumn20:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn20:FieldName = "SkatteBel".
        gridViewDecimalColumn20:HeaderText = "Skatt".
        gridViewDecimalColumn20:IsAutoGenerated = TRUE.
        gridViewDecimalColumn20:Name = "SkatteBel".
        gridViewDecimalColumn20:ThousandsSeparator = TRUE.
        gridViewDecimalColumn20:Width = 96.
        gridViewDecimalColumn21:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn21:FieldName = "SocAvgBel".
        gridViewDecimalColumn21:HeaderText = "Sociala avgifter".
        gridViewDecimalColumn21:IsAutoGenerated = TRUE.
        gridViewDecimalColumn21:Name = "SocAvgBel".
        gridViewDecimalColumn21:ThousandsSeparator = TRUE.
        gridViewDecimalColumn21:Width = 92.
        gridViewDecimalColumn22:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn22:FieldName = "TransId".
        gridViewDecimalColumn22:HeaderText = "null".
        gridViewDecimalColumn22:IsAutoGenerated = TRUE.
        gridViewDecimalColumn22:IsVisible = FALSE.
        gridViewDecimalColumn22:Name = "TransId".
        gridViewDateTimeColumn8:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn8:FieldName = "UppdDatTidpTz".
        gridViewDateTimeColumn8:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn8:HeaderText = "null".
        gridViewDateTimeColumn8:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn8:IsVisible = FALSE.
        gridViewDateTimeColumn8:Name = "UppdDatTidpTz".
        gridViewTextBoxColumn16:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn16:FieldName = "UrspRappPeriod".
        gridViewTextBoxColumn16:HeaderText = "null".
        gridViewTextBoxColumn16:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn16:IsVisible = FALSE.
        gridViewTextBoxColumn16:Name = "UrspRappPeriod".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar9 AS Telerik.WinControls.UI.GridViewDataColumn EXTENT 23 NO-UNDO.
        arrayvar9[1] = gridViewDecimalColumn9.
        arrayvar9[2] = gridViewDecimalColumn10.
        arrayvar9[3] = gridViewDateTimeColumn7.
        arrayvar9[4] = gridViewDecimalColumn11.
        arrayvar9[5] = gridViewTextBoxColumn12.
        arrayvar9[6] = gridViewTextBoxColumn13.
        arrayvar9[7] = gridViewDecimalColumn12.
        arrayvar9[8] = gridViewTextBoxColumn14.
        arrayvar9[9] = gridViewDecimalColumn13.
        arrayvar9[10] = gridViewDecimalColumn14.
        arrayvar9[11] = gridViewTextBoxColumn15.
        arrayvar9[12] = gridViewDecimalColumn15.
        arrayvar9[13] = gridViewDecimalColumn16.
        arrayvar9[14] = gridViewCheckBoxColumn3.
        arrayvar9[15] = gridViewDecimalColumn17.
        arrayvar9[16] = gridViewDecimalColumn18.
        arrayvar9[17] = gridViewDecimalColumn19.
        arrayvar9[18] = gridViewCheckBoxColumn4.
        arrayvar9[19] = gridViewDecimalColumn20.
        arrayvar9[20] = gridViewDecimalColumn21.
        arrayvar9[21] = gridViewDecimalColumn22.
        arrayvar9[22] = gridViewDateTimeColumn8.
        arrayvar9[23] = gridViewTextBoxColumn16.
        THIS-OBJECT:radGridView3:MasterTemplate:Columns:AddRange(arrayvar9).
        THIS-OBJECT:radGridView3:MasterTemplate:DataSource = THIS-OBJECT:bindingSource3.
        THIS-OBJECT:radGridView3:MasterTemplate:EnableAlternatingRowColor = TRUE.
        THIS-OBJECT:radGridView3:MasterTemplate:ShowRowHeaderColumn = FALSE.
        THIS-OBJECT:radGridView3:MasterTemplate:ViewDefinition = tableViewDefinition3.
        THIS-OBJECT:radGridView3:Name = "radGridView3".
        THIS-OBJECT:radGridView3:ReadOnly = TRUE.
        THIS-OBJECT:radGridView3:RightToLeft = System.Windows.Forms.RightToLeft:No.
        THIS-OBJECT:radGridView3:ShowGroupPanel = FALSE.
        THIS-OBJECT:radGridView3:Size = NEW System.Drawing.Size(726, 390).
        THIS-OBJECT:radGridView3:TabIndex = 7.
        THIS-OBJECT:radGridView3:Text = "radGridView3".
        /*  */
        /* bindingSource3 */
        /*  */
        THIS-OBJECT:bindingSource3:MaxDataGuess = 0.
        THIS-OBJECT:bindingSource3:NoLOBs = FALSE.
        THIS-OBJECT:bindingSource3:Position = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar10 AS "Progress.Data.TableDesc[]" NO-UNDO.
        arrayvar10 = NEW "Progress.Data.TableDesc[]"(0).
        tableDesc3:ChildTables = arrayvar10.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar11 AS Progress.Data.ColumnPropDesc EXTENT 23 NO-UNDO.
        arrayvar11[1] = NEW Progress.Data.ColumnPropDesc("ArbGivAvgUnderlagBel", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[2] = NEW Progress.Data.ColumnPropDesc("Bel", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[3] = NEW Progress.Data.ColumnPropDesc("BeslRadId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[4] = NEW Progress.Data.ColumnPropDesc("BetDat", "null", Progress.Data.DataType:DATE).
        arrayvar11[5] = NEW Progress.Data.ColumnPropDesc("BetId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[6] = NEW Progress.Data.ColumnPropDesc("BetMotTypAvk", "null", Progress.Data.DataType:CHARACTER).
        arrayvar11[7] = NEW Progress.Data.ColumnPropDesc("BetStatAvk", "null", Progress.Data.DataType:CHARACTER).
        arrayvar11[8] = NEW Progress.Data.ColumnPropDesc("BetTillfId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[9] = NEW Progress.Data.ColumnPropDesc("BetTypAvk", "null", Progress.Data.DataType:CHARACTER).
        arrayvar11[10] = NEW Progress.Data.ColumnPropDesc("BokfId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[11] = NEW Progress.Data.ColumnPropDesc("BokfProduktTypKod", "null", Progress.Data.DataType:CHARACTER).
        arrayvar11[12] = NEW Progress.Data.ColumnPropDesc("BruttoBel", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[13] = NEW Progress.Data.ColumnPropDesc("EngId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[14] = NEW Progress.Data.ColumnPropDesc("Konv", "null", Progress.Data.DataType:LOGICAL).
        arrayvar11[15] = NEW Progress.Data.ColumnPropDesc("LoeneSkattBel", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[16] = NEW Progress.Data.ColumnPropDesc("MotGatuId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[17] = NEW Progress.Data.ColumnPropDesc("MotKontoId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[18] = NEW Progress.Data.ColumnPropDesc("Raenta", "null", Progress.Data.DataType:LOGICAL).
        arrayvar11[19] = NEW Progress.Data.ColumnPropDesc("SkatteBel", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[20] = NEW Progress.Data.ColumnPropDesc("SocAvgBel", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[21] = NEW Progress.Data.ColumnPropDesc("TransId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar11[22] = NEW Progress.Data.ColumnPropDesc("UppdDatTidpTz", "null", Progress.Data.DataType:DATETIME_TZ).
        arrayvar11[23] = NEW Progress.Data.ColumnPropDesc("UrspRappPeriod", "null", Progress.Data.DataType:CHARACTER).
        tableDesc3:Columns = arrayvar11.
        THIS-OBJECT:bindingSource3:TableSchema = tableDesc3.
        /*  */
        /* radOffice2007ScreenTipElement1 */
        /*  */
        THIS-OBJECT:radOffice2007ScreenTipElement1:Description = "Override this property and provide custom screentip template description in DesignTime.".
        THIS-OBJECT:radOffice2007ScreenTipElement1:Name = "radOffice2007ScreenTipElement1".
        THIS-OBJECT:radOffice2007ScreenTipElement1:TemplateType = ?.
        THIS-OBJECT:radOffice2007ScreenTipElement1:TipSize = NEW System.Drawing.Size(0, 0).
        CAST(THIS-OBJECT:radOffice2007ScreenTipElement1:GetChildAt(2):GetChildAt(0), Telerik.WinControls.UI.RadLabelElement):Text = "12-siffrigt personnummer".
        CAST(THIS-OBJECT:radOffice2007ScreenTipElement1:GetChildAt(2):GetChildAt(0), Telerik.WinControls.UI.RadLabelElement):ToolTipText = "12-siffrigt personnummer".
        CAST(THIS-OBJECT:radOffice2007ScreenTipElement1:GetChildAt(2):GetChildAt(1), Telerik.WinControls.UI.RadLabelElement):Text = "Mata in 12 siffror".
        CAST(THIS-OBJECT:radOffice2007ScreenTipElement1:GetChildAt(2):GetChildAt(1), Telerik.WinControls.UI.RadLabelElement):ToolTipText = "Mata in 12 siffror".
        CAST(THIS-OBJECT:radOffice2007ScreenTipElement1:GetChildAt(2):GetChildAt(2), Telerik.WinControls.UI.RadLineItem):Text = "dfasdf".
        CAST(THIS-OBJECT:radOffice2007ScreenTipElement1:GetChildAt(2):GetChildAt(2), Telerik.WinControls.UI.RadLineItem):ToolTipText = "dfasdf".
        CAST(THIS-OBJECT:radOffice2007ScreenTipElement1:GetChildAt(2):GetChildAt(3), Telerik.WinControls.UI.RadLabelElement):ToolTipText = "fsdfasdf".
        /*  */
        /* bindingSource4 */
        /*  */
        THIS-OBJECT:bindingSource4:MaxDataGuess = 0.
        THIS-OBJECT:bindingSource4:NoLOBs = FALSE.
        THIS-OBJECT:bindingSource4:Position = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar12 AS "Progress.Data.TableDesc[]" NO-UNDO.
        arrayvar12 = NEW "Progress.Data.TableDesc[]"(0).
        tableDesc4:ChildTables = arrayvar12.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar13 AS Progress.Data.ColumnPropDesc EXTENT 11 NO-UNDO.
        arrayvar13[1] = NEW Progress.Data.ColumnPropDesc("BestDigiDat", "null", Progress.Data.DataType:DATE).
        arrayvar13[2] = NEW Progress.Data.ColumnPropDesc("DokBlipNr", "null", Progress.Data.DataType:CHARACTER).
        arrayvar13[3] = NEW Progress.Data.ColumnPropDesc("DokDat", "null", Progress.Data.DataType:DATE).
        arrayvar13[4] = NEW Progress.Data.ColumnPropDesc("DokFasDat", "null", Progress.Data.DataType:DATE).
        arrayvar13[5] = NEW Progress.Data.ColumnPropDesc("DokFasKod", "null", Progress.Data.DataType:CHARACTER).
        arrayvar13[6] = NEW Progress.Data.ColumnPropDesc("DokFilmNr", "null", Progress.Data.DataType:CHARACTER).
        arrayvar13[7] = NEW Progress.Data.ColumnPropDesc("DokGuid", "null", Progress.Data.DataType:CHARACTER).
        arrayvar13[8] = NEW Progress.Data.ColumnPropDesc("DokId", "null", Progress.Data.DataType:DECIMAL).
        arrayvar13[9] = NEW Progress.Data.ColumnPropDesc("DokText", "null", Progress.Data.DataType:CHARACTER).
        arrayvar13[10] = NEW Progress.Data.ColumnPropDesc("DokTypAvk", "null", Progress.Data.DataType:CHARACTER).
        arrayvar13[11] = NEW Progress.Data.ColumnPropDesc("UrspDigiDat", "null", Progress.Data.DataType:DATE).
        tableDesc4:Columns = arrayvar13.
        THIS-OBJECT:bindingSource4:TableSchema = tableDesc4.
        /*  */
        /* radDesktopAlert1 */
        /*  */
        THIS-OBJECT:radDesktopAlert1:CaptionText = "Problem med dokument".
        THIS-OBJECT:radDesktopAlert1:ContentText = "Gick inte att öppna dokumentet".
        THIS-OBJECT:radDesktopAlert1:ShowOptionsButton = FALSE.
        THIS-OBJECT:radDesktopAlert1:ShowPinButton = FALSE.
        /*  */
        /* radGridView4 */
        /*  */
        THIS-OBJECT:radGridView4:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:radGridView4:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:radGridView4:Font = NEW System.Drawing.Font("Segoe UI", Progress.Util.CastUtil:ToSingle(8.25)).
        THIS-OBJECT:radGridView4:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:radGridView4:ImeMode = System.Windows.Forms.ImeMode:NoControl.
        THIS-OBJECT:radGridView4:Location = NEW System.Drawing.Point(1102, 340).
        /*  */
        /*  */
        /*  */
        THIS-OBJECT:radGridView4:MasterTemplate:AllowAddNewRow = FALSE.
        gridViewDateTimeColumn9:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn9:FieldName = "BestDigiDat".
        gridViewDateTimeColumn9:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn9:HeaderText = "null".
        gridViewDateTimeColumn9:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn9:IsVisible = FALSE.
        gridViewDateTimeColumn9:Name = "BestDigiDat".
        gridViewTextBoxColumn17:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn17:FieldName = "DokBlipNr".
        gridViewTextBoxColumn17:HeaderText = "null".
        gridViewTextBoxColumn17:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn17:IsVisible = FALSE.
        gridViewTextBoxColumn17:Name = "DokBlipNr".
        gridViewDateTimeColumn10:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn10:FieldName = "DokDat".
        gridViewDateTimeColumn10:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn10:FormatString = "~{0:yyyy-MM-dd~}".
        gridViewDateTimeColumn10:HeaderText = "Datum".
        gridViewDateTimeColumn10:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn10:Name = "DokDat".
        gridViewDateTimeColumn10:ReadOnly = TRUE.
        gridViewDateTimeColumn10:Width = 108.
        gridViewDateTimeColumn11:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn11:FieldName = "DokFasDat".
        gridViewDateTimeColumn11:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn11:HeaderText = "null".
        gridViewDateTimeColumn11:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn11:IsVisible = FALSE.
        gridViewDateTimeColumn11:Name = "DokFasDat".
        gridViewTextBoxColumn18:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn18:FieldName = "DokFasKod".
        gridViewTextBoxColumn18:HeaderText = "null".
        gridViewTextBoxColumn18:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn18:IsVisible = FALSE.
        gridViewTextBoxColumn18:Name = "DokFasKod".
        gridViewTextBoxColumn19:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn19:FieldName = "DokFilmNr".
        gridViewTextBoxColumn19:HeaderText = "null".
        gridViewTextBoxColumn19:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn19:IsVisible = FALSE.
        gridViewTextBoxColumn19:Name = "DokFilmNr".
        gridViewTextBoxColumn20:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn20:FieldName = "DokGuid".
        gridViewTextBoxColumn20:HeaderText = "null".
        gridViewTextBoxColumn20:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn20:IsVisible = FALSE.
        gridViewTextBoxColumn20:Name = "DokGuid".
        gridViewDecimalColumn23:EnableExpressionEditor = FALSE.
        gridViewDecimalColumn23:FieldName = "DokId".
        gridViewDecimalColumn23:HeaderText = "null".
        gridViewDecimalColumn23:IsAutoGenerated = TRUE.
        gridViewDecimalColumn23:IsVisible = FALSE.
        gridViewDecimalColumn23:Name = "DokId".
        gridViewTextBoxColumn21:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn21:FieldName = "DokText".
        gridViewTextBoxColumn21:HeaderText = "null".
        gridViewTextBoxColumn21:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn21:IsVisible = FALSE.
        gridViewTextBoxColumn21:Name = "DokText".
        gridViewTextBoxColumn22:EnableExpressionEditor = FALSE.
        gridViewTextBoxColumn22:FieldName = "DokTypAvk".
        gridViewTextBoxColumn22:HeaderText = "Dokumenttyp".
        gridViewTextBoxColumn22:IsAutoGenerated = TRUE.
        gridViewTextBoxColumn22:Name = "DokTypAvk".
        gridViewTextBoxColumn22:ReadOnly = TRUE.
        gridViewTextBoxColumn22:Width = 288.
        gridViewDateTimeColumn12:EnableExpressionEditor = FALSE.
        gridViewDateTimeColumn12:FieldName = "UrspDigiDat".
        gridViewDateTimeColumn12:Format = System.Windows.Forms.DateTimePickerFormat:Long.
        gridViewDateTimeColumn12:HeaderText = "null".
        gridViewDateTimeColumn12:IsAutoGenerated = TRUE.
        gridViewDateTimeColumn12:IsVisible = FALSE.
        gridViewDateTimeColumn12:Name = "UrspDigiDat".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar14 AS Telerik.WinControls.UI.GridViewDataColumn EXTENT 11 NO-UNDO.
        arrayvar14[1] = gridViewDateTimeColumn9.
        arrayvar14[2] = gridViewTextBoxColumn17.
        arrayvar14[3] = gridViewDateTimeColumn10.
        arrayvar14[4] = gridViewDateTimeColumn11.
        arrayvar14[5] = gridViewTextBoxColumn18.
        arrayvar14[6] = gridViewTextBoxColumn19.
        arrayvar14[7] = gridViewTextBoxColumn20.
        arrayvar14[8] = gridViewDecimalColumn23.
        arrayvar14[9] = gridViewTextBoxColumn21.
        arrayvar14[10] = gridViewTextBoxColumn22.
        arrayvar14[11] = gridViewDateTimeColumn12.
        THIS-OBJECT:radGridView4:MasterTemplate:Columns:AddRange(arrayvar14).
        THIS-OBJECT:radGridView4:MasterTemplate:DataSource = THIS-OBJECT:bindingSource4.
        THIS-OBJECT:radGridView4:MasterTemplate:EnableGrouping = FALSE.
        THIS-OBJECT:radGridView4:MasterTemplate:ShowRowHeaderColumn = FALSE.
        THIS-OBJECT:radGridView4:MasterTemplate:ViewDefinition = tableViewDefinition4.
        THIS-OBJECT:radGridView4:Name = "radGridView4".
        THIS-OBJECT:radGridView4:RightToLeft = System.Windows.Forms.RightToLeft:No.
        THIS-OBJECT:radGridView4:Size = NEW System.Drawing.Size(398, 390).
        THIS-OBJECT:radGridView4:TabIndex = 8.
        THIS-OBJECT:radGridView4:Text = "radGridView4".
        THIS-OBJECT:radGridView4:Click:Subscribe(THIS-OBJECT:radGridView4_Click).
        THIS-OBJECT:radGridView4:DoubleClick:Subscribe(THIS-OBJECT:radGridView4_DoubleClick).
        /*  */
        /* radButton1 */
        /*  */
        THIS-OBJECT:radButton1:Location = NEW System.Drawing.Point(419, 14).
        THIS-OBJECT:radButton1:Name = "radButton1".
        THIS-OBJECT:radButton1:Size = NEW System.Drawing.Size(110, 24).
        THIS-OBJECT:radButton1:TabIndex = 9.
        THIS-OBJECT:radButton1:Text = "Lyssna på event".
        THIS-OBJECT:radButton1:Click:Subscribe(THIS-OBJECT:radButton1_Click).
        /*  */
        /* radProgressBarLyssna */
        /*  */
        THIS-OBJECT:radProgressBarLyssna:Location = NEW System.Drawing.Point(548, 14).
        THIS-OBJECT:radProgressBarLyssna:Name = "radProgressBarLyssna".
        THIS-OBJECT:radProgressBarLyssna:Size = NEW System.Drawing.Size(389, 24).
        THIS-OBJECT:radProgressBarLyssna:TabIndex = 10.
        THIS-OBJECT:radProgressBarLyssna:Text = "Lyssnar".
        /*  */
        /* radButton2 */
        /*  */
        THIS-OBJECT:radButton2:Location = NEW System.Drawing.Point(1010, 14).
        THIS-OBJECT:radButton2:Name = "radButton2".
        THIS-OBJECT:radButton2:Size = NEW System.Drawing.Size(110, 24).
        THIS-OBJECT:radButton2:TabIndex = 11.
        THIS-OBJECT:radButton2:Text = "Skicka meddelanden".
        THIS-OBJECT:radButton2:Click:Subscribe(THIS-OBJECT:radButton2_Click).
        /*  */
        /* Form1 */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(1516, 762).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radButton2).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radProgressBarLyssna).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radButton1).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radGridView4).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radGridView1).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radGridView2).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radStatusStrip1).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radSplitButton1).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radLabel1).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radGridView3).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:soekPers).
        THIS-OBJECT:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:Name = "Form1".
        /*  */
        /*  */
        /*  */
        THIS-OBJECT:RootElement:ApplyShapeToControl = TRUE.
        THIS-OBJECT:Text = "Minimock".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:Form1_Load).
        CAST(THIS-OBJECT:soekPers, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView1:MasterTemplate, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radLabel1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radSplitButton1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radStatusStrip1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:bindingSource2, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView2:MasterTemplate, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView2, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView3:MasterTemplate, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView3, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:bindingSource3, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:bindingSource4, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView4:MasterTemplate, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radGridView4, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radButton1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radProgressBarLyssna, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radButton2, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

	

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID progressbarstuff(val AS INTEGER  ):
        radProgressBarElement1:Value1 = val.
        /*        radProgressBarElement1:UpdateLayout().*/
        radStatusStrip1:RootElement:UpdateLayout().
        radStatusStrip1:Refresh().
        RETURN.

    END METHOD.
    
    METHOD PUBLIC VOID progressbarstuff2(val AS INTEGER  ):
        radProgressBarElement2:Value1 = val.
        /*        radProgressBarElement1:UpdateLayout().*/
        radStatusStrip1:RootElement:UpdateLayout().
        radStatusStrip1:Refresh().
        RETURN.

    END METHOD.
    
    
    METHOD PUBLIC VOID progressbarstuff3(val AS INTEGER  ):
        statusProgressBet:Value1 = val.
        /*        radProgressBarElement1:UpdateLayout().*/
        radStatusStrip1:RootElement:UpdateLayout().
        radStatusStrip1:Refresh().
        RETURN.

    END METHOD.
    
    METHOD PUBLIC VOID progressbarstuff4(val AS INTEGER  ):
        statusprogdok:Value1 = val.
        /*        radProgressBarElement1:UpdateLayout().*/
        radStatusStrip1:RootElement:UpdateLayout().
        radStatusStrip1:Refresh().
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radButton1_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        DEFINE VARIABLE ii      AS INTEGER             NO-UNDO.
        DEF    VAR      myStomp AS com.stomp.stomp_mqc.
        DEF    VAR      startdt AS DATETIME            NO-UNDO.
        DEFINE VARIABLE meep    AS HANDLE              NO-UNDO.
        
        RUN messagehandler.p PERSISTENT SET meep .
        
        radProgressBarLyssna:TEXT = 'Börjat lyssna...'.
    
        myStomp = NEW com.stomp.stomp_mqc().
        myStomp:connect("localhost", "61613", "receiver", "").
        myStomp:SetMessageHandlerProcedure("meep", meep:HANDLE).
        myStomp:dosubscribe("/queue/meep").

        PAUSE 0 BEFORE-HIDE.
        startdt = NOW.
        DO WHILE INTERVAL(NOW, startdt, "seconds") < 40:
            myStomp:waitfor(100).
            PROCESS EVENTS.
        END.
        radProgressBarLyssna:TEXT = 'Slutat lyssna...'.
        myStomp:disconnect(myStomp:ConnectionId).
        
       
        /*                                                               */
        RETURN.

    END METHOD.
    
    METHOD PRIVATE VOID golfHandler():
        MESSAGE 'memmeme'
            VIEW-AS ALERT-BOX.
    END METHOD.
        

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radButton2_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		{ com/stomp/defaults.i }
        SESSION:APPL-ALERT = YES.
        SESSION:SYSTEM-ALERT = YES.
        SESSION:DEBUG-ALERT = YES.
    
        DEF VAR myStomp AS com.stomp.stomp_mqc.
        DEF VAR l-cnt   AS INT                 NO-UNDO.  
     
        myStomp = NEW com.stomp.stomp_mqc().
        myStomp:connect("{&defaulthost}", "{&defaultport}", "sender", "").
        DO l-cnt = 1 TO 10:
            myStomp:sendtext("/queue/meep", 
                subst("Hello world &1 &2", l-cnt, ISO-DATE(NOW))).
        /* be gentle on the receiver : pause 1.*/
        
        END.
        myStomp:waitfor(1).
        myStomp:disconnect(myStomp:ConnectionId).
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radGridView1_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        RETURN.

    END METHOD.

    METHOD PRIVATE VOID populate_signal (pdeAerendeid AS DECIMAL):
        DEFINE VARIABLE poResponse AS JsonObject.
        DEFINE VARIABLE h          AS HANDLE.
        DEFINE VARIABLE qh         AS HANDLE     NO-UNDO.
        DEFINE VARIABLE ja         AS jsonarray.
        ETIME(YES).
        progressbarstuff2(0).
        poResponse = rest:restcallala('http://localhost:8080/moop/web/signal/'+ string(pdeAerendeId)).
        /*        poResponse = canropaRest:doGetStuff('http://localhost:8080/moop/web/signal/'+ string(pdeAerendeId)).*/
        progressbarstuff2(50).
        
        ja = poResponse:GetJsonArray('ttSignal').
        statussignalant:text = poResponse:GetCharacter('antal').
        ASSIGN
            h = TEMP-TABLE ttSignal:HANDLE.
        h:READ-JSON ('JsonArray', ja, 'empty').
        FOR EACH ttSignal:
            ASSIGN 
                ttSignal.SignalTypAvk = kodklass:getKod('signaltyp.signaltypavk', ttSignal.SignalTypAvk) no-error.
        END.
        progressbarstuff2(80).
        

        CREATE QUERY qh.
        qh:SET-BUFFERS ("ttSignal").
        qh:QUERY-PREPARE ("FOR EACH ttSignal").
        qh:QUERY-OPEN ().
        progressbarstuff2(100).
        statussignaltid:text= STRING(ETIME) + "ms".  
        
        bindingSource2:HANDLE = qh:HANDLE.
        RETURN.
    END METHOD.
    
    METHOD PRIVATE VOID listen_to_topic(pcTopicName AS CHARACTER):
        
        
        
    END METHOD.
     
    METHOD PRIVATE VOID populate_bet (pdeEngId AS DECIMAL):
        DEFINE VARIABLE poResponse AS JsonObject.
        DEFINE VARIABLE h          AS HANDLE.
        DEFINE VARIABLE qh         AS HANDLE     NO-UNDO.
        DEFINE VARIABLE ja         AS jsonarray.
        ETIME(YES).
        progressbarstuff3(0).
        
        poResponse = rest:restcallala('http://localhost:8080/moop/web/bet/'+ string(pdeEngId)).
        /*        poResponse = canropaRest:doGetStuff('http://localhost:8080/moop/web/bet/'+ string(aerendeEng.EngId)).*/
        progressbarstuff3(50).
        statusbet:text = poResponse:GetCharacter('antal').
        ja = poResponse:GetJsonArray('ttBet').
        ASSIGN
            h = TEMP-TABLE ttBet:HANDLE.
        h:READ-JSON ('JsonArray', ja, 'empty'). 
        progressbarstuff3(70).
            
        FOR EACH ttBet:
            ASSIGN 
                    
                ttBet.BetStatAvk = kodklass:getKod('bet.betstatavk', ttBet.BetStatAvk)
                ttBet.BetTypAvk  = kodklass:getKod('bet.bettypavk', ttBet.BetTypAvk) no-error.
                    
        END.
        progressbarstuff3(90).
        
        CREATE QUERY qh.
        qh:SET-BUFFERS ("ttBet").
        qh:QUERY-PREPARE ("FOR EACH ttBet").
        qh:QUERY-OPEN ().
        progressbarstuff3(100).
        statusbettid:text= STRING(ETIME) + "ms".  
        
        bindingSource3:HANDLE = qh:HANDLE.
        RETURN.
    END METHOD.
    
    METHOD PRIVATE VOID populate_dok (pdeAerendeId AS DECIMAL):
        DEFINE VARIABLE poResponse AS JsonObject.
        DEFINE VARIABLE h          AS HANDLE.
        DEFINE VARIABLE qh         AS HANDLE     NO-UNDO.
        DEFINE VARIABLE ja         AS jsonarray.
        ETIME(YES).
        progressbarstuff4(0).
        poResponse = rest:restcallala('http://localhost:8080/moop/web/dok/'+ string(pdeAerendeId)).
        
        statusdokant:text = poResponse:GetCharacter('antal').
        /*        poResponse = canropaRest:doGetStuff('http://localhost:8080/moop/web/bet/'+ string(aerendeEng.EngId)).*/
        progressbarstuff4(50).
        ja = poResponse:GetJsonArray('ttDok').
        progressbarstuff4(70).
        ASSIGN
            h = TEMP-TABLE ttDok:HANDLE.
        h:READ-JSON ('JsonArray', ja, 'empty'). 
            
        FOR EACH ttDok:
            ASSIGN

                ttDok.DokTypAvk = kodklass:getKod('doktyp.doktypavk', ttdok.DokTypAvk) NO-ERROR.
                

        END.
        progressbarstuff4(90).
        CREATE QUERY qh.
        qh:SET-BUFFERS ("ttDok").
        qh:QUERY-PREPARE ("FOR EACH ttDok").
        qh:QUERY-OPEN ().
        progressbarstuff4(100).
        
        statusdoktid:text= STRING(ETIME) + "ms".  
        
        bindingSource4:HANDLE = qh:HANDLE.
        RETURN.
    END METHOD.
     
     
     
     

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radGridView1_DoubleClick( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
/*        DEFINE VARIABLE f AS aerendeinfo.          */
/*        f = NEW aerendeinfo().                     */
/*        f:populate_aerendeags(ttAerende.aerendeid).*/
/*		                                                   */
/*		                                                   */
/*        WAIT-FOR f:Show().                         */
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radGridView1_SelectionChanged_1( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        
        IF AVAILABLE ttaerende THEN
        DO:           
            populate_signal(ttAerende.AerendeId).
            
            /*            FUSKAR*/
            FIND FIRST aerendeEng NO-LOCK WHERE aerendeEng.AerendeId = ttAerende.AerendeId AND aerendeEng.EngTypAvk = 'ROTPERSKUND'.
            /*            slutfuskat*/
            populate_bet(aerendeEng.EngId) .
            populate_dok(ttAerende.KopplId).

        END.
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radGridView4_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radGridView4_DoubleClick( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        radDesktopAlert1:Show().
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
	

    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
   
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radMenuItem1_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        /*        radGridView1:ThemeName = "".                     */
        /*        radSplitButton1:ThemeName = "".                  */
        /*        radGridView2:ThemeName = "".                     */
        /*        radGridView3:ThemeName = "".                     */
        /*                                                         */
        /*        soekPers:ThemeName = "".                         */
        /*        BackColor = System.Drawing.Color:WhiteSmoke.     */
        /*        radLabel1:ForeColor = System.Drawing.Color:Black.*/
        /*        radStatusStrip1:ThemeName = "".                  */
        change_theme("").
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radMenuItem2_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        /*        radGridView1:ThemeName = "Office2013Dark".       */
        /*        radGridView2:ThemeName = "Office2013Dark".       */
        /*                                                         */
        /*        radSplitButton1:ThemeName = "Office2013Dark".    */
        /*        radGridView3:ThemeName = "Office2013Dark".       */
        /*        soekPers:ThemeName = "Office2013Dark".           */
        /*        BackColor = System.Drawing.Color:LightSteelBlue. */
        /*        radLabel1:ForeColor = System.Drawing.Color:Black.*/
        /*        radStatusStrip1:ThemeName = "Office2013Dark".    */
        change_theme("Office2013Dark").
        RETURN.

    END METHOD.


    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radMenuItem3_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        /*        radGridView1:ThemeName = "TelerikMetro".         */
        /*        radGridView2:ThemeName = "TelerikMetro".         */
        /*                                                         */
        /*        radSplitButton1:ThemeName = "TelerikMetro".      */
        /*        radGridView3:ThemeName = "TelerikMetro".         */
        /*        soekPers:ThemeName = "TelerikMetro".             */
        /*        BackColor = System.Drawing.Color:WhiteSmoke.     */
        /*        radLabel1:ForeColor = System.Drawing.Color:Black.*/
        /*        radStatusStrip1:ThemeName = "TelerikMetro".      */
		
        change_theme("TelerikMetro").
		
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radMenuItem4_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        /*        radGridView1:ThemeName = "TelerikMetroBlue".     */
        /*        radGridView2:ThemeName = "TelerikMetroBlue".     */
        /*                                                         */
        /*        radSplitButton1:ThemeName = "TelerikMetroBlue".  */
        /*        radGridView3:ThemeName = "TelerikMetroBlue".     */
        /*        soekPers:ThemeName = "TelerikMetroBlue".         */
        /*        BackColor = System.Drawing.Color:WhiteSmoke.     */
        /*        radLabel1:ForeColor = System.Drawing.Color:Black.*/
        /*        radStatusStrip1:ThemeName = "TelerikMetroBlue".  */
        change_theme('TelerikMetroBlue').
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radMenuItem5_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        /*        radGridView1:ThemeName = "Office2013Light".      */
        /*        radGridView2:ThemeName = "Office2013Light".      */
        /*                                                         */
        /*        radSplitButton1:ThemeName = "Office2013Light".   */
        /*        radGridView3:ThemeName = "Office2013Light".      */
        /*        soekPers:ThemeName = "Office2013Light".          */
        /*        BackColor = System.Drawing.Color:WhiteSmoke.     */
        /*        radLabel1:ForeColor = System.Drawing.Color:Black.*/
        /*        radStatusStrip1:ThemeName = "Office2013Light".   */
		
        change_theme('Office2013Light').
        RETURN.

    END METHOD.
    
    
    METHOD PRIVATE VOID change_theme( INPUT namn AS CHARACTER):
        
        ThemeResolutionService:ApplicationThemeName = namn.
        
        
    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    /*    METHOD PUBLIC JsonObject restcallala(pURL AS CHARACTER  ):                              */
    /*                                                                                            */
    /*        DEFINE VARIABLE result      AS JsonObject        NO-UNDO.                           */
    /*        DEFINE VARIABLE myParser    AS ObjectModelParser NO-UNDO.                           */
    /*        DEFINE VARIABLE ojson       AS JsonObject        NO-UNDO.                           */
    /*                                                                                            */
    /*                                                                                            */
    /*        DEFINE VARIABLE HttpClient  AS CLASS             System.Net.WebClient.              */
    /*        DEFINE VARIABLE webResponse AS LONGCHAR          NO-UNDO.                           */
    /*        FIX-CODEPAGE (webResponse) = "UTF-8".                                               */
    /*                                                                                            */
    /*        HttpClient = NEW System.Net.WebClient().                                            */
    /*        HttpClient:Proxy:Credentials = System.Net.CredentialCache:DefaultNetworkCredentials.*/
    /*                                                                                            */
    /*        DEFINE VARIABLE c AS CHARACTER NO-UNDO.                                             */
    /*        webResponse = HttpClient:DownloadString(purl).                                      */
    /*        myParser = NEW ObjectModelParser().                                                 */
    /*        result = CAST(myParser:Parse(webResponse  ),JsonObject).                            */
    /*        RETURN RESULT.                                                                      */
    /*                                                                                            */
    /*    END METHOD.                                                                             */

    /*------------------------------------------------------------------------------
     Purpose:05
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID soekPers_TextChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        DEFINE VARIABLE piStatusCode AS INTEGER    NO-UNDO.
        DEFINE VARIABLE pcStatusText AS CHARACTER  NO-UNDO.
        DEFINE VARIABLE poResponse   AS JsonObject NO-UNDO.
        DEFINE VARIABLE poResponse2  AS JsonObject NO-UNDO.
        
        DEFINE VARIABLE h            AS HANDLE     NO-UNDO.
        DEFINE VARIABLE bh           AS HANDLE     NO-UNDO.
        DEFINE VARIABLE qh           AS HANDLE     NO-UNDO.
        IF  LENGTH (soekpers:TEXT) = 10 THEN  
        DO:
            
            progressbarstuff(0).        
             
        
            progressbarstuff(30).                   
            
            ETIME(YES).
            DEFINE VARIABLE c AS CHARACTER NO-UNDO.
            
            poResponse = rest:restcallala('http://localhost:8080/moop/web/intr/' + soekPers:Text).
            /*            poResponse = canropaRest:doGetStuff('http://localhost:8080/moop/web/intr/' + soekPers:Text).*/

            statustid:text= STRING(ETIME) + "ms".  
            
            /*            RUN hsPubJsonRestAnrop.p ON hAppSrv('GET',                */
            /*                'http://localhost:8080/moop/web/intr/' + soekPers:Text*/
            /*                ,""                                                   */
            /*                ,""                                                   */
            /*                ,?                                                    */
            /*                ,OUTPUT piStatusCode                                  */
            /*                ,OUTPUT pcStatusText                                  */
            /*                ,OUTPUT poResponse ).                                 */
            /*                                                                      */
            
            progressbarstuff(60).
            DEFINE VARIABLE oi AS JsonObject.
            oi = poResponse:GetJsonObject('dsintr').
            
            DEFINE VARIABLE ooi AS JsonArray.
            ooi = oi:GetJsonArray('ttintr').
            
            DEFINE VARIABLE op AS JsonObject.
            op = ooi:GetJsonObject(1).
            progressbarstuff(70).
            
            poResponse2 = rest:restcallala('http://localhost:8080/moop/web/aerende/'+ STRING(op:GetDecimal('IntrId'))).                            

            /*            poResponse2 = canropaRest:doGetStuff('http://localhost:8080/moop/web/aerende/'+ STRING(op:GetDecimal('IntrId'))).*/
            /*            RUN hsPubJsonRestAnrop.p ('GET',                                              */
            /*                'http://localhost:8080/moop/web/aerende/'+ STRING(op:GetDecimal('IntrId'))*/
            /*                ,""                                                                       */
            /*                ,""                                                                       */
            /*                ,?                                                                        */
            /*                ,OUTPUT piStatusCode                                                      */
            /*                ,OUTPUT pcStatusText                                                      */
            /*                ,OUTPUT poResponse2 ).                                                    */
		    
            progressbarstuff(80).
		    
		    
            DEFINE VARIABLE ja AS jsonarray.
            ja = poResponse2:GetJsonArray('ttAerende').
            
            ASSIGN 
                h = TEMP-TABLE ttAerende:HANDLE.
            h:READ-JSON ('JsonArray', ja, 'empty').
             
            FOR EACH ttAerende:
                ASSIGN 
                    ttAerende.AerendeStatAvk = kodklass:getKod('aerende.aerendestatavk', ttAerende.AerendeStatAvk).
            END.

            radLabelBarAerenden:text = poResponse2:GetCharacter('antal').
            progressbarstuff(90).
            /*            ASSIGN radStatusStrip1:TEXT =*/
            CREATE QUERY qh.
            qh:SET-BUFFERS ("ttAerende").
            qh:QUERY-PREPARE ("FOR EACH ttAerende").
            qh:QUERY-OPEN ().
            progressbarstuff(100).
            
            bindingSource1:HANDLE = qh:HANDLE.        
            
        /*            radGridView1:DataSource = bindingSource1.*/
        
            
     
     
     
		    
        END.
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC Task stufff(  ):
        
        RETURN.

    END METHOD.    
    

    DESTRUCTOR PUBLIC Form1 ( ):

        IF VALID-OBJECT(components) THEN 
        DO:
            CAST(components, System.IDisposable):Dispose().
        END.

    END DESTRUCTOR.

END CLASS.