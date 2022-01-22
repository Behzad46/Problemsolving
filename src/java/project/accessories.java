
package project;
import java.util.Date;
import java.sql.*;
import java.text.*;
import javax.swing.JOptionPane;
import org.apache.tools.ant.taskdefs.Length;
import java.text.NumberFormat;
import java.util.regex.Pattern;

public class accessories {
    public class RegularExpressions {
    public  String regExpMatches ( String patternToMatch ) { 
             String matchResult = "The string \"" + patternToMatch + "\" DOES NOT matches."; 
             if ( Pattern.matches("damage|minor damages|heavy damage", patternToMatch ) ) { 
                 matchResult = "The string \"" + patternToMatch + "\" MATCHES"; 
             } 
             return matchResult; 
    } 
}

public Connection con,con1;
public PreparedStatement pst,pst1,st,st1,st2,st3,st4,st5,st6;
public ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7;
public String url = "jdbc:sqlserver://localhost:1433;databaseName=problems_abfa";
public String id= "sa";
public String pass = "1234";
public String query,query1,query2,query3,query4,query5,query6;  

    public String u_f = new String();
    public String u_f2 = new String();
    public String rls = new String();
    public double[][] a = new double[5][6];
    public String[][] e = new String[5][6];
    public String[] b = new String[21];
    public String[] c = new String[11];
    public String[] d = new String[11];
    public String[] f = new String[6];
    public String[] utf = new String[10000];
    public String[] bim = new String[255];
    public String Left;
    public String Right;
    public String LStr;
    public String IStr;
    public String FStr;
    public String DStr;
    public long bbb = 0;
    public int subm = 0;
    public double adad;
    public double adad_abs;
    public long Datediff;
    public long DateNum;
    public Date Dateadd = new Date();
    public Date p_to_l_d_d;
    public String l_to_p_d;
    public String p_to_l_d;
    public String ddat_c;
    public String Dnam;
    public String Mnam;
    public String ep;
    public String frm_;
    public String frm2_;
    public String e_pp;
    public double nadad;
    public java.text.DecimalFormat df =
        new java.text.DecimalFormat("###,###,###,###,###");
    public java.text.DecimalFormat df2 =
        new java.text.DecimalFormat("###############");
    int i;
    int j;
    long roz;

    ////////////////////////////////////////////تبدیل تاریخ لاتین به فارسی////////////////////////////////////////////

    public String l_to_p_d(Date ddat) {
        int salp;
        int salpp;
        int sal;
        int cabis;
        int ctr;
        int mod;
        int mod2;
        int mah1;
        int rozz;
        String sal_c;
        String mah_c;
        String roz_c;
        boolean mod3;
        salpp = ddat.getYear();
        salp = salpp + 1900;
        ddat_c = "01/01/" + salp;
        Date ddat_d = new Date(ddat_c);
        roz = this.getDateDiff(ddat_d, ddat);
        sal = salp - 1922;
        cabis = 0;
        ctr = salpp - (salpp / 4) * 4;
        if (ctr == 0) {
            cabis = 1;
        }
        int nnsalp=0;
        roz=roz+nnsalp;
        if(sal==48 && roz>78){
        	roz=roz+1;
        }
        
        
        if (roz <= 58) {
            roz = roz + 287;
        } else if (roz <= 78 && cabis == 0) {
            roz = roz + 287;
        } else if (roz <= 79 && cabis == 1) {
            roz = roz + 287;
        } else {
            roz = roz - 78 - cabis;
            sal = sal + 1;
        }
        
        mod = (sal - 75) / 4 * 4;
        mod2 = (sal - 75);
        mod3 = mod == mod2;
        if (mod3 && sal > 74) {
            roz = roz + 1;
        }
         if (roz > 186) {
            mah1 = 7 + ((int)roz - 187) / 30;
            rozz = (int)roz;
            roz = roz - 186 - (mah1 - 7) * 30;
            if (roz == 0) {
                roz = 30;
            }
            if (rozz == (mah1 - 7) * 30 + 186) {
                mah1 = mah1 - 1;
            }
            mod = (sal - 70) / 4 * 4;
            mod2 = (sal - 70);
            if (mah1 == 12 && mod != mod2 && roz == 30 && sal < 74) {
                sal = sal + 1;
                mah1 = 1;
                roz = 1;
            }
            mod = (sal - 71) / 4 * 4;
            mod2 = (sal - 71);
            if (mah1 == 12 && mod != mod2 && roz == 30 && sal > 73) {
                sal = sal + 1;
                mah1 = 1;
                roz = 1;
            }
        } else {
            mah1 = ((int)roz - 1) / 31 + 1;
            rozz = (int)roz;
            roz = roz - (mah1 - 1) * 31;
            if (roz == 0) {
                roz = 31;
            }
            if (rozz == (mah1 - 1) * 31) {
                mah1 = mah1 - 1;
            }
        }
        if (mah1 >= 13) {
            mah1 = mah1 - 12;
            sal = sal + 1;
        }
        sal_c = "" + sal;
        if (mah1 < 10) {
            mah_c = "0" + mah1;
        } else {
            mah_c = "" + mah1;
        }
        if (roz < 10) {
            roz_c = "0" + roz;
        } else {
            roz_c = "" + roz;
        }
        l_to_p_d = sal_c + "/" + mah_c + "/" + roz_c;
        if (l_to_p_d.matches("1/01/02")) {
            l_to_p_d = "";
        }
        return l_to_p_d;
    }

    /////////////////////////////////////////تبدیل تاریخ فارسی به لاتین/////////////////////////////////////////////

    public Date p_to_l_d_d(String ddat_c) {
        int salf=0;
        int sal1=0;
        int mah1=0;
        int roz1=0;
        int sal2=0;
        int mah2=0;
        int roz2=0;
        int mod=0;
        int mod2=0;
        try {
            Date date_s;
            String sal_c;
            if (ddat_c.length() == 6) {
                sal1 = Integer.parseInt(ddat_c.trim().substring(0, 2));sal2=sal1;
                mah1 = Integer.parseInt(ddat_c.trim().substring(2, 4));mah2=mah1;
                roz1 = Integer.parseInt(ddat_c.trim().substring(4, 6));roz2=roz1;
            } else if (ddat_c.length() == 8) {
                sal1 = Integer.parseInt(ddat_c.trim().substring(0, 2));sal2=sal1;
                mah1 = Integer.parseInt(ddat_c.trim().substring(3, 5));mah2=mah1;
                roz1 = Integer.parseInt(ddat_c.trim().substring(6, 8));roz2=roz1;
            } else {
                sal1 = 0;
                mah1 = 0;
                roz1 = 0;
            }
            if (roz1 == 0) {
                roz1 = 1;
            }
            if (roz1 >= 31) {
                roz1 = 31;
            }
            if (mah1 == 0) {
                mah1 = 1;
            }
            if (mah1 >= 12) {
                mah1 = 12;
            }
            if (sal1 == 0) {
                sal1 = 1;
            }
            if (sal1 >= 100) {
                sal1 = 99;
            }
            salf = sal1;
            sal1 = sal1 + 1921;
            if (roz1 > 30) {
                if (mah1 > 6) {
                    roz1 = 30;
                }
            }
            sal_c = "" + sal1;
            date_s = new Date("03/20/" + sal_c);
            if (mah1 > 6) {
                roz1 = roz1 + 186 + (mah1 - 7) * 30;
            } else {
                roz1 = roz1 + (mah1 - 1) * 31;
            }
            mod = (salf - 75) / 4 * 4;
            mod2 = (salf - 75);
            if (mod == mod2 && salf > 74) {
                roz1 = roz1 - 1;
            }
             if(sal2*10000+mah2*100+roz2<=481011){
            	p_to_l_d_d = this.DateAdd(date_s, (roz1-1));
            }else{
            	p_to_l_d_d = this.DateAdd(date_s, roz1);
            }	
        } catch (Throwable error) {
            p_to_l_d_d = null;
        }
        try {
            if (p_to_l_d_d.getYear() == 22) {
                p_to_l_d_d = null;
            }
        } catch (Throwable er) {
        }
        return p_to_l_d_d;
    }

