 
/*------------------------------------------------------------------------
   File        : start
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : EARA02
   Created     : Tue Nov 20 17:34:53 CET 2018
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Telerik.WinControls.UI.RadForm.
USING se.afa.intressent.gui.settings FROM PROPATH.
USING Telerik.WinControls.ThemeResolutionService FROM ASSEMBLY.
USING se.afa.mega.general.userSettings FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS se.afa.intressent.gui.start INHERITS RadForm: 
    DEFINE PRIVATE VARIABLE aquaTheme1 AS Telerik.WinControls.Themes.AquaTheme NO-UNDO.
    DEFINE PRIVATE VARIABLE breezeTheme1 AS Telerik.WinControls.Themes.BreezeTheme NO-UNDO.
    DEFINE PRIVATE VARIABLE desertTheme1 AS Telerik.WinControls.Themes.DesertTheme NO-UNDO.
    DEFINE         VARIABLE temanamn     AS CHARACTER                        NO-UNDO.
    DEFINE PRIVATE VARIABLE userSettings AS userSettings                     NO-UNDO.
    
    DEFINE PRIVATE VARIABLE btSoek       AS Telerik.WinControls.UI.RadButton NO-UNDO.
    DEFINE PRIVATE VARIABLE btAdmin      AS Telerik.WinControls.UI.RadButton NO-UNDO.
    DEFINE PRIVATE VARIABLE components   AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE radButton1   AS Telerik.WinControls.UI.RadButton NO-UNDO.

        
    CONSTRUCTOR PUBLIC start (  ):
        
        
        SUPER().
        userSettings = NEW userSettings().
        change_theme(userSettings:getSetting('theme')).
        InitializeComponent().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:btSoek = NEW Telerik.WinControls.UI.RadButton().
        THIS-OBJECT:btAdmin = NEW Telerik.WinControls.UI.RadButton().
        THIS-OBJECT:radButton1 = NEW Telerik.WinControls.UI.RadButton().
        THIS-OBJECT:breezeTheme1 = NEW Telerik.WinControls.Themes.BreezeTheme().
        THIS-OBJECT:aquaTheme1 = NEW Telerik.WinControls.Themes.AquaTheme().
        THIS-OBJECT:desertTheme1 = NEW Telerik.WinControls.Themes.DesertTheme().
        CAST(THIS-OBJECT:btSoek, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:btAdmin, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:radButton1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* btSoek */
        /*  */
        THIS-OBJECT:btSoek:Location = NEW System.Drawing.Point(13, 13).
        THIS-OBJECT:btSoek:Name = "btSoek".
        THIS-OBJECT:btSoek:Size = NEW System.Drawing.Size(154, 134).
        THIS-OBJECT:btSoek:TabIndex = 0.
        THIS-OBJECT:btSoek:Text = "Sök".
        /*  */
        /* btAdmin */
        /*  */
        THIS-OBJECT:btAdmin:Location = NEW System.Drawing.Point(173, 13).
        THIS-OBJECT:btAdmin:Name = "btAdmin".
        THIS-OBJECT:btAdmin:Size = NEW System.Drawing.Size(154, 134).
        THIS-OBJECT:btAdmin:TabIndex = 1.
        THIS-OBJECT:btAdmin:Text = "Admin".
        /*  */
        /* radButton1 */
        /*  */
        THIS-OBJECT:radButton1:Location = NEW System.Drawing.Point(333, 13).
        THIS-OBJECT:radButton1:Name = "radButton1".
        THIS-OBJECT:radButton1:Size = NEW System.Drawing.Size(154, 134).
        THIS-OBJECT:radButton1:TabIndex = 2.
        THIS-OBJECT:radButton1:Text = "Inställning".
        THIS-OBJECT:radButton1:Click:Subscribe(THIS-OBJECT:radButton1_Click).
        /*  */
        /* start */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(500, 159).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:radButton1).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:btAdmin).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:btSoek).
        THIS-OBJECT:Name = "start".
        /*  */
        /*  */
        /*  */
        THIS-OBJECT:RootElement:ApplyShapeToControl = TRUE.
        THIS-OBJECT:StartPosition = System.Windows.Forms.FormStartPosition:CenterScreen.
        THIS-OBJECT:Text = "Start".
        CAST(THIS-OBJECT:btSoek, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:btAdmin, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:radButton1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID radButton1_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        DEFINE VARIABLE settingsWindow AS SETTINGS.
        settingsWindow = NEW settings().
        WAIT-FOR settingsWindow:Show().		
        RETURN.

    END METHOD.


    METHOD PRIVATE VOID change_theme (INPUT themename AS CHARACTER):
        ThemeResolutionService:ApplicationThemeName = themename.
        ASSIGN 
            temanamn = themename.
       
    END METHOD.
    DESTRUCTOR PUBLIC start ( ):

    END DESTRUCTOR.

END CLASS.