 
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

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS se.afa.intressent.gui.start INHERITS RadForm: 
    
    DEFINE PRIVATE VARIABLE btSoek AS Telerik.WinControls.UI.RadButton NO-UNDO.
    DEFINE PRIVATE VARIABLE btAdmin AS Telerik.WinControls.UI.RadButton NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE radButton1 AS Telerik.WinControls.UI.RadButton NO-UNDO.

        
    CONSTRUCTOR PUBLIC start (  ):
        
        
        SUPER().
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

    DESTRUCTOR PUBLIC start ( ):

    END DESTRUCTOR.

END CLASS.