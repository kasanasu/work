using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // 接続情報
        string connectInfo = @"Data Source=PC名\SQLEXPRESS;Initial Catalog=sample1;User Id=DBのユーザー;Password=ユーザーのパスワード;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // StartAdventureボタンクリックイベント
        public void StartAdventure_Click(object sender, EventArgs e)
        {
            string nullParam = "";
            try
            {
                // フォームからデータを取得
                string famiryName = Famiryname.Text;
                string firstName = Firstname.Text;
                string dog = Dog.SelectedItem.Text;
                string firstBelongings = "";
                for (int i = 0; i < FirstBelongings.Items.Count; i++)
                {
                    if (FirstBelongings.Items[i].Selected)
                    {
                        if (firstBelongings != "")
                        {
                            firstBelongings += ",";
                        }
                        firstBelongings += FirstBelongings.Items[i].Text;
                    }
                }

                // nullチェック
                if (famiryName == "")
                {
                    nullParam = "FamiryName";
                    throw new ArgumentNullException();
                }
                if (firstName == "")
                {
                    nullParam = "FirstName";
                    throw new ArgumentNullException();
                }
                if (dog == Dog.Items[0].Text)
                {
                    nullParam = "冒険の相棒";
                    throw new ArgumentNullException();
                }

                SetData(famiryName, firstName, dog, firstBelongings);
            }
            catch (ArgumentNullException ex)
            {
                //メッセージ
                MessageBox.Show(nullParam + "を決めてください。", "エラー", MessageBoxButtons.OK);
            }
            catch (Exception ex)
            {
                //メッセージ
                MessageBox.Show("何らかのエラーが発生しました。", "エラー", MessageBoxButtons.OK);
            }
        }

        // SQL Serverへデータをセット
        public void SetData(string famiryName, string firstName, string dog, string firstBelongings)
        {
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();

            try
            {
                // 接続
                connection.ConnectionString = connectInfo;
                connection.Open();

                // SELECT文を設定
                command.CommandText = "INSERT INTO Table_1(famiry_name, first_name, dog, first_belongings) values('" + famiryName + "', '" + firstName + "', '" + dog + "', '" + firstBelongings + "')";
                command.Connection = connection;

                // SQL実行
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //メッセージボックスを表示する
                MessageBox.Show("冒険者の情報を入力してください。", "エラー", MessageBoxButtons.OK);
            }
            finally
            {
                // 接続解除
                connection.Close();

                // フォーム内を空にする
                Famiryname.Text = "";
                Firstname.Text = "";
                for (int i = 0; i < Dog.Items.Count; i++)
                {
                    if (Dog.Items[i].Selected)
                    {
                        Dog.Items[i].Selected = false;
                    }
                }
                Dog.Items[0].Selected = true;
                for (int i = 0; i < FirstBelongings.Items.Count; i++)
                {
                    if (FirstBelongings.Items[i].Selected)
                    {
                        FirstBelongings.Items[i].Text = "";
                    }
                }
            }
        }

        public void SearchFriends_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();
            // 戻り値
            DataTable dataTable = null;

            try
            {
                // 接続
                connection.ConnectionString = connectInfo;
                connection.Open();

                // SELECT文を設定
                command.CommandText = "SELECT * FROM Table_1 WHERE dog = '" + Dog.SelectedItem.Text + "'";
                command.Connection = connection;

                // SQL実行
                SqlDataReader reader = command.ExecuteReader();

                // 結果取得
                dataTable = new DataTable();
                dataTable.Load(reader);
            }
            catch (Exception ex)
            {
                //メッセージボックスを表示する
                MessageBox.Show("何らかのエラーが発生しました。", "エラー", MessageBoxButtons.OK);
            }
            finally
            {
                // 接続解除
                connection.Close();
                // バインド
                ListView1.DataSource = dataTable;
                ListView1.DataBind();
            }
        }
    }
}