    public String p_to_l_d(String ddat_c) {
        try {
            String pd = p_to_l_d_d(ddat_c).toString() + " ";
            int ln = pd.length();
            p_to_l_d =
                    pd.substring(8, 10) + "-" + pd.substring(4, 7) + "-" + pd.substring(ln -
                                                                                        5,
                                                                                        ln).trim();
        } catch (Throwable error) {
            p_to_l_d = null;
        }
        return p_to_l_d;
    }

    ////////////////////////////////////روزهای هفته///////////////////////////////////////////////////////

    String getDnam(Date ddat) {
        try {
            int wd = ddat.getDay();
            b[0] = "يكشنبه";
            b[1] = "دوشنبه";
            b[2] = "سه شنبه";
            b[3] = "چهارشنبه";
            b[4] = "پنجشنبه";
            b[5] = "جمعه";
            b[6] = "شنبه";
            Dnam = b[wd];
        } catch (Throwable eror) {
            Dnam = "";
        }
        return Dnam;
    }
    ///////////////////////////////////////تعیین ماههای سال/////////////////////////////////////////////////

    String mah(int m) {
      String mf="";
      b[1] = "فروردين";
      b[2] = "ارديبهشت";
      b[3] = "خرداد";
      b[4] = "تير";
      b[5] = "مرداد";
      b[6] = "شهريور";
      b[7] = "مهر";
      b[8] = "آبان";
      b[9] = "آذر";
      b[10] = "دي";
      b[11] = "بهمن";
      b[12] = "اسفند";
      mf=b[m];
      return mf;
    }
        ///////////////////////////////////////تعیین ماههای سال/////////////////////////////////////////////////

        String getMnam(Date ddat) {
        try {
            String mn = this.l_to_p_d(ddat);
            int md = Integer.parseInt(mn.substring(3, 5));
            b[1] = "فروردين";
            b[2] = "ارديبهشت";
            b[3] = "خرداد";
            b[4] = "تير";
            b[5] = "مرداد";
            b[6] = "شهريور";
            b[7] = "مهر";
            b[8] = "آبان";
            b[9] = "آذر";
            b[10] = "دي";
            b[11] = "بهمن";
            b[12] = "اسفند";
            Mnam = b[md];
        } catch (Throwable eror) {
            Mnam = "";
        }
        return Mnam;
    }

    /////////////////////////////////////////////////جمع تاریخ//////////////////////////////////////////////////

    public Date DateAdd(Date dat1, long roz) {
        long rz1;
        long rz2;
        java.util.Date bbb=new java.util.Date();
        int aa=0;
        if(bbb.getTimezoneOffset()<=-60 || bbb.getTimezoneOffset()>=60){aa=1;}
//        aa=1;
        String sd1 = this.getmdy(dat1);
        rz1 = Date.parse(sd1) / 3600 / 24 / 1000;
        rz2 = (rz1 + roz+aa) * 3600 * 24 * 1000 + 3600 * 6 *1000;
        Date Dateadd = new Date(rz2);
        return Dateadd;
    }

    /////////////////////////////////////کنترل وتاییدتاریخ فارسی وارده/////////////////////////////////////////

    String getpdo(String pdi) {
        String pdo__ = "";
        try {
            pdo__ = this.l_to_p_d(this.p_to_l_d_d(pdi));
        } catch (Throwable error) {
        }
        return pdo__;
    }

    ///////////////////////////////////////////////کنترل وتاییدتاریخ لاتین////////////////////////////////////////

    long getedo(String pdi) {
        long edo__ = this.getDateNum(this.p_to_l_d_d(pdi));
        return edo__;
    }

    /////////////////////////////////////تعیین فاصله تاریخی/////////////////////////////////////////////////////

    public long getDateDiff(Date dat1, Date dat2) {
        String sd1 = this.getmdy(dat1);
        String sd2 = this.getmdy(dat2);
        long rz1 = Date.parse(sd1) / 3600 / 24 / 1000;
        long rz2 = (Date.parse(sd2)) / 3600 / 24 / 1000;
        Datediff = rz2 - rz1;
        return Datediff;
    }

    ///////////////////////////////////////////////////روزهای هفته به لاتین//////////////////////////////////////

    long getDateNum(Date dat1) {
        String sd1 = this.getmdy(dat1);
        long rz1 = Date.parse(sd1);
        DateNum = rz1;
        return DateNum;
    }

    /////////////////////////////////////تعیین تاریخ به صورت yy/mm/dd //////////////////////////////////////////

    String getmdy(Date dat) {
        int y = dat.getYear() + 1900;
        int m = dat.getMonth() + 1;
        int d = dat.getDate();
        String mdy = m + "/" + d + "/" + y;
        return mdy;
    }

    ///////////////////////////////////////////////تعیین متن فارسی اعداد///////////////////////////////////////////////

    public String getrls(double adad) {
        for (i = 0; i <= 4; i++) {
            b[i] = "";
            d[i] = "";
            c[i] = "";
            f[i] = "";
            for (j = 0; j < 4; j++) {
                e[i][j] = "";
                a[i][j] = 0l;
            }
        }
        a[4][5] = adad;
        b[1] = "";
        b[2] = " ويك";
        b[3] = " ودو";
        b[4] = " وسه";
        b[5] = " وچهار";
        b[6] = " وپنچ";
        b[7] = " وشش";
        b[8] = " وهفت";
        b[9] = " وهشت";
        b[10] = " ونه";
        b[11] = " وده";
        b[12] = " ويازده";
        b[13] = " ودوازده";
        b[14] = " وسيزده";
        b[15] = " وچهارده";
        b[16] = " وپانزده";
        b[17] = " وشانزده";
        b[18] = " وهفده";
        b[19] = " وهجده";
        b[20] = " ونوزده";
        c[1] = "";
        c[2] = "";
        c[3] = " وبيست";
        c[4] = " وسي";
        c[5] = " وچهل";
        c[6] = " وپنجاه";
        c[7] = " وشصت";
        c[8] = " وهفتاد";
        c[9] = " وهشتاد";
        c[10] = " ونود";
        d[1] = "";
        d[2] = " ويكصد";
        d[3] = " ودويست";
        d[4] = " وسيصد";
        d[5] = " وچهارصد";
        d[6] = " وپانصد";
        d[7] = " وششصد";
        d[8] = " وهفتصد";
        d[9] = " وهشتصد";
        d[10] = " ونهصد";
        f[1] = "";
        f[4] = "";
        f[3] = " هزار";
        f[2] = " ميليون";
        f[1] = " ميليارد";
        String dd_ff = df2.format(adad);
        a[4][5] = adad;
        double dd_ff2 = a[4][5];
        double dd_fft = Double.parseDouble(getRight(dd_ff, 1));
        if (dd_fft > 0 && a[4][5] >= 1000000000l) {
            dd_ff2 = dd_ff2 - dd_fft;
        }
        bbb=(long)(dd_ff2 / 1000000000l);
        a[4][1] = (double)bbb;
        dd_ff2 = a[4][5];
        dd_fft = (double)Long.parseLong(getRight(dd_ff, 1));
        if (dd_fft > 0 && a[4][5] >= 1000000l) {
            dd_ff2 = dd_ff2 - dd_fft;
        }
        bbb=(long)(dd_ff2 / 1000000l);
        a[4][2] = (double)bbb - a[4][1] * 1000l;
        bbb=(long)(a[4][5] / 1000l);
        a[4][3] = (double)bbb - a[4][2] * 1000l - a[4][1] * 1000000l;
        a[4][4] =a[4][5] - 1000l * a[4][3] - 1000000l * a[4][2] - 1000000000 * a[4][1];
        for (i = 1; i <= 4; i++) {
        	bbb=(long)(a[4][i] / 100l);
            a[3][i] = (double)bbb;
        	bbb=(long)(a[4][i] / 10);
            a[2][i] = (double)bbb - a[3][i] * 10;
            a[1][i] = a[4][i] - a[3][i] * 100l - a[2][i] * 10;
        }
        String matn = "";
        for (i = 4; i >= 1; i--) {
            if (a[4][i] > 0l) {
                if (a[2][i] < 2l) {
                    matn =d[(int)a[3][i] + 1] + b[(int)a[2][i] * 10 + (int)a[1][i] + 1] + f[i] + matn;
                } else {
                    matn =d[(int)a[3][i] + 1] + c[(int)a[2][i] + 1] + b[(int)a[1][i] + 1] + f[i] + matn;
                }
            }
        }
        if (matn.length() > 2) {
            matn = getRight(matn, matn.length() - 2);
        }
        rls = matn;
        return rls;
    }

