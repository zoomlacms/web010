using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.Helper;
using ZoomLa.BLL.User.Addon;
using ZoomLa.BLL.WxPayAPI;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.User;
using ZoomLa.SQLDAL;

public partial class sale : System.Web.UI.Page
{
    B_User buser = new B_User();
    B_Pub pubBll = new B_Pub();
    M_Pub pubMod = new M_Pub();
    int PubID = 8;
    int Mid = 53;
    protected void Page_Load(object sender, EventArgs e)
    {
        B_User.CheckIsLogged();
        M_UserInfo mu = buser.GetLogin();
        if (mu.GroupID != 3)
            function.WriteErrMsg("权限不足，无法使用！", "/User/");
        int proid = DataConvert.CLng(Request.QueryString["bm"]);
    }

    private void ForDataColumn(M_Pub pubMod, DataTable dt)
    {
        M_UserInfo mu = buser.GetLogin();
        string[] fields = "PubAddTime,PubUserName,PubUserID,PubIP,Pubupid,Pubstart".Split(',');
        foreach (string field in fields)
        {
            if (!dt.Columns.Contains(field)) { dt.Columns.Add(new DataColumn(field, typeof(string))); }
        }
        DataRow dr = dt.Rows[0];
        dr["PubAddTime"] = DateTime.Now;
        dr["PubUserName"] = mu.UserName;
        dr["PubUserID"] = mu.UserID;
        dr["PubIP"] = IPScaner.GetUserIP();
        dr["Pubupid"] = PubID;
        dr["Pubstart"] = pubMod.PubIsTrue == 1 ? 0 : 1;//是否审核
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        
        double money = 5;
        M_UserInfo mu = buser.GetLogin();
        DataTable pubdt = SqlHelper.ExecuteTable(CommandType.Text, "select * from ZL_Pub_code where PubUserID=" + mu.UserID + " And Pubstart=1 And DATEDIFF(MINUTE,PubAddTime,GETDATE())<=5", null);
        if (pubdt.Rows.Count > 0)
        {
            function.WriteErrMsg("五分钟之内只能购买一次！");
        }
        else
        {
            DataTable bmdt = SqlHelper.ExecuteTable("select * from ZL_CommonModel left join ZL_C_yjbl on ItemID=ID where ModelID=51 And Status=99 And bm=" + bm.Text);
            if (bmdt.Rows.Count > 0)
            {
                DataTable bmudt = SqlHelper.ExecuteTable("select * from ZL_Pub_code where Pubstart=1 And bm=" + bm.Text);
                if (bmudt.Rows.Count > 0)
                {
                    function.WriteErrMsg("该编码已使用，请重新输入！");
                }
                else
                {
                    pubMod = pubBll.SelReturnModel(PubID);
                    string Mdata = "[{PubContentid:'" + bm.Text + "',PubTitle:'业绩信息',PubContent:'" + PubContent.Text + "',bm:'" + bm.Text + "'}]";
                    DataTable dt = JsonConvert.DeserializeObject<DataTable>(Mdata);
                    ForDataColumn(pubMod, dt);
                    DataRow dr = dt.Rows[0];
                    if (DBCenter.Insert(pubMod.PubTableName, BLLCommon.GetFields(dr), BLLCommon.GetParas(dr), BLLCommon.GetParameters(dr)) > 0)
                    {
                        M_Uinfo umub = buser.GetUserBaseByuserid(mu.UserID);
                        switch (umub.Province)
                        {
                            case "北京":
                                money = 10;
                                break;
                            default:
                                break;
                        }
                        buser.ChangeVirtualMoney(mu.UserID, new M_UserExpHis()
                        {
                            score = 10,
                            ScoreType = 1,
                            detail = "销售产品获得资金：" + money + "，业绩编码：" + bm.Text
                        });
                        function.WriteSuccessMsg("销售成功！", "/User/Info/ConsumeDetail1.aspx?SType=1");
                    }
                }
            }
            else
            {
                function.WriteErrMsg("该编码无效，请重新输入！");
            }
        }
    }
}