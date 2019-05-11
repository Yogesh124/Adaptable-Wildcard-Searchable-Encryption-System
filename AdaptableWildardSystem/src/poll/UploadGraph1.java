package poll;


import java.awt.Color; 
import java.awt.GradientPaint;
import java.awt.Paint;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;



@WebServlet("/UploadGraph1")
public class UploadGraph1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UploadGraph1() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Graph(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Graph(request, response);
	}
	
	public void Graph(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			String fileid="";
			String uptime="";
			String enctime="";
			String name="";
			
			HttpSession session=request.getSession();
			String username=(String) session.getAttribute("username");
			System.out.println("in Upload graph .java page");
			Connection con=ConnectionProvider.getConn();
			PreparedStatement ps=con.prepareStatement("select * from graphtbl where user_id=?");
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				fileid=rs.getString("fileid");
				uptime=rs.getString("uploadTime");
				enctime=rs.getString("EncryptTime");
				name=rs.getString("filename");
				System.out.println("================="+uptime);
				System.out.println("================="+enctime);
			}

			double a1 = Double.parseDouble(uptime);
			double a2 = Double.parseDouble(enctime);
			
			            final double[][] data = new double[][]{
			                {a1},
			                {a2}
			            };

			            final CategoryDataset dataset = DatasetUtilities.createCategoryDataset(
			                    "Pole ", "", data);

			            JFreeChart chart = null;
			            BarRenderer renderer = null;
			            CategoryPlot plot = null;


			            final CategoryAxis categoryAxis = new CategoryAxis(name);
			            final ValueAxis valueAxis = new NumberAxis("Time");
			            renderer = new BarRenderer();

			            plot = new CategoryPlot(dataset, categoryAxis, valueAxis, renderer);
			            plot.setOrientation(PlotOrientation.VERTICAL);
			            chart = new JFreeChart("Time Graph", JFreeChart.DEFAULT_TITLE_FONT, plot, true);

			            chart.setBackgroundPaint(new Color(249, 231, 236));

			            Paint p1 = new GradientPaint(
			                    0.0f, 0.0f, new Color(16, 89, 172), 0.0f, 0.0f, new Color(201, 201, 244));
			            renderer.setSeriesPaint(1, p1);

			            Paint p2 = new GradientPaint(
			                    0.0f, 0.0f, new Color(255, 35, 35), 0.0f, 0.0f, new Color(255, 180, 180));
			            renderer.setSeriesPaint(2, p2);

			            plot.setRenderer(renderer);

			            try {
			                final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			                final File file1 = new File("E:\\All Project\\Ritesh\\CloudProject\\PublicIntigrityUpdated\\WebContent\\images\\uploadGraph.png");
			                ChartUtilities.saveChartAsPNG(file1, chart, 300, 400, info);
			                
			            } catch (Exception e) {
			                e.printStackTrace();
			            }

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
	public void DownloadGraph(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			String fileid="";
			String uptime="";
			String enctime="";
			String name="";
			
			HttpSession session=request.getSession();
			String username=(String) session.getAttribute("username");
			Connection con=ConnectionProvider.getConn();
			PreparedStatement ps=con.prepareStatement("select * from graphtbl2 where user_id=?");
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				fileid=rs.getString("fileid");
				uptime=rs.getString("downloadTime");
				enctime=rs.getString("DecryptTime");
				name=rs.getString("filename");
				System.out.println("================="+uptime);
				System.out.println("================="+enctime);
			}

			double a1 = Double.parseDouble(uptime);
			double a2 = Double.parseDouble(enctime);
			//System.out.println("================="+a1);
			//System.out.println("================="+a2);
			            final double[][] data = new double[][]{
			                {a1},
			                {a2}
			            };

			            final CategoryDataset dataset = DatasetUtilities.createCategoryDataset(
			                    "Pole ", "", data);

			            JFreeChart chart = null;
			            BarRenderer renderer = null;
			            CategoryPlot plot = null;


			            final CategoryAxis categoryAxis = new CategoryAxis(name);
			            final ValueAxis valueAxis = new NumberAxis("Time");
			            renderer = new BarRenderer();

			            plot = new CategoryPlot(dataset, categoryAxis, valueAxis, renderer);
			            plot.setOrientation(PlotOrientation.VERTICAL);
			            chart = new JFreeChart("Time Graph", JFreeChart.DEFAULT_TITLE_FONT, plot, true);

			            chart.setBackgroundPaint(new Color(249, 231, 236));

			            Paint p1 = new GradientPaint(
			                    0.0f, 0.0f, new Color(16, 89, 172), 0.0f, 0.0f, new Color(201, 201, 244));
			            renderer.setSeriesPaint(1, p1);

			            Paint p2 = new GradientPaint(
			                    0.0f, 0.0f, new Color(255, 35, 35), 0.0f, 0.0f, new Color(255, 180, 180));
			            renderer.setSeriesPaint(2, p2);

			            plot.setRenderer(renderer);

			            try {
			                final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			                final File file1 = new File("E:\\All Project\\Ritesh\\CloudProject\\PublicIntigrityUpdated\\WebContent\\images\\DownloadGraph.png");
			                ChartUtilities.saveChartAsPNG(file1, chart, 300, 400, info);
			                
			            } catch (Exception e) {
			                e.printStackTrace();
			            }

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
