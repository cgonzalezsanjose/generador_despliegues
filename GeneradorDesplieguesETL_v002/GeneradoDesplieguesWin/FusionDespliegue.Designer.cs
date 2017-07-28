namespace GeneradoDesplieguesWin
{
	partial class FusionDespliegue
	{
		/// <summary>
		/// Variable del diseñador requerida.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Limpiar los recursos que se estén utilizando.
		/// </summary>
		/// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Código generado por el Diseñador de Windows Forms

		/// <summary>
		/// Método necesario para admitir el Diseñador. No se puede modificar
		/// el contenido del método con el editor de código.
		/// </summary>
		private void InitializeComponent()
		{
            this.fbdOrigen = new System.Windows.Forms.FolderBrowserDialog();
            this.fbdDestino = new System.Windows.Forms.FolderBrowserDialog();
            this.label1 = new System.Windows.Forms.Label();
            this.tbOrigen = new System.Windows.Forms.TextBox();
            this.btnOrigen = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.tbDestino = new System.Windows.Forms.TextBox();
            this.btnDestino = new System.Windows.Forms.Button();
            this.btnFusionar = new System.Windows.Forms.Button();
            this.tb_numPase = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 54);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(169, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Carpeta con despliegues:";
            // 
            // tbOrigen
            // 
            this.tbOrigen.Location = new System.Drawing.Point(193, 52);
            this.tbOrigen.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tbOrigen.Name = "tbOrigen";
            this.tbOrigen.ReadOnly = true;
            this.tbOrigen.Size = new System.Drawing.Size(453, 22);
            this.tbOrigen.TabIndex = 1;
            // 
            // btnOrigen
            // 
            this.btnOrigen.Location = new System.Drawing.Point(681, 48);
            this.btnOrigen.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnOrigen.Name = "btnOrigen";
            this.btnOrigen.Size = new System.Drawing.Size(83, 28);
            this.btnOrigen.TabIndex = 2;
            this.btnOrigen.Text = "...";
            this.btnOrigen.UseVisualStyleBackColor = true;
            this.btnOrigen.Click += new System.EventHandler(this.btnOrigen_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(32, 100);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(154, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Carpeta destino fusion:";
            // 
            // tbDestino
            // 
            this.tbDestino.Location = new System.Drawing.Point(193, 96);
            this.tbDestino.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tbDestino.Name = "tbDestino";
            this.tbDestino.ReadOnly = true;
            this.tbDestino.Size = new System.Drawing.Size(453, 22);
            this.tbDestino.TabIndex = 4;
            // 
            // btnDestino
            // 
            this.btnDestino.Location = new System.Drawing.Point(681, 92);
            this.btnDestino.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnDestino.Name = "btnDestino";
            this.btnDestino.Size = new System.Drawing.Size(83, 28);
            this.btnDestino.TabIndex = 5;
            this.btnDestino.Text = "...";
            this.btnDestino.UseVisualStyleBackColor = true;
            this.btnDestino.Click += new System.EventHandler(this.btnDestino_Click);
            // 
            // btnFusionar
            // 
            this.btnFusionar.Location = new System.Drawing.Point(333, 178);
            this.btnFusionar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnFusionar.Name = "btnFusionar";
            this.btnFusionar.Size = new System.Drawing.Size(97, 53);
            this.btnFusionar.TabIndex = 6;
            this.btnFusionar.Text = "Fusionar despliegues";
            this.btnFusionar.UseVisualStyleBackColor = true;
            this.btnFusionar.Click += new System.EventHandler(this.btnFusionar_Click);
            // 
            // tb_numPase
            // 
            this.tb_numPase.Location = new System.Drawing.Point(193, 136);
            this.tb_numPase.Margin = new System.Windows.Forms.Padding(4);
            this.tb_numPase.Name = "tb_numPase";
            this.tb_numPase.Size = new System.Drawing.Size(71, 22);
            this.tb_numPase.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(67, 139);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(118, 17);
            this.label3.TabIndex = 8;
            this.label3.Text = "Número de Pase:";
            // 
            // FusionDespliegue
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(793, 244);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tb_numPase);
            this.Controls.Add(this.btnFusionar);
            this.Controls.Add(this.btnDestino);
            this.Controls.Add(this.tbDestino);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnOrigen);
            this.Controls.Add(this.tbOrigen);
            this.Controls.Add(this.label1);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "FusionDespliegue";
            this.Text = "Fusion de despliegues";
            this.Load += new System.EventHandler(this.FusionDespliegue_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.FolderBrowserDialog fbdOrigen;
		private System.Windows.Forms.FolderBrowserDialog fbdDestino;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox tbOrigen;
		private System.Windows.Forms.Button btnOrigen;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox tbDestino;
		private System.Windows.Forms.Button btnDestino;
		private System.Windows.Forms.Button btnFusionar;
        private System.Windows.Forms.TextBox tb_numPase;
        private System.Windows.Forms.Label label3;
    }
}

