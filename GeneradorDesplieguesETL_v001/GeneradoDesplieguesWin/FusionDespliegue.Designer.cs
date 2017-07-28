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
			this.SuspendLayout();
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(12, 44);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(127, 13);
			this.label1.TabIndex = 0;
			this.label1.Text = "Carpeta con despliegues:";
			// 
			// tbOrigen
			// 
			this.tbOrigen.Location = new System.Drawing.Point(145, 42);
			this.tbOrigen.Name = "tbOrigen";
			this.tbOrigen.ReadOnly = true;
			this.tbOrigen.Size = new System.Drawing.Size(341, 20);
			this.tbOrigen.TabIndex = 1;
			// 
			// btnOrigen
			// 
			this.btnOrigen.Location = new System.Drawing.Point(511, 39);
			this.btnOrigen.Name = "btnOrigen";
			this.btnOrigen.Size = new System.Drawing.Size(62, 23);
			this.btnOrigen.TabIndex = 2;
			this.btnOrigen.Text = "...";
			this.btnOrigen.UseVisualStyleBackColor = true;
			this.btnOrigen.Click += new System.EventHandler(this.btnOrigen_Click);
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(24, 81);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(115, 13);
			this.label2.TabIndex = 3;
			this.label2.Text = "Carpeta destino fusion:";
			// 
			// tbDestino
			// 
			this.tbDestino.Location = new System.Drawing.Point(145, 78);
			this.tbDestino.Name = "tbDestino";
			this.tbDestino.ReadOnly = true;
			this.tbDestino.Size = new System.Drawing.Size(341, 20);
			this.tbDestino.TabIndex = 4;
			// 
			// btnDestino
			// 
			this.btnDestino.Location = new System.Drawing.Point(511, 75);
			this.btnDestino.Name = "btnDestino";
			this.btnDestino.Size = new System.Drawing.Size(62, 23);
			this.btnDestino.TabIndex = 5;
			this.btnDestino.Text = "...";
			this.btnDestino.UseVisualStyleBackColor = true;
			this.btnDestino.Click += new System.EventHandler(this.btnDestino_Click);
			// 
			// btnFusionar
			// 
			this.btnFusionar.Location = new System.Drawing.Point(250, 139);
			this.btnFusionar.Name = "btnFusionar";
			this.btnFusionar.Size = new System.Drawing.Size(73, 43);
			this.btnFusionar.TabIndex = 6;
			this.btnFusionar.Text = "Fusionar despliegues";
			this.btnFusionar.UseVisualStyleBackColor = true;
			this.btnFusionar.Click += new System.EventHandler(this.btnFusionar_Click);
			// 
			// FusionDespliegue
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(595, 198);
			this.Controls.Add(this.btnFusionar);
			this.Controls.Add(this.btnDestino);
			this.Controls.Add(this.tbDestino);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.btnOrigen);
			this.Controls.Add(this.tbOrigen);
			this.Controls.Add(this.label1);
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
	}
}

