using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;

namespace GeneradoDesplieguesWin
{
	public partial class FusionDespliegue : Form
	{
		public FusionDespliegue()
		{
			InitializeComponent();
		}

		private void btnOrigen_Click(object sender, EventArgs e)
		{
			if(fbdOrigen.ShowDialog() != System.Windows.Forms.DialogResult.OK) return;
			tbOrigen.Text = fbdOrigen.SelectedPath;
			tbDestino.Text = fbdOrigen.SelectedPath;
			fbdDestino.SelectedPath = fbdOrigen.SelectedPath;
		}

		private void btnDestino_Click(object sender, EventArgs e)
		{
			if (fbdDestino.ShowDialog() != System.Windows.Forms.DialogResult.OK) return;
			tbDestino.Text = fbdDestino.SelectedPath;
		}

		private void btnFusionar_Click(object sender, EventArgs e)
		{
			if(tbOrigen.Text == string.Empty || tbDestino.Text == string.Empty)
			{
				MessageBox.Show("Debe seleccionar las carpetas a procesar", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
				return;
			}
			string rutaDestino = System.IO.Path.Combine(tbDestino.Text, DateTime.Today.ToString("yyyyMMdd"));
			LogicaGeneracionDespliegue.FusionDespliegue logica = new LogicaGeneracionDespliegue.FusionDespliegue(ConfigurationManager.AppSettings["NombreFicheroOrden"], tbOrigen.Text, rutaDestino, GeneradoDesplieguesWin.Properties.Settings.Default.RegexValidacion, GeneradoDesplieguesWin.Properties.Settings.Default.RegexReemplazo);
			logica.OnAvisoCarpetaExistente += new LogicaGeneracionDespliegue.AvisoConfirmacionHandler(logica_OnAvisoCarpetaExistente);
			try
			{
				logica.Fusionar();
			}
			catch(Exception exc)
			{
				MessageBox.Show(exc.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			
		}

		void logica_OnAvisoCarpetaExistente(CancelEventArgs args)
		{
			bool aceptado = MessageBox.Show(LogicaGeneracionDespliegue.Mensajes.AvisoCarpetaExistente, "Aviso", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == System.Windows.Forms.DialogResult.Yes;
			args.Cancel = !aceptado;
		}

		private void FusionDespliegue_Load(object sender, EventArgs e)
		{
			fbdOrigen.SelectedPath = fbdDestino.SelectedPath = Environment.CurrentDirectory;
		}
	}
}
