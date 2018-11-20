/*------------------------------------------------------------------------
   File        : settings
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : EARA02
   Created     : Tue Nov 20 17:43:54 CET 2018
   Notes       : 
 ----------------------------------------------------------------------*/
USING Telerik.WinControls.UI.RadForm.
USING Telerik.WinControls.ThemeResolutionService FROM ASSEMBLY.
USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.
USING se.afa.mega.general.userSettings FROM PROPATH.
  
BLOCK-LEVEL ON ERROR UNDO, THROW.
CLASS se.afa.intressent.gui.settings INHERITS RadForm : 
    
    DEFINE PRIVATE VARIABLE userSettings                AS userSettings                                          NO-UNDO.
    DEFINE VARIABLE temanamn     AS CHARACTER NO-UNDO.
    
    DEFINE PRIVATE VARIABLE cbTheme                     AS Telerik.WinControls.UI.RadSplitButton                 NO-UNDO.
    DEFINE PRIVATE VARIABLE breezeTheme1                AS Telerik.WinControls.Themes.BreezeTheme                NO-UNDO.
    DEFINE PRIVATE VARIABLE aquaTheme1                  AS Telerik.WinControls.Themes.AquaTheme                  NO-UNDO.
    DEFINE PRIVATE VARIABLE components                  AS System.ComponentModel.IContainer                      NO-UNDO.
    DEFINE PRIVATE VARIABLE buttonOk                    AS System.Windows.Forms.Button                           NO-UNDO.
    DEFINE PRIVATE VARIABLE buttonCancel                AS System.Windows.Forms.Button                           NO-UNDO.
    DEFINE PRIVATE VARIABLE menuBreeze                  AS Telerik.WinControls.UI.RadMenuItem                    NO-UNDO.
    DEFINE PRIVATE VARIABLE windows8Theme1              AS Telerik.WinControls.Themes.Windows8Theme              NO-UNDO.
    DEFINE PRIVATE VARIABLE windows7Theme1              AS Telerik.WinControls.Themes.Windows7Theme              NO-UNDO.
    DEFINE PRIVATE VARIABLE visualStudio2012LightTheme1 AS Telerik.WinControls.Themes.VisualStudio2012LightTheme NO-UNDO.
    DEFINE PRIVATE VARIABLE visualStudio2012DarkTheme1  AS Telerik.WinControls.Themes.VisualStudio2012DarkTheme  NO-UNDO.
    DEFINE PRIVATE VARIABLE telerikMetroTouchTheme1     AS Telerik.WinControls.Themes.TelerikMetroTouchTheme     NO-UNDO.
    DEFINE PRIVATE VARIABLE telerikMetroTheme1          AS Telerik.WinControls.Themes.TelerikMetroTheme          NO-UNDO.
    DEFINE PRIVATE VARIABLE telerikMetroBlueTheme1      AS Telerik.WinControls.Themes.TelerikMetroBlueTheme      NO-UNDO.
    DEFINE PRIVATE VARIABLE office2013LightTheme1       AS Telerik.WinControls.Themes.Office2013LightTheme       NO-UNDO.
    DEFINE PRIVATE VARIABLE office2013DarkTheme1        AS Telerik.WinControls.Themes.Office2013DarkTheme        NO-UNDO.
    DEFINE PRIVATE VARIABLE office2010SilverTheme1      AS Telerik.WinControls.Themes.Office2010SilverTheme      NO-UNDO.
    DEFINE PRIVATE VARIABLE office2010BlueTheme1        AS Telerik.WinControls.Themes.Office2010BlueTheme        NO-UNDO.
    DEFINE PRIVATE VARIABLE office2010BlackTheme1       AS Telerik.WinControls.Themes.Office2010BlackTheme       NO-UNDO.
    DEFINE PRIVATE VARIABLE office2007SilverTheme1      AS Telerik.WinControls.Themes.Office2007SilverTheme      NO-UNDO.
    DEFINE PRIVATE VARIABLE office2007BlackTheme1       AS Telerik.WinControls.Themes.Office2007BlackTheme       NO-UNDO.
    DEFINE PRIVATE VARIABLE menuwin8                    AS Telerik.WinControls.UI.RadMenuItem                    NO-UNDO.
    DEFINE PRIVATE VARIABLE menuwin7                    AS Telerik.WinControls.UI.RadMenuItem                    NO-UNDO.
    DEFINE PRIVATE VARIABLE menuvatten                  AS Telerik.WinControls.UI.RadMenuItem                    NO-UNDO.
    DEFINE PRIVATE VARIABLE menudesert                  AS Telerik.WinControls.UI.RadMenuItem                    NO-UNDO.
    DEFINE PRIVATE VARIABLE highContrastBlackTheme1     AS Telerik.WinControls.Themes.HighContrastBlackTheme     NO-UNDO.
    DEFINE PRIVATE VARIABLE desertTheme1                AS Telerik.WinControls.Themes.DesertTheme                NO-UNDO.
    
    CONSTRUCTOR PUBLIC settings( ):
    
        SUPER().
        InitializeComponent ( ).
        userSettings = NEW userSettings().
        change_theme(userSettings:getSetting('theme')).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.        

    END CONSTRUCTOR.

    DESTRUCTOR PUBLIC settings( ):

        IF VALID-OBJECT(components) THEN 
        DO:
            CAST(components, System.IDisposable):Dispose().
        END.

    END DESTRUCTOR.    


    METHOD PRIVATE VOID change_theme (INPUT themename AS CHARACTER):
        ThemeResolutionService:ApplicationThemeName = themename.
        ASSIGN temanamn = themename.
       
    END METHOD.
       
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PRIVATE JsonObject loadSettings(  ):
        
        DEFINE VARIABLE result AS JsonObject NO-UNDO.
        
        RETURN result.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID menuBreeze_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        change_theme('Breeze').
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID menudesert_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        change_theme('Desert').
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID menuvatten_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        change_theme('Aqua').
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID menuwin7_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        change_theme('Windows7').	
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID menuwin8_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        change_theme('Windows8').	
        RETURN.

    END METHOD.

    METHOD PRIVATE VOID okButton_Click (sender AS System.Object, e AS System.EventArgs):
        userSettings:updateSetting('theme', temanamn).
        
        THIS-OBJECT:DialogResult = System.Windows.Forms.DialogResult:Ok.
        THIS-OBJECT:Close ( ). 
    END METHOD.

    METHOD PRIVATE VOID cancelButton_Click (sender AS System.Object, e AS System.EventArgs):
        THIS-OBJECT:DialogResult = System.Windows.Forms.DialogResult:Cancel.
        THIS-OBJECT:Close ( ).
    END METHOD.
    
    METHOD PRIVATE VOID InitializeComponent ( ):

        /* NOTE: The following method is automatically generated.
           
           We strongly suggest that the contents of this method only be modified using the 
           Visual Designer to avoid any incompatible modifications.
           
           Modifying the contents of this method using a code editor will invalidate any support for this file. */
        
        THIS-OBJECT:buttonOk = NEW System.Windows.Forms.Button().
        THIS-OBJECT:buttonCancel = NEW System.Windows.Forms.Button().
        THIS-OBJECT:aquaTheme1 = NEW Telerik.WinControls.Themes.AquaTheme().
        THIS-OBJECT:breezeTheme1 = NEW Telerik.WinControls.Themes.BreezeTheme().
        THIS-OBJECT:desertTheme1 = NEW Telerik.WinControls.Themes.DesertTheme().
        THIS-OBJECT:highContrastBlackTheme1 = NEW Telerik.WinControls.Themes.HighContrastBlackTheme().
        THIS-OBJECT:office2007BlackTheme1 = NEW Telerik.WinControls.Themes.Office2007BlackTheme().
        THIS-OBJECT:office2007SilverTheme1 = NEW Telerik.WinControls.Themes.Office2007SilverTheme().
        THIS-OBJECT:office2010BlackTheme1 = NEW Telerik.WinControls.Themes.Office2010BlackTheme().
        THIS-OBJECT:office2010BlueTheme1 = NEW Telerik.WinControls.Themes.Office2010BlueTheme().
        THIS-OBJECT:office2010SilverTheme1 = NEW Telerik.WinControls.Themes.Office2010SilverTheme().
        THIS-OBJECT:office2013DarkTheme1 = NEW Telerik.WinControls.Themes.Office2013DarkTheme().
        THIS-OBJECT:office2013LightTheme1 = NEW Telerik.WinControls.Themes.Office2013LightTheme().
        THIS-OBJECT:windows7Theme1 = NEW Telerik.WinControls.Themes.Windows7Theme().
        THIS-OBJECT:windows8Theme1 = NEW Telerik.WinControls.Themes.Windows8Theme().
        THIS-OBJECT:visualStudio2012DarkTheme1 = NEW Telerik.WinControls.Themes.VisualStudio2012DarkTheme().
        THIS-OBJECT:visualStudio2012LightTheme1 = NEW Telerik.WinControls.Themes.VisualStudio2012LightTheme().
        THIS-OBJECT:telerikMetroBlueTheme1 = NEW Telerik.WinControls.Themes.TelerikMetroBlueTheme().
        THIS-OBJECT:telerikMetroTheme1 = NEW Telerik.WinControls.Themes.TelerikMetroTheme().
        THIS-OBJECT:telerikMetroTouchTheme1 = NEW Telerik.WinControls.Themes.TelerikMetroTouchTheme().
        THIS-OBJECT:cbTheme = NEW Telerik.WinControls.UI.RadSplitButton().
        THIS-OBJECT:menuvatten = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:menudesert = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:menuwin8 = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:menuwin7 = NEW Telerik.WinControls.UI.RadMenuItem().
        THIS-OBJECT:menuBreeze = NEW Telerik.WinControls.UI.RadMenuItem().
        CAST(THIS-OBJECT:cbTheme, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* buttonOk */
        /*  */
        DEFINE VARIABLE nestedvar0 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar0 = System.Windows.Forms.AnchorStyles:Bottom.
        THIS-OBJECT:buttonOk:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar0, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:buttonOk:Location = NEW System.Drawing.Point(233, 434).
        THIS-OBJECT:buttonOk:Name = "buttonOk".
        THIS-OBJECT:buttonOk:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:buttonOk:TabIndex = 0.
        THIS-OBJECT:buttonOk:Text = "OK".
        THIS-OBJECT:buttonOk:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:buttonOk:Click:Subscribe(THIS-OBJECT:okButton_Click).
        /*  */
        /* buttonCancel */
        /*  */
        DEFINE VARIABLE nestedvar1 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar1 = System.Windows.Forms.AnchorStyles:Bottom.
        THIS-OBJECT:buttonCancel:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar1, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:buttonCancel:DialogResult = System.Windows.Forms.DialogResult:Cancel.
        THIS-OBJECT:buttonCancel:Location = NEW System.Drawing.Point(317, 434).
        THIS-OBJECT:buttonCancel:Name = "buttonCancel".
        THIS-OBJECT:buttonCancel:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:buttonCancel:TabIndex = 1.
        THIS-OBJECT:buttonCancel:Text = "Cancel".
        THIS-OBJECT:buttonCancel:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:buttonCancel:Click:Subscribe(THIS-OBJECT:cancelButton_Click).
        /*  */
        /* cbTheme */
        /*  */
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar0 AS Telerik.WinControls.RadItem EXTENT 5 NO-UNDO.
        arrayvar0[1] = THIS-OBJECT:menuvatten.
        arrayvar0[2] = THIS-OBJECT:menudesert.
        arrayvar0[3] = THIS-OBJECT:menuwin8.
        arrayvar0[4] = THIS-OBJECT:menuwin7.
        arrayvar0[5] = THIS-OBJECT:menuBreeze.
        THIS-OBJECT:cbTheme:Items:AddRange(arrayvar0).
        THIS-OBJECT:cbTheme:Location = NEW System.Drawing.Point(13, 69).
        THIS-OBJECT:cbTheme:Name = "cbTheme".
        THIS-OBJECT:cbTheme:Size = NEW System.Drawing.Size(295, 24).
        THIS-OBJECT:cbTheme:TabIndex = 2.
        THIS-OBJECT:cbTheme:Text = "Välj tema".
        /*  */
        /* menuvatten */
        /*  */
        THIS-OBJECT:menuvatten:Name = "menuvatten".
        THIS-OBJECT:menuvatten:Text = "Vatten".
        THIS-OBJECT:menuvatten:Click:Subscribe(THIS-OBJECT:menuvatten_Click).
        /*  */
        /* menudesert */
        /*  */
        THIS-OBJECT:menudesert:Name = "menudesert".
        THIS-OBJECT:menudesert:Text = "Öken".
        THIS-OBJECT:menudesert:Click:Subscribe(THIS-OBJECT:menudesert_Click).
        /*  */
        /* menuwin8 */
        /*  */
        THIS-OBJECT:menuwin8:Name = "menuwin8".
        THIS-OBJECT:menuwin8:Text = "Windows 8".
        THIS-OBJECT:menuwin8:Click:Subscribe(THIS-OBJECT:menuwin8_Click).
        /*  */
        /* menuwin7 */
        /*  */
        THIS-OBJECT:menuwin7:Name = "menuwin7".
        THIS-OBJECT:menuwin7:Text = "Windows 7".
        THIS-OBJECT:menuwin7:Click:Subscribe(THIS-OBJECT:menuwin7_Click).
        /*  */
        /* menuBreeze */
        /*  */
        THIS-OBJECT:menuBreeze:Name = "menuBreeze".
        THIS-OBJECT:menuBreeze:Text = "Vind".
        THIS-OBJECT:menuBreeze:Click:Subscribe(THIS-OBJECT:menuBreeze_Click).
        /*  */
        /* settings */
        /*  */
        THIS-OBJECT:AcceptButton = THIS-OBJECT:buttonOk.
        THIS-OBJECT:CancelButton = THIS-OBJECT:buttonCancel.
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(406, 471).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:cbTheme).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:buttonCancel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:buttonOk).
        THIS-OBJECT:FormBorderStyle = System.Windows.Forms.FormBorderStyle:FixedDialog.
        THIS-OBJECT:MaximizeBox = FALSE.
        THIS-OBJECT:MinimizeBox = FALSE.
        THIS-OBJECT:Name = "settings".
        /*  */
        /*  */
        /*  */
        THIS-OBJECT:RootElement:ApplyShapeToControl = TRUE.
        THIS-OBJECT:ShowInTaskbar = FALSE.
        THIS-OBJECT:StartPosition = System.Windows.Forms.FormStartPosition:CenterParent.
        THIS-OBJECT:Text = "settings".
        CAST(THIS-OBJECT:cbTheme, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD. 
 
    METHOD PUBLIC VOID ShowModalDialog(  ):
        
        WAIT-FOR THIS-OBJECT:ShowDialog().

    END METHOD.


 
END CLASS.