    ///////////////////////////////////////////////تعیین متن فارسی اعداد///////////////////////////////////////////////

    String getrlss(double adad) {
        for (i = 0; i <= 4; i++) {
            b[i] = "";
            d[i] = "";
            c[i] = "";
            f[i] = "";
            for (j = 0; j < 4; j++) {
                e[i][j] = "";
                a[i][j] = 0l;
            }
        }
        a[4][5] = adad;
        b[1] = "";
        b[2] = " ويكم";
        b[3] = " ودوم";
        b[4] = " وسوم";
        b[5] = " وچهارم";
        b[6] = " وپنچم";
        b[7] = " وششم";
        b[8] = " وهفتم";
        b[9] = " وهشتم";
        b[10] = " ونهم";
        b[11] = " ودهم";
        b[12] = " ويازدهم";
        b[13] = " ودوازدهم";
        b[14] = " وسيزدهم";
        b[15] = " وچهاردهم";
        b[16] = " وپانزدهم";
        b[17] = " وشانزدهم";
        b[18] = " وهفدهم";
        b[19] = " وهجدهم";
        b[20] = " ونوزدهم";
        c[1] =  " ";
        c[2] = " ";
        c[3] = " وبيست";
        c[4] = " وسي";
        c[5] = " وچهل";
        c[6] = " وپنجاه";
        c[7] = " وشصت";
        c[8] = " وهفتاد";
        c[9] = " وهشتاد";
        c[10] = " ونود";
        d[1] = "";
        d[2] = " ويكصد";
        d[3] = " ودويست";
        d[4] = " وسيصد";
        d[5] = " وچهارصد";
        d[6] = " وپانصد";
        d[7] = " وششصد";
        d[8] = " وهفتصد";
        d[9] = " وهشتصد";
        d[10] = " ونهصد";
        f[1] = "";
        f[4] = "";
        f[3] = " هزار";
        f[2] = " ميليون";
        f[1] = " ميليارد";
        String dd_ff = df2.format(adad);
        a[4][5] = adad;
        double dd_ff2 = a[4][5];
        double dd_fft = Double.parseDouble(getRight(dd_ff, 1));
        if (dd_fft > 0 && a[4][5] >= 1000000000l) {
            dd_ff2 = dd_ff2 - dd_fft;
        }
        bbb=(long)(dd_ff2 / 1000000000l);
        a[4][1] = (double)bbb;
        dd_ff2 = a[4][5];
        dd_fft = Double.parseDouble(getRight(dd_ff, 1));
        if (dd_fft > 0 && a[4][5] >= 1000000l) {
            dd_ff2 = dd_ff2 - dd_fft;
        }
        bbb=(long)(dd_ff2 / 1000000l);
        a[4][2] = (double)bbb - a[4][1] * 1000l;
        bbb=(long)(a[4][5] / 1000l);
        a[4][3] = (double)bbb - a[4][2] * 1000l - a[4][1] * 1000000l;
        a[4][4] =a[4][5] - 1000l * a[4][3] - 1000000l * a[4][2] - 1000000000 * a[4][1];
        for (i = 1; i <= 4; i++) {
        	bbb=(long)(a[4][i] / 100l);
            a[3][i] = (double)bbb;
        	bbb=(long)(a[4][i] / 10);
            a[2][i] = (double)bbb - a[3][i] * 10;
            a[1][i] = a[4][i] - a[3][i] * 100l - a[2][i] * 10;
        }
        String matn = "";
        for (i = 4; i >= 1; i--) {
            if (a[4][i] > 0l) {
                if (a[2][i] < 2l) {
                    matn =d[(int)a[3][i] + 1] + b[(int)a[2][i] * 10 + (int)a[1][i] + 1] + f[i] + matn;
                } else {
                    matn =d[(int)a[3][i] + 1] + c[(int)a[2][i] + 1] + b[(int)a[1][i] + 1] + f[i] + matn;
                }
            }
        }
        if (matn.length() > 2) {
            matn = getRight(matn, matn.length() - 2);
        }
        rls = matn;
        return rls;
    }

    ////////////////////////////////////////////////////////////////////////////////

    public String render1(String u_u) {
        String u_u2 = "";
        int ii = u_u.length();
        for (int i = 0; i < ii; i++) {
            int ib = u_u.substring(i, i + 1).hashCode() * 7;
            u_u2 = u_u2 + "@" + ib;
        }
        java.util.Date ib_d=new java.util.Date();
        u_u2=u_u2+"@"+ib_d.getTime()*7;
        return u_u2;
    }

    //////////////////////////////////////////////////////////////////////////////

    public String[] render2(String u_u) {
        String[] u_u3 = new String[10];
        String u_u2 = "";
        for (int i = 0; i < 10; i++) {
            u_u3[i] = "";
        }
        try {
            if (u_u == null) {
            } else {
                String cc = "";
                String[] rndr = u_u.split("@");
                int l = rndr.length;
                utf[1575] = "ا";
                utf[1570] = "آ";
                utf[1576] = "ب";
                utf[1662] = "پ";
                utf[1578] = "ت";
                utf[1579] = "ث";
                utf[1580] = "ج";
                utf[1670] = "چ";
                utf[1581] = "ح";
                utf[1582] = "خ";
                utf[1583] = "د";
                utf[1584] = "ذ";
                utf[1585] = "ر";
                utf[1586] = "ز";
                utf[1688] = "ژ";
                utf[1587] = "س";
                utf[1588] = "ش";
                utf[1589] = "ص";
                utf[1590] = "ض";
                utf[1591] = "ط";
                utf[1592] = "ظ";
                utf[1593] = "ع";
                utf[1594] = "غ";
                utf[1601] = "ف";
                utf[1602] = "ق";
                utf[1603] = "ك";
                utf[1711] = "گ";
                utf[1604] = "ل";
                utf[1605] = "م";
                utf[1606] = "ن";
                utf[1607] = "ه";
                utf[1608] = "و";
                utf[1610] = "ي";
                utf[1740] = "ي";
                utf[1574] = "ئ";
                utf[1569] = "ء";
                utf[1600] = "ـ";
                utf[1603] = "ك";
                utf[1705] = "ك";
               	String time_start="";
             	try{
            		time_start=rndr[l-1];
              	}catch(Throwable er3){
            	}
               try {
                    for (int i = 1; i < l-1; i++) {
                        int r1 = 0;
                        try {
                            r1 = Integer.parseInt(rndr[i]) / 7;
                        } catch (Throwable er2) {
                        }
                        if (r1 > 255) {
                            cc = utf[r1];
                        } else {
                         }
                        u_u2 = u_u2 + cc;
                    }
                } catch (Throwable er) {
                }
                String[] u_u4 = u_u2.split("&");
                l = u_u4.length;
                for (int j = 0; j < l-1 + 1; j++) {
                    u_u3[j] = u_u4[j];
                }
                u_u3[9]=time_start;
            }
            long lu=0;
            try{
          	  lu=Long.parseLong(u_u3[9]);
            }catch(Throwable er){}
            java.util.Date dt1=new java.util.Date();
            long lu2=dt1.getTime();
            long delta=lu2-lu;
            delta=delta/1000/60/60/24/7;
//             System.out.println(delta);
            if(delta>0){
                for (int i = 0; i < 9; i++) {
                    u_u3[i] = "";
                }
            }
       } catch (Throwable er) {
        }
        return u_u3;
    }

