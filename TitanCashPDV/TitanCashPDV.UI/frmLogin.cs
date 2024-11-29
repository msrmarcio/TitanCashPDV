namespace TitanCashPDV.UI
{
    public partial class frmLogin : Form
    {
        private readonly ILoginUseCase _loginUseCase;


        public frmLogin(ILoginUseCase loginUseCase)
        {
            InitializeComponent();

            _loginUseCase = loginUseCase;
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            var result = _loginUseCase.Execute(txtUsername.Text, txtPassword.Text);
            if (result.Success)
            {
                MessageBox.Show("Login realizado com sucesso!");
            }
            else
            {
                MessageBox.Show("Usuário ou senha inválidos!");
            }
        }
    }
}
