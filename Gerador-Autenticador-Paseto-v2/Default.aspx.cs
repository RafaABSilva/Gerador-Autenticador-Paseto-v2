using Paseto.Authentication;
using Paseto.Internal.Chaos.NaCl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            Panel1.Visible = false;
            chaveSementeGerada.Text = chavePublicaGerada.Text = "Clique em 'Gerar Chaves'";
            return;
        }
    }

    protected string criarToken(string chavePublica, string chavePrivada) {

        byte[] _publicKey = HexToBytes(chavePublica);
        byte[] _privateKey = HexToBytes(chavePrivada);

        var date = DateTime.UtcNow;

        var claims = new PasetoInstance {
            Issuer = "http://auth.example.com",
            Subject = "2986689",
            Audience = "audience",
            Expiration = new DateTime(date.Year, date.Month, date.Day, date.Hour, date.Minute, date.Second, date.Kind).AddMinutes(10),
            NotBefore = new DateTime(date.Year, date.Month, date.Day, date.Hour, date.Minute, date.Second, date.Kind).AddMinutes(-10),
            IssuedAt = new DateTime(date.Year, date.Month, date.Day, date.Hour, date.Minute, date.Second, date.Kind),
            AdditionalClaims = new Dictionary<string, object> {
                ["roles"] = new[] { "Admin", "User" }
            },
            Footer = new Dictionary<string, object> {
                ["kid"] = "dpm0"
            },
        };

        return PasetoUtility.Sign(_publicKey, _privateKey, claims);
    }

    protected string autenticarToken(string token, string chavePublica) {
        byte[] _publicKey = HexToBytes(chavePublica);
        if (Object.Equals(PasetoUtility.Parse(_publicKey, token, validateTimes: true), null)) {
            return "Token NÃO autenticado/válido!";
        }
        return "Token autenticado/válido!";
    }

    protected static byte[] HexToBytes(string hexString) {
        var bytes = new byte[hexString.Length / 2];
        for (int i = 0; i < bytes.Length; i++) {
            bytes[i] = Convert.ToByte(hexString.Substring(i * 2, 2), 16);
        }

        return bytes;
    }

 

    protected void btnAutenticar_Click(object sender, EventArgs e) {
        ltrAut.Text = autenticarToken(txtToken.Text, txtChavePublicaAut.Text);

    }

    protected void btnCopiar_Click(object sender, EventArgs e) {
        txtChavePublicaAut.Text = txtChavePublica.Text;
    }

    protected void btnCopiarToken_Click(object sender, EventArgs e) {
        txtToken.Text = ltrToken.Text;

    }

    protected void btnGerarChave_Click(object sender, EventArgs e) {
        RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
        var byteArray = new byte[32];
        provider.GetBytes(byteArray);

        var oi = CryptoBytes.ToHexStringLower(byteArray);

        byte[] chavePri, chavePu;

        Ed25519.KeyPairFromSeed(out chavePu, out chavePri, byteArray);

        var pri = CryptoBytes.ToHexStringLower(chavePri);
        var pu = CryptoBytes.ToHexStringLower(chavePu);


        chaveSementeGerada.Text = oi;
        chavePublicaGerada.Text = pu;
    }

    protected void btnGerarToken_Click(object sender, EventArgs e) {
        Panel1.Visible = true;
        ltrToken.Text = criarToken(txtChavePublica.Text, txtChavePrivada.Text);
    }


    protected void btnCopiarChavePublica_Click(object sender, EventArgs e) {
        txtChavePublica.Text = chavePublicaGerada.Text;
    }

    protected void btnCopiarSemente_Click(object sender, EventArgs e) {
        txtChavePrivada.Text = chaveSementeGerada.Text;
    }
}