    ////////////////////////////////////////////////////////////////////////

    public String getu_f(String u_u) {
        try{
        	u_u =u_u.replaceAll("\n"," ");
        }catch(Throwable er){
        }
        try{
        	u_u =u_u.replaceAll("\r"," ");
        }catch(Throwable er){
//        	//System.out.println(er);
        }
        String a = "";
        String b = "";
        //انتقال ازUTF-8
        utf[6963] = "ا";
        utf[6958] = "آ";
        utf[6864] = "ب";
        utf[6917] = "پ";
        utf[6866] = "ت";
        utf[6867] = "ث";
        utf[6868] = "ج";
        utf[6892] = "چ";
        utf[6869] = "ح";
        utf[6870] = "خ";
        utf[6871] = "د";
        utf[6872] = "ذ";
        utf[6873] = "ر";
        utf[6874] = "ز";
        utf[6910] = "ژ";
        utf[6875] = "س";
        utf[6876] = "ش";
        utf[6877] = "ص";
        utf[6878] = "ض";
        utf[6879] = "ط";
        utf[6880] = "ظ";
        utf[6881] = "ع";
        utf[6882] = "غ";
        utf[6856] = "ف";
        utf[6857] = "ق";
        utf[6927] = "ك";
        utf[6933] = "گ";
        utf[6859] = "ل";
        utf[6860] = "م";
        utf[6861] = "ن";
        utf[6862] = "ه";
        utf[6863] = "و";
        utf[6929] = "ي";
        utf[6962] = "ئ";
        utf[6957] = "ء";
        utf[6855] = "ـ";
        utf[6865] = "ي";
        utf[6858] = "ك";
        utf[6177] = "Ä";
        utf[6195] = "Ö";
        utf[6201] = "Ü";
        utf[6204] = "ß";
        utf[6209] = "ä";
        utf[6227] = "ö";
        utf[6233] = "ü";
        utf[6182] = "É"; 
        utf[6214] = "é"; 
        //انتقال ازORACLE
        utf[488] = "ا";
        utf[483] = "آ";
        utf[489] = "ب";
        utf[542] = "پ";
        utf[2047] = "ت";
        utf[492] = "ث";
        utf[493] = "ج";
        utf[8607] = "چ";
        utf[494] = "ح";
        utf[495] = "خ";
        utf[496] = "د";
        utf[497] = "ذ";
        utf[498] = "ر";
        utf[499] = "ز";
        utf[2088] = "ژ";
        utf[500] = "س";
        utf[501] = "ش";
        utf[502] = "ص";
        utf[503] = "ض";
        utf[504] = "ط";
        utf[505] = "ظ";
        utf[506] = "ع";
        utf[1884] = "غ";
        utf[2014] = "ف";
        utf[8570] = "ق";
        utf[552] = "ك";
        utf[558] = "گ";
        utf[8574] = "ل";
        utf[8582] = "م";
        utf[8576] = "ن";
        utf[8577] = "ه";
        utf[1062] = "و";
        utf[752] = "ي";
        utf[487] = "ئ";
        utf[1869] = "ء";
        utf[6855] = "ـ";
        utf[2009] = "ي";
        utf[754] = "ک"; //کلمات عربی
        int ia = 0;
        if(u_u==null){u_u="";}
         try{
        	if(u_u.substring(0,2).matches("<<")){
        		u_u="~";
        	}
        }catch(Throwable err){}
        int ii = u_u.length();
        a = "";
        b = "";
        for (int i = 0; i < ii; i++) {
            String ibs = "";
            ibs = u_u.substring(i, i + 1);
            int ibs_h=ibs.hashCode();
            try{
                if(ibs.matches("\u0041")){
                 	ibs=" ";
                     }
            } catch (Throwable er) {
            }
            try{
                if(ibs_h==13){
                 	ibs=" ";
                     }
            } catch (Throwable er) {
            }
            try {
                if(ibs_h==1548){
             	ibs=",";
                 }
            } catch (Throwable er) {
            }
            try {
                if(ibs_h==77){
             	ibs=" ";
                 }
            } catch (Throwable er) {
            }
            try {
                if(ibs_h==34){
             	ibs=" ";
                 }
            } catch (Throwable er) {
            }
            try {
           try {
                if (ibs.matches("'")) {
                    ibs = "~";
                }
            } catch (Throwable er) {
            }
            try {
                if (ibs.matches("\"")) {
                    ibs = " ";
                }
            } catch (Throwable er) {
            }
            int ib = ibs.hashCode();
            b = u_u.substring(i, i + 1);
            try {
                if (b.matches("'")) {
                    b = "~";
                }
            } catch (Throwable er) {
            }
            try {
//                if (b.matches("/")) {
//                    b = ",";
//                }
            } catch (Throwable er) {
            }
            try {
                if (ibs.matches("\"")) {
                    ibs = " ";
                }
            } catch (Throwable er) {
            }
            
            if (ib >= 150) {
                String ias = "";
                ias = u_u.substring(i, i + 2);
                
                int ias_h=ias.hashCode();
                try {
                    if(ias_h==34){
                 	ias=" ";
                     }
                } catch (Throwable er) {
                }
                 try {
                     if (ias.matches("\"")) {
                         ias = " ";
                     }
                 } catch (Throwable er) {
                 }
                try {
                    if (ias.matches("'")) {
                        ias = "~";
                    }
                } catch (Throwable er) {
                }
                try {
                    if(ias_h==6836){
                 	ias="،";
                      }
                } catch (Throwable er) {
                }
                ia = ias.hashCode();
                if (ia < 6000) {
                    ia = 0;
                }
                if (ia == 6863 || ia == 6862 || ia == 6857 || ia == 6858) {
                    if (ib == 216) {
                        ia = ia + 100;
                    }
                } //تفکیک کدهای تکراری
                if (ia > 49000) {
                    ia = ia - 49000;
                }
                if (ia > 10000) {
                    ia = 0;
                }
                i = i + 1;
                if (ia == 0) {
                    b = "";
                } else if (utf[ia] != null) {
                    b = utf[ia];
                }
                try {
                    if(ias_h==6836){
                 	b="،";
                      }
                } catch (Throwable er) {
                }
           }
            int b_h=b.hashCode();
            try{
            	if(b_h==34){
            		b="";
            	}
            }catch(Throwable er){}
            if(ibs_h==44){
             	b=",";
                 }
            } catch (Throwable er) {
            }
            a = a + b;
       }
        u_f = a;
         return u_f;
    }

    ////////////////////////////////////////////////////////////////////////

    public String getu_f2(String u_u) {
        String a = "";
        String b = "";
        //انتقال ازUTF-8
        utf[6963] = "ا";
        utf[6958] = "آ";
        utf[6864] = "ب";
        utf[6917] = "پ";
        utf[6866] = "ت";
        utf[6867] = "ث";
        utf[6868] = "ج";
        utf[6892] = "چ";
        utf[6869] = "ح";
        utf[6870] = "خ";
        utf[6871] = "د";
        utf[6872] = "ذ";
        utf[6873] = "ر";
        utf[6874] = "ز";
        utf[6910] = "ژ";
        utf[6875] = "س";
        utf[6876] = "ش";
        utf[6877] = "ص";
        utf[6878] = "ض";
        utf[6879] = "ط";
        utf[6880] = "ظ";
        utf[6881] = "ع";
        utf[6882] = "غ";
        utf[6856] = "ف";
        utf[6857] = "ق";
        utf[6927] = "ك";
        utf[6933] = "گ";
        utf[6859] = "ل";
        utf[6860] = "م";
        utf[6861] = "ن";
        utf[6862] = "ه";
        utf[6863] = "و";
        utf[6929] = "ي";
        utf[6962] = "ئ";
        utf[6957] = "ء";
        utf[6855] = "ـ";
        utf[6865] = "ي";
        utf[6858] = "ك";
        //انتقال ازORACLE
        utf[488] = "ا";
        utf[483] = "آ";
        utf[489] = "ب";
        utf[542] = "پ";
        utf[2047] = "ت";
        utf[492] = "ث";
        utf[493] = "ج";
        utf[8607] = "چ";
        utf[494] = "ح";
        utf[495] = "خ";
        utf[496] = "د";
        utf[497] = "ذ";
        utf[498] = "ر";
        utf[499] = "ز";
        utf[2088] = "ژ";
        utf[500] = "س";
        utf[501] = "ش";
        utf[502] = "ص";
        utf[503] = "ض";
        utf[504] = "ط";
        utf[505] = "ظ";
        utf[506] = "ع";
        utf[1884] = "غ";
        utf[2014] = "ف";
        utf[8570] = "ق";
        utf[552] = "ك";
        utf[558] = "گ";
        utf[8574] = "ل";
        utf[8582] = "م";
        utf[8576] = "ن";
        utf[8577] = "ه";
        utf[1062] = "و";
        utf[752] = "ي";
        utf[487] = "ئ";
        utf[1869] = "ء";
        utf[6855] = "ـ";
        utf[2009] = "ي";
        utf[754] = "ک"; //کلمات عربی
        int ia = 0;
        int ii = u_u.length();
        a = "";
        b = "";
        for (int i = 0; i < ii; i++) {
            String ibs = "";
            ibs = u_u.substring(i, i + 1);
            int ib = ibs.hashCode();
            b = u_u.substring(i, i + 1);
            try {
            } catch (Throwable er) {
            }
            if (ib >= 150) {
                String ias = "";
                ias = u_u.substring(i, i + 2);
                ia = ias.hashCode();
                int ias_h=ias.hashCode();
                if (ia < 6000) {
                    ia = 0;
                }
                if (ia == 6863 || ia == 6862 || ia == 6857 || ia == 6858) {
                    if (ib == 216) {
                        ia = ia + 100;
                    }
                } //تفکیک کدهای تکراری
                if (ia > 49000) {
                    ia = ia - 49000;
                }
                if (ia > 10000) {
                    ia = 0;
                }
                i = i + 1;
                if (ia == 0) {
                    b = "";
                } else if (utf[ia] != null) {
                    b = utf[ia];
                }
                try {
                    if(ias_h==6836){
                 	b="،";
                      }
                } catch (Throwable er) {
                }
            }
            int b_h=b.hashCode();
            try{
            	if(b_h==34){
            		b="";
            	}
            }catch(Throwable er){}
            a = a + b;
        }
        u_f = a;
        return u_f;
    }

    ///////////////////////////////////////////////////////////////////////////////}

    public String getu_f3(String u_u) {
        String a = "";
        String u_f = "";
        int ii = u_u.length();
        for (int i = 0; i < ii; i++) {
            String ibs = "";
            ibs = u_u.substring(i, i + 1);
            if (ibs == null) {
                ibs = "";
            }
            if (ibs.matches("~")) {
                ibs = "'";
            }
            a = a + ibs;
        }
        u_f = a;
        return u_f;
    }

    ////////////////////////////////////////////////////////////////////////

    public String matn_tarik(String tar_f) {
      String matn_tarik="";
      String tar_f1="13"+tar_f.substring(0,2);
      long ntar_f1=0;
      try{
         ntar_f1=Long.parseLong(tar_f1);
      }catch(Throwable er){}
      tar_f1=getrls(ntar_f1);
      String tar_f2=tar_f.substring(3,5);
      int ntar_f2=0;
      try{
         ntar_f2=Integer.parseInt(tar_f2);
      }catch(Throwable er){}
      tar_f2=mah(ntar_f2);
      String tar_f3=tar_f.substring(6,8);
      long ntar_f3=0;
      try{
         ntar_f3=Long.parseLong(tar_f3);
      }catch(Throwable er){}
      tar_f3=getrlss(ntar_f3);
      matn_tarik=tar_f3+" "+tar_f2+" "+tar_f1;
      return matn_tarik;
    }
    //*****************
    // Numeric Format**
    //*****************

    public double double_(String sadad) {
        nadad = 0;
        String adad = "";
        String c_ = "";
        try {
            int length_ = sadad.length();
            for (int i = 0; i < length_; i++) {
                try {
                    c_ = sadad.substring(i, i + 1);
                } catch (Throwable er) {
                }
                if (!c_.matches(",")) {
                    adad = adad + c_;
                }
            }
            nadad = Double.parseDouble(adad);
        } catch (Throwable er) {
        }
        return nadad;
    }

    //************************
    // Fonction Time of Date**
    //************************

    public String T_date(Date dat_) {
        String tim_ = "";
        int h_ = 0;
        int m_ = 0;
        int s_ = 0;
        String h_s = "00";
        String m_s = "00";
        String s_s = "00";
        try {
            h_ = dat_.getHours();
        } catch (Throwable er) {
        }
        h_s = "" + h_;
        if (h_ < 10) {
            h_s = "0" + h_;
        }
        try {
            m_ = dat_.getMinutes();
        } catch (Throwable er) {
        }
        m_s = "" + m_;
        if (m_ < 10) {
            m_s = "0" + m_;
        }
        try {
            s_ = dat_.getSeconds();
        } catch (Throwable er) {
        }
        s_s = "" + s_;
        if (s_ < 10) {
            s_s = "0" + s_;
        }
        tim_ = h_s + ":" + m_s + ":" + s_s;
        return tim_;
    }

    //********************************************
    // Fonction of Left and Right of the Strings**
    //********************************************

    public String getLeft(String s, int l) {
        int lng = s.length();
        if (lng > l) {
            Left = s.substring(0, l);
        } else {
            Left = s;
        }
        return Left;
    }

    //********************************************

    public String getRight(String s, int l) {
        int lng = s.length();
        if (lng > l) {
            Right = s.substring(lng - l);
        } else {
            Right = s;
        }
        return Right;
    }

    //********************************************

    public String dat_a(String tar) {
        String dat_a = tar;
        String sal = tar.substring(0, 2);
        String mah = tar.substring(3, 5);
        int nsal = Integer.parseInt(sal);
        int nmah = Integer.parseInt(mah);
        switch (nmah) {
        case 1:
            mah = "02";
            break;
        case 2:
            mah = "03";
            break;
        case 3:
            mah = "04";
            break;
        case 4:
            mah = "05";
            break;
        case 5:
            mah = "06";
            break;
        case 6:
            mah = "07";
            break;
        case 7:
            mah = "08";
            break;
        case 8:
            mah = "09";
            break;
        case 9:
            mah = "10";
            break;
        case 10:
            mah = "11";
            break;
        case 11:
            mah = "12";
            break;
        case 12:
            mah = "01";
            nsal = nsal + 1;
            sal = "" + nsal;
            break;
        }
        dat_a = sal + "/" + mah + "/01";
        return dat_a;
    }
    public String date_milady(){
         Date ldate=new Date();
         SimpleDateFormat fdate=new SimpleDateFormat("yyyy-MM-dd");
         String datestart = fdate.format(ldate);
         return datestart;
    }
    public String date_convert(){
         int added, cadded, n_years, n_kabis, n_days, yy, mm, dd ;
         String mms,dds;
         String dats;
         Date ldate=new Date();
         SimpleDateFormat fdate=new SimpleDateFormat("yyyy/MM/dd");
         String dateStart = fdate.format(ldate);
         String dateStop = "1991/03/22";
         Date d1 = null;
         Date d2 = null;
         try {
            d1 = fdate.parse(dateStart);
            d2 = fdate.parse(dateStop);
         } catch (ParseException e) {
            e.printStackTrace();
         }
         added = (int) ((d1.getTime() - d2.getTime()) / (1000 * 60 * 60 * 24));
         cadded=added;
         if (added<365 && added>0) {
             added=added+1;
         }
         added=Math.abs(added);
         if (added==0) {
            return "";
         }
         n_years=(int)((added-1)/365);
         n_kabis=(int)(n_years/4);
         n_days=(added%365)+1;
         if (n_days>=n_kabis) {
             n_days=n_days-n_kabis;
         } else {
             if ((68+n_years)%4==0) {
                 n_days=(n_days-n_kabis)+366;
                 n_years=n_years-1;
             } else {
                 n_days=(n_days-n_kabis)+365;
                 n_years=n_years-1;
             }
         }
         if (cadded<0) {
             n_years=-n_years-1; 
             if ((68+n_years)%4==0) {
                 n_days=(366-n_days)+1;
             } else {
                 n_days=(365-n_days)+1;
             }
  
         }
         yy=70+n_years;
         if (n_days<=6*31) {
             mm=(int)((n_days-1)/31)+1;
             dd=((n_days-1)%31)+1;
         } else if (n_days<=(6*31)+(5*30)) {
             n_days=n_days-6*31;
             mm=(int)((n_days-1)/30)+6+1;
             dd=((n_days-1)%30)+1;
             
         }else{
             mm=12;
             dd=n_days-(6*31+5*30);
         }
 {
         }
         if(String.valueOf(mm).length()==1){
            mms="0"+String.valueOf(mm); 
         }else{
            mms=String.valueOf(mm);  
         }
         if(String.valueOf(dd).length()==1){
            dds="0"+String.valueOf(dd); 
         }else{
            dds=String.valueOf(dd);  
         }
         dats=String.valueOf(yy)+"/"+mms+"/"+dds;
         return dats;
     }
    public String ltof_date(String dat){
         int added, cadded, n_years, n_kabis, n_days, yy, mm, dd ;
         String mms,dds;
         String dats;
         SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
         Date ldate=new Date();
        try {

             ldate = formatter.parse(dat);

        } catch (ParseException e) {
            e.printStackTrace();
        }
         SimpleDateFormat fdate=new SimpleDateFormat("yyyy/MM/dd");
         String dateStart = fdate.format(ldate);
         String dateStop = "1991/03/22";
         Date d1 = null;
         Date d2 = null;
         try {
            d1 = fdate.parse(dateStart);
            d2 = fdate.parse(dateStop);
         } catch (ParseException e) {
            e.printStackTrace();
         }
         added = (int) ((d1.getTime() - d2.getTime()) / (1000 * 60 * 60 * 24));
         cadded=added;
         if (added<365 && added>0) {
             added=added+1;
         }
         added=Math.abs(added);
         if (added==0) {
            return "";
         }
         n_years=(int)((added-1)/365);
         n_kabis=(int)(n_years/4);
         n_days=(added%365)+2;
         if (n_days>=n_kabis) {
             n_days=n_days-n_kabis;
         } else {
             if ((68+n_years)%4==0) {
                 n_days=(n_days-n_kabis)+366;
                 n_years=n_years-1;
             } else {
                 n_days=(n_days-n_kabis)+365;
                 n_years=n_years-1;
             }
         }
         if (cadded<0) {
             n_years=-n_years-1; 
             if ((68+n_years)%4==0) {
                 n_days=(366-n_days)+1;
             } else {
                 n_days=(365-n_days)+1;
             }
  
         }
         yy=70+n_years;
         if (n_days<=6*31) {
             mm=(int)((n_days-1)/31)+1;
             dd=((n_days-1)%31)+1;
         } else if (n_days<=(6*31)+(5*30)) {
             n_days=n_days-6*31;
             mm=(int)((n_days-1)/30)+6+1;
             dd=((n_days-1)%30)+1;
             
         }else{
             mm=12;
             dd=n_days-(6*31+5*30);
         }
 {
         }
         if(String.valueOf(mm).length()==1){
            mms="0"+String.valueOf(mm); 
         }else{
            mms=String.valueOf(mm);  
         }
         if(String.valueOf(dd).length()==1){
            dds="0"+String.valueOf(dd); 
         }else{
            dds=String.valueOf(dd);  
         }
         dats=String.valueOf(yy)+"/"+mms+"/"+dds;
         return dats;
     }

    public String ctelatha(Integer vd,String strk,String ptxt){
        
    Statement  st,st1,st5;
    ResultSet rs1,rs2;
    String query,query1,query5,levelx,l0;
        String idx="";
        String elaatx="";
        String codx="";
        Double wx;
        try {
            con1 = DriverManager.getConnection(url,id,pass);
            	    // Create and execute an SQL statement that returns some data.
            st = con1.createStatement();
            st1 = con1.createStatement();
            st5 = con1.createStatement();
            query = "DELETE FROM elatha0  WHERE cvahed=%s";
            query=String.format(query, vd);
            st.executeUpdate(query);

            query = "DELETE FROM resultx WHERE cvahed=%s";
            query=String.format(query, vd);
            st.executeUpdate(query);

            query = "DELETE FROM elatha  WHERE cvahed=%s";
            query=String.format(query, vd);
            st.executeUpdate(query);
            //----------------------------------------------------------------
            query1 = "SELECT * FROM problemwhys WHERE  id='%s'";
            query1=String.format(query1, strk);
            rs2=st1.executeQuery(query1);
            if (rs2.next()) {
               levelx=rs2.getString("id");
               wx=1.0;
               multwgf(levelx,vd);
               while (true) {                    
                   query = "SELECT * FROM elatha0 WHERE  cvahed=%s";
                   query=String.format(query, vd);
                   rs1=st.executeQuery(query);
                   if (rs1.next()) {
                     wx=rs1.getDouble("wgx");
                     l0=rs1.getString("id");
                     idx=rs1.getString("id");
                     elaatx=rs1.getString("elaat");
                     codx=rs1.getString("code_id");
                     while (true) {                       
                     query1 = "SELECT * FROM elatha0 WHERE  levels='%s' AND cvahed=%s";
                     query1=String.format(query1, l0,vd);
                     rs2=st1.executeQuery(query1);
                     if (rs2.next()) {
                        wx=wx*rs2.getFloat("wgx");
                        l0=rs2.getString("id");
                        idx=rs2.getString("id");
                        elaatx=rs2.getString("elaat");
                        codx=rs2.getString("code_id");
                     } else {
                        query5 = "INSERT INTO elatha (id,elaat,cvahed,code_id,wgx)"
                             + " values ('%s','%s',%s,'%s',%s) ";
                         query5=String.format(query5, idx,elaatx,vd,codx
                                ,wx);
                         st5.executeUpdate(query5);
                         query5 = "DELETE FROM elatha0  WHERE id='%s'";
                         query5=String.format(query5, idx);
                         st5.executeUpdate(query5);
                         break;
                     }
                     }
                  
                   } else {
                       break;
                   }
               }
               multwgf(levelx,vd);
               query = "SELECT * FROM elatha WHERE  cvahed=%s";
               query=String.format(query, vd);
               rs1=st.executeQuery(query);
               while (rs1.next()) {                    
                     query1 = "SELECT * FROM elatha0 WHERE  levels='%s'";
                     query1=String.format(query1, rs1.getString("id"));
                     rs2=st1.executeQuery(query1);
                     if (rs2.next()) {
                        query5 = "DELETE FROM elatha  WHERE id='%s'";
                        query5=String.format(query5, rs1.getString("id"));
                        st5.executeUpdate(query5);
                   }
               }
               query = "SELECT * FROM elatha WHERE  cvahed=%s ORDER BY wgx DESC";
               query=String.format(query, vd);
               rs1=st.executeQuery(query);
               String idxx;
               while (rs1.next()) {  
                    idxx=rs1.getString("id");
                    wx=1.0;
                    while(true){
                        query1 = "SELECT * FROM elatha0 WHERE  cvahed=%sAND id='%s'";
                        query1=String.format(query1, vd,idxx);
                        rs2=st1.executeQuery(query1);
                        if(rs2.next()){
                            wx=wx*rs2.getFloat("wgx");
                            idxx=rs2.getString("levels");
                        }else{
                            break;
                        }
                    }
                     query5 = "INSERT INTO resultx (radif,id,problemtxt,elaat,vazn,cvahed,code_id)"
                             + " values (%s,'%s','%s','%s',%s,%s,'%s') ";
                     query5=String.format(query5,0, rs1.getString("id"),ptxt.trim()
                     ,rs1.getString("elaat"),wx,vd,rs1.getString("code_id"));
                     st5.executeUpdate(query5);
               }
               query = "SELECT * FROM resultx WHERE  cvahed=%s ORDER BY vazn DESC";
               query=String.format(query, vd);
               rs1=st.executeQuery(query);
               int radif=1;
               while (rs1.next()) { 
                     query5 = "UPDATE  resultx SET radif=%s WHERE  cvahed=%s AND id='%s'";
                     query5=String.format(query5, radif,vd, rs1.getString("id"));
                     st5.executeUpdate(query5);
                     radif++;
               } 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    public void multwgf(String lx,Integer vds) {
        Statement st2,st3,st4;
        ResultSet rs3,rs4;
        String query2,query3,query4;
        String lxxx,lxxxx;
        Integer vds1;
        vds1=vds;
        
        try {
           con1 = DriverManager.getConnection(url,id,pass);
            	    // Create and execute an SQL statement that returns some data.
            st2 = con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st3 = con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st4 = con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            query2 = "SELECT * FROM problemwhys WHERE id='%s' AND cvahed=%s";
            query2=String.format(query2, lx,vds);
            rs3=st2.executeQuery(query2);
            if (rs3.next()) {
               lxxx=rs3.getString("id");
               query3 = "SELECT * FROM problemwhys WHERE levels='%s' AND cvahed=%s";
               query3=String.format(query3, lxxx,vds);
               rs4=st3.executeQuery(query3);
               while (rs4.next()) {  
                    lxxxx=rs4.getString("id");
                    query4 = "INSERT INTO elatha0 (id,elaat,cvahed,code_id,wgx,levels)"
                        + " values ('%s','%s',%s,'%s',%s,'%s') ";
                    query4=String.format(query4, rs4.getString("id"),rs4.getString("problemwhyx"),vds,rs4.getString("code_id")
                            ,rs4.getDouble("wgx")/100,rs4.getString("levels"));
                    st4.executeUpdate(query4);
                    multwgf(lxxxx,vds1);
               }
               rs4.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    public void multwgf7(String lx,Integer vds) {
        Statement st2,st3,st4;
        ResultSet rs3,rs4;
        String query2,query3,query4;
        String lxxx,lxxxx;
        Integer vds1;
        vds1=vds;
        
        try {
           con1 = DriverManager.getConnection(url,id,pass);
            	    // Create and execute an SQL statement that returns some data.
            st2 = con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st3 = con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st4 = con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            query2 = "SELECT * FROM problemwhys WHERE id='%s' AND cvahed=%s";
            query2=String.format(query2, lx,vds);
            rs3=st2.executeQuery(query2);
            if (rs3.next()) {
               lxxx=rs3.getString("id");
               query3 = "SELECT * FROM problemwhys WHERE levels='%s' AND cvahed=%s";
               query3=String.format(query3, lxxx,vds);
               rs4=st3.executeQuery(query3);
               while (rs4.next()) {  
                    lxxxx=rs4.getString("id");
                    query4 = "INSERT INTO elatha0_rep6 (id,elaat,cvahed,code_id,wgx,levels)"
                        + " values ('%s','%s',%s,'%s',%s,'%s') ";
                    query4=String.format(query4, rs4.getString("id"),rs4.getString("problemwhyx"),vds,rs4.getString("code_id")
                            ,rs4.getDouble("wgx")/100,rs4.getString("levels"));
                    st4.executeUpdate(query4);
                    multwgf7(lxxxx,vds1);
               }
               rs4.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    public String ctelatha_rahkar(Integer vd,String strk,String ptxt){
        
    Statement  st,st1,st5;
    ResultSet rs1,rs2;
    String query,query1,query5,levelx,l0;
        String idx="";
        String elaatx="";
        String codx="";
        Double wx;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url,id,pass);
            // Create and execute an SQL statement that returns some data.
            st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st5 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            query = "DELETE FROM elatha0  WHERE cvahed=%s";
            query=String.format(query, vd);
            st.executeUpdate(query);

            query = "DELETE FROM resultx WHERE cvahed=%s";
            query=String.format(query, vd);
            st.executeUpdate(query);
            
            query = "DELETE FROM resultx_rahkar WHERE cvahed=%s";
            query=String.format(query, vd);
            st.executeUpdate(query);

            query = "DELETE FROM elatha  WHERE cvahed=%s";
            query=String.format(query, vd);
            st.executeUpdate(query);
            //----------------------------------------------------------------
            query1 = "SELECT * FROM problemwhys WHERE  id='%s'";
            query1=String.format(query1, strk);
            rs2=st1.executeQuery(query1);
            if (rs2.next()) {
                levelx=rs2.getString("id");
                wx=1.0;
                multwgf(levelx,vd);
                while (true) {
                    query = "SELECT * FROM elatha0 WHERE  cvahed=%s";
                    query=String.format(query, vd);
                    rs1=st.executeQuery(query);
                    if (rs1.next()) {
                        wx=rs1.getDouble("wgx");
                        l0=rs1.getString("id");
                        idx=rs1.getString("id");
                        elaatx=rs1.getString("elaat");
                        codx=rs1.getString("code_id");
                        while (true) {
                            query1 = "SELECT * FROM elatha0 WHERE  levels='%s' AND cvahed=%s";
                            query1=String.format(query1, l0,vd);
                            rs2=st1.executeQuery(query1);
                            if (rs2.next()) {
                                wx=wx*rs2.getDouble("wgx");
                                l0=rs2.getString("id");
                                idx=rs2.getString("id");
                                elaatx=rs2.getString("elaat");
                                codx=rs2.getString("code_id");
                            } else {
                                query5 = "INSERT INTO elatha (id,elaat,cvahed,code_id,wgx)"
                                + " values ('%s','%s',%s,'%s',%s) ";
                                query5=String.format(query5, idx,elaatx,vd,codx
                                    ,wx);
                                st5.executeUpdate(query5);
                                query5 = "DELETE FROM elatha0  WHERE id='%s'";
                                query5=String.format(query5, idx);
                                st5.executeUpdate(query5);
                                break;
                            }
                        }

                    } else {
                        break;
                    }
                }
                multwgf(levelx,vd);
                query = "SELECT * FROM elatha WHERE  cvahed=%s";
                query=String.format(query, vd);
                rs1=st.executeQuery(query);
                while (rs1.next()) {
                    query1 = "SELECT * FROM elatha0 WHERE  levels='%s'";
                    query1=String.format(query1, rs1.getString("id"));
                    rs2=st1.executeQuery(query1);
                    if (rs2.next()) {
                        query5 = "DELETE FROM elatha  WHERE id='%s'";
                        query5=String.format(query5, rs1.getString("id"));
                        st5.executeUpdate(query5);
                    }
                }
                query = "SELECT * FROM elatha WHERE  cvahed=%s ORDER BY wgx DESC";
                query=String.format(query, vd);
                rs1=st.executeQuery(query);
               String idxx;
               while (rs1.next()) {  
                    idxx=rs1.getString("id");
                    wx=1.0;
                    while(true){
                        query1 = "SELECT * FROM elatha0 WHERE  cvahed=%s AND id='%s'";
                        query1=String.format(query1, vd,idxx);
                        rs2=st1.executeQuery(query1);
                        if(rs2.next()){
                            wx=wx*rs2.getDouble("wgx");
                            idxx=rs2.getString("levels");
                        }else{
                            break;
                        }
                    }
                     query5 = "INSERT INTO resultx (radif,id,problemtxt,elaat,vazn,cvahed,code_id)"
                             + " values (%s,'%s','%s','%s',%s,%s,'%s') ";
                     query5=String.format(query5,0, rs1.getString("id"),ptxt.trim()
                     ,rs1.getString("elaat"),wx,vd,rs1.getString("code_id"));
                     st5.executeUpdate(query5);
               }
               query = "SELECT * FROM resultx WHERE  cvahed=%s ORDER BY vazn DESC";
               query=String.format(query, vd);
               rs1=st.executeQuery(query);
               int radif=1;
               while (rs1.next()) { 
                     query5 = "UPDATE  resultx SET radif=%s WHERE  cvahed=%s AND id='%s'";
                     query5=String.format(query5, radif,vd, rs1.getString("id"));
                     st5.executeUpdate(query5);
                     radif++;
               } 
                query5 = "DELETE FROM resultx_rahkar  WHERE cvahed=%s";
                query5=String.format(query5, vd);
                st5.executeUpdate(query5);
                query = "SELECT * FROM resultx WHERE  cvahed=%s ORDER BY vazn DESC";
                query=String.format(query, vd);
                rs1=st.executeQuery(query);
                radif=1;
                while (rs1.next()) { 
                    query1 = "SELECT * FROM rahkar WHERE  id='%s' AND oknok=%s";
                    query1=String.format(query1, rs1.getString("id"),1);
                    rs2=st1.executeQuery(query1);
                    while (rs2.next()) {                        
                       query5 = "INSERT INTO resultx_rahkar (radif,problemtxt,id,elaat,vazn,rahkar,mojri,code_id,cvahed)"
                        + " values (%s,'%s','%s','%s',%s,'%s','%s','%s',%s) ";
                       query5=String.format(query5, radif,rs1.getString("problemtxt"),rs1.getString("id")
                          ,rs1.getString("elaat"),rs1.getDouble("vazn"),rs2.getString("rahkar"),rs2.getString("mojri"),rs2.getString("code_id"),vd);
                       st5.executeUpdate(query5);
                       radif++;
                    }
                    
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    public String ctelatha_rahkar_rep6(Integer vd,String strk,String ptxt,String vtxt){
        
    Statement  st,st1,st5;
    ResultSet rs1,rs2;
    String query,query1,query5,levelx,l0;
        String idx="";
        String elaatx="";
        String codx="";
        Double wx;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url,id,pass);
            // Create and execute an SQL statement that returns some data.
            st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            st5 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            query = "DELETE FROM elatha0_rep6 ";
            query=String.format(query, vd);
            st.executeUpdate(query);

            query = "DELETE FROM resultx_rep6 ";
            st.executeUpdate(query);

            query = "DELETE FROM elatha_rep6 ";
            st.executeUpdate(query);
            
            query5 = "DELETE FROM report5 WHERE  cvahed=%s AND id='%s'";
            query5=String.format(query5, vd,strk);
            st5.executeUpdate(query5);

            //----------------------------------------------------------------
            query1 = "SELECT * FROM problemwhys WHERE  id='%s'";
            query1=String.format(query1, strk);
            rs2=st1.executeQuery(query1);
            if (rs2.next()) {
                levelx=rs2.getString("id");
                wx=1.0;
                multwgf7(levelx,vd);
                while (true) {
                    query = "SELECT * FROM elatha0_rep6 WHERE  cvahed=%s";
                    query=String.format(query, vd);
                    rs1=st.executeQuery(query);
                    if (rs1.next()) {
                        wx=rs1.getDouble("wgx");
                        l0=rs1.getString("id");
                        idx=rs1.getString("id");
                        elaatx=rs1.getString("elaat");
                        codx=rs1.getString("code_id");
                        while (true) {
                            query1 = "SELECT * FROM elatha0_rep6 WHERE  levels='%s' AND cvahed=%s";
                            query1=String.format(query1, l0,vd);
                            rs2=st1.executeQuery(query1);
                            if (rs2.next()) {
                                wx=wx*rs2.getDouble("wgx");
                                l0=rs2.getString("id");
                                idx=rs2.getString("id");
                                elaatx=rs2.getString("elaat");
                                codx=rs2.getString("code_id");
                            } else {
                                query5 = "INSERT INTO elatha_rep6 (id,elaat,cvahed,code_id,wgx)"
                                + " values ('%s','%s',%s,'%s',%s) ";
                                query5=String.format(query5, idx,elaatx,vd,codx
                                    ,wx);
                                st5.executeUpdate(query5);
                                query5 = "DELETE FROM elatha0_rep6  WHERE id='%s'";
                                query5=String.format(query5, idx);
                                st5.executeUpdate(query5);
                                break;
                            }
                        }

                    } else {
                        break;
                    }
                }
                multwgf7(levelx,vd);
                query = "SELECT * FROM elatha_rep6 WHERE  cvahed=%s";
                query=String.format(query, vd);
                rs1=st.executeQuery(query);
                while (rs1.next()) {
                    query1 = "SELECT * FROM elatha0_rep6 WHERE  levels='%s'";
                    query1=String.format(query1, rs1.getString("id"));
                    rs2=st1.executeQuery(query1);
                    if (rs2.next()) {
                        query5 = "DELETE FROM elatha_rep6  WHERE id='%s'";
                        query5=String.format(query5, rs1.getString("id"));
                        st5.executeUpdate(query5);
                    }
                }
                query = "SELECT * FROM elatha_rep6 WHERE  cvahed=%s ORDER BY wgx DESC";
                query=String.format(query, vd);
                rs1=st.executeQuery(query);
               String idxx;
               while (rs1.next()) {  
                    idxx=rs1.getString("id");
                    wx=1.0;
                    while(true){
                        query1 = "SELECT * FROM elatha0_rep6 WHERE  cvahed=%s AND id='%s'";
                        query1=String.format(query1, vd,idxx);
                        rs2=st1.executeQuery(query1);
                        if(rs2.next()){
                            wx=wx*rs2.getDouble("wgx");
                            idxx=rs2.getString("levels");
                        }else{
                            break;
                        }
                    }
                     query5 = "INSERT INTO resultx_rep6 (radif,id,problemtxt,elaat,vazn,cvahed,code_id)"
                             + " values (%s,'%s','%s','%s',%s,%s,'%s') ";
                     query5=String.format(query5,0, rs1.getString("id"),ptxt.trim()
                     ,rs1.getString("elaat"),wx,vd,rs1.getString("code_id"));
                     st5.executeUpdate(query5);
               }
               query = "SELECT * FROM resultx_rep6 WHERE  cvahed=%s ORDER BY vazn DESC";
               query=String.format(query, vd);
               rs1=st.executeQuery(query);
               int radif=1;
               while (rs1.next()) { 
                     query5 = "UPDATE  resultx_rep6 SET radif=%s WHERE  cvahed=%s AND id='%s'";
                     query5=String.format(query5, radif,vd, rs1.getString("id"));
                     st5.executeUpdate(query5);
                     radif++;
               } 
                query = "SELECT * FROM resultx_rep6 WHERE  cvahed=%s ORDER BY vazn DESC";
                query=String.format(query, vd);
                rs1=st.executeQuery(query);
                radif=1;
                while (rs1.next()) { 
                    query1 = "SELECT * FROM rahkar WHERE  id='%s' AND oknok=%s";
                    query1=String.format(query1, rs1.getString("id"),1);
                    rs2=st1.executeQuery(query1);
                    while (rs2.next()) {                        
                       query5 = "INSERT INTO report5 (radif,problemtxt,id,elaat,vazn,rahkar,mojri,code_id,cvahed,vahed)"
                        + " values (%s,'%s','%s','%s',%s,'%s','%s','%s',%s,'%s') ";
                       query5=String.format(query5, radif,rs1.getString("problemtxt"),strk
                          ,rs1.getString("elaat"),rs1.getDouble("vazn"),rs2.getString("rahkar"),rs2.getString("mojri"),rs2.getString("code_id"),vd,vtxt);
                       st5.executeUpdate(query5);
                       radif++;
                    }
                    
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
        
      public String problemstr(String strtxt){
         String ixstr="";
          for (int i = 0; i < strtxt.length(); i++) {
              if (strtxt.charAt(i)!='-') {
                          ixstr=ixstr+strtxt.charAt(i);
              } else {
                  break;
              }
             }
         
         return ixstr;
     }
   
}
 