# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---
## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:
![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:
- SQL Development
- Data Architect
- Data Engineering  
- ETL Pipeline Developer  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Important Links & Tools:

Everything is for Free!
- **[Datasets](datasets/):** Access to the project dataset (csv files).
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight server for hosting your SQL database.
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** GUI for managing and interacting with databases.
- **[Git Repository](https://github.com/):** Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently.
- **[DrawIO](https://www.drawio.com/):** Design data architecture, models, flows, and diagrams.
- **[Notion](https://www.notion.com/templates/sql-data-warehouse-project):** Get the Project Template from Notion
- **[Notion Project Steps](https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4):** Access to All Project Phases and Tasks.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

[Uploadin<mxfile host="Electron" agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) draw.io/26.2.15 Chrome/134.0.6998.205 Electron/35.2.1 Safari/537.36" version="26.2.15">
  <diagram name="Page-1" id="IfTcvdhtgXC3iKlWWBE6">
    <mxGraphModel dx="1042" dy="634" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="850" pageHeight="1100" background="#ffffff" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="Deb1r_7sN2KZVMdTd77c-2" value="" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#FFFFFF;dashed=1;dashPattern=8 8;" parent="1" vertex="1">
          <mxGeometry y="100" width="120" height="290" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-3" value="&lt;h2&gt;sources&lt;/h2&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#FFFFFF;fontSize=13;labelBackgroundColor=none;strokeColor=#FFFFFF;fontColor=#000000;dashed=1;dashPattern=8 8;" parent="1" vertex="1">
          <mxGeometry x="14.99" y="80" width="90" height="40" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-6" value="" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#FFFFFF;" parent="1" vertex="1">
          <mxGeometry x="180" y="50" width="510" height="490" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-7" value="Data Warehouse&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#FFFFFF;fontColor=#000000;fontStyle=1;dashed=1;dashPattern=8 8;strokeColor=#FFFFFF;" parent="1" vertex="1">
          <mxGeometry x="355" y="20" width="120" height="60" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-8" value="" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#FFFFFF;dashed=1;dashPattern=8 8;" parent="1" vertex="1">
          <mxGeometry x="720" y="90" width="120" height="290" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-9" value="" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#FFFFFF;dashed=1;dashPattern=8 8;" parent="1" vertex="1">
          <mxGeometry x="1440" y="100" width="120" height="290" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-10" value="&lt;h2&gt;Consume&lt;/h2&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#FFFFFF;fontSize=13;labelBackgroundColor=none;strokeColor=#FFFFFF;fontColor=#000000;" parent="1" vertex="1">
          <mxGeometry x="720" y="80" width="120" height="40" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-11" value="&lt;div style=&quot;&quot;&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Bronze Layer&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffe6cc;strokeColor=#d79b00;" parent="1" vertex="1">
          <mxGeometry x="210" y="70" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-13" value="&lt;div&gt;Silver Layer&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#bac8d3;strokeColor=#23445d;" parent="1" vertex="1">
          <mxGeometry x="360" y="70" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-14" value="&lt;div&gt;&lt;br&gt;&lt;/div&gt;Gold Layer&lt;div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#e3c800;strokeColor=#B09500;fontColor=#000000;" parent="1" vertex="1">
          <mxGeometry x="520" y="70" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-15" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" parent="1" source="Deb1r_7sN2KZVMdTd77c-11" target="Deb1r_7sN2KZVMdTd77c-11" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-17" value="&lt;div style=&quot;&quot;&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;" parent="1" vertex="1">
          <mxGeometry x="210" y="130" width="120" height="380" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-18" value="&lt;div style=&quot;&quot;&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;" parent="1" vertex="1">
          <mxGeometry x="365" y="130" width="120" height="380" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-19" value="&lt;div style=&quot;&quot;&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div style=&quot;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;" style="rounded=0;whiteSpace=wrap;html=1;" parent="1" vertex="1">
          <mxGeometry x="520" y="130" width="120" height="380" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-20" value="CRM&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/general/Folder_Blank.svg;" parent="1" vertex="1">
          <mxGeometry x="43.980000000000004" y="130" width="32.03" height="26" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-21" value="" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/general/File.svg;" parent="1" vertex="1">
          <mxGeometry x="59.78" y="136" width="16.23" height="20" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-28" value="ERP&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/general/Folder_Blank.svg;" parent="1" vertex="1">
          <mxGeometry x="43.99" y="242" width="32.03" height="26" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-29" value="" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/general/File.svg;" parent="1" vertex="1">
          <mxGeometry x="59.78" y="248" width="16.23" height="20" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-31" value="" style="shape=link;html=1;rounded=0;exitX=0.027;exitY=0.653;exitDx=0;exitDy=0;exitPerimeter=0;" parent="1" source="Deb1r_7sN2KZVMdTd77c-2" edge="1">
          <mxGeometry width="100" relative="1" as="geometry">
            <mxPoint x="9.99" y="290" as="sourcePoint" />
            <mxPoint x="120" y="290" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-37" value="&lt;b&gt;Object Type&lt;/b&gt;: Table" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="210" y="253.5" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-38" value="&lt;b&gt;Interface&lt;/b&gt;: Files in Folder" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry y="340" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-39" value="" style="html=1;verticalLabelPosition=bottom;align=center;labelBackgroundColor=#ffffff;verticalAlign=top;strokeWidth=2;strokeColor=#36393d;shadow=0;dashed=0;shape=mxgraph.ios7.icons.data;fillColor=#ffcc99;" parent="1" vertex="1">
          <mxGeometry x="249" y="170" width="42" height="50" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-40" value="" style="html=1;verticalLabelPosition=bottom;align=center;labelBackgroundColor=#ffffff;verticalAlign=top;strokeWidth=2;strokeColor=#36393d;shadow=0;dashed=0;shape=mxgraph.ios7.icons.data;fillColor=#cce5ff;" parent="1" vertex="1">
          <mxGeometry x="404" y="170" width="42" height="50" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-41" value="" style="html=1;verticalLabelPosition=bottom;align=center;labelBackgroundColor=#ffffff;verticalAlign=top;strokeWidth=2;strokeColor=#36393d;shadow=0;dashed=0;shape=mxgraph.ios7.icons.data;fillColor=#ffff88;" parent="1" vertex="1">
          <mxGeometry x="560" y="170" width="40" height="50" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-42" value="" style="shape=mxgraph.arrows.arrow_right;html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeWidth=2;strokeColor=#36393d;fillColor=#cce5ff;" parent="1" vertex="1">
          <mxGeometry x="330" y="190" width="40" height="17" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-43" value="" style="shape=mxgraph.arrows.arrow_right;html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeWidth=2;strokeColor=#36393d;fillColor=#cce5ff;" parent="1" vertex="1">
          <mxGeometry x="485" y="190" width="40" height="17" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-44" value="" style="shape=mxgraph.arrows.arrow_right;html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeWidth=2;strokeColor=#36393d;fillColor=#cce5ff;" parent="1" vertex="1">
          <mxGeometry x="130" y="260" width="40" height="17" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-45" value="Raw Data" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="240" y="220" width="60" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-46" value="Cleaned,Standarized D&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;ata&lt;/span&gt;" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=9;" parent="1" vertex="1">
          <mxGeometry x="380" y="220" width="100" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-47" value="Business-Ready Data" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="530" y="220" width="100" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-48" value="&lt;b&gt;Object Type&lt;/b&gt;: CSV Files" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="0.009999999999990905" y="305" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-49" value="&lt;b&gt;Load:&lt;/b&gt;&lt;div&gt;&amp;nbsp;Batch Processing&lt;/div&gt;&lt;div&gt;Full Load (trunc &amp;amp; insert)&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;white-space: pre;&quot;&gt;&#x9;&lt;/span&gt;No &lt;b&gt;Tranformations&lt;/b&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;b&gt;Data Model&lt;/b&gt;: None (as-is)&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="210" y="275" width="120" height="160" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-52" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="1" source="Deb1r_7sN2KZVMdTd77c-50" target="Deb1r_7sN2KZVMdTd77c-51" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-50" value="&lt;b&gt;Object Type&lt;/b&gt;: Table" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="365" y="253.5" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-53" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" parent="1" source="Deb1r_7sN2KZVMdTd77c-51" target="Deb1r_7sN2KZVMdTd77c-50" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-51" value="&lt;b&gt;Load:&lt;/b&gt;&lt;div&gt;&amp;nbsp;Batch Processing&lt;/div&gt;&lt;div&gt;Full Load (trunc &amp;amp; insert)&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Tranformations:&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Data Cleaning&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Data Standarization&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Data Normalization&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Derived Columns&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Data Enrichment&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;b&gt;Data Model&lt;/b&gt;: None (as-is)&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="365" y="290" width="120" height="180" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-54" value="&lt;b&gt;Object Type&lt;/b&gt;: Views" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="520" y="253.5" width="120" height="30" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-55" value="&lt;b&gt;No Load:&lt;/b&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Tranformations:&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Data Intergrations&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Aggregations&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b&gt;Business Logics&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;b&gt;Data Model&lt;/b&gt;:&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Star Schema&lt;/div&gt;&lt;div&gt;Flat Table&lt;/div&gt;&lt;div&gt;Aggregated Table&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=10;" parent="1" vertex="1">
          <mxGeometry x="520" y="283.5" width="120" height="180" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-56" value="" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/analytics/Power_BI_Embedded.svg;" parent="1" vertex="1">
          <mxGeometry x="755" y="122" width="51" height="68" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-57" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.mysql_db_instance;fillColor=#2E73B8;gradientColor=none;" parent="1" vertex="1">
          <mxGeometry x="750" y="203.5" width="60" height="64.5" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-58" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.machine_learning;fillColor=#2E73B8;gradientColor=none;" parent="1" vertex="1">
          <mxGeometry x="742.25" y="277" width="76.5" height="93" as="geometry" />
        </mxCell>
        <mxCell id="Deb1r_7sN2KZVMdTd77c-60" value="" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#C925D1;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.rds_sql_server_instance;" parent="1" vertex="1">
          <mxGeometry x="92" width="78" height="78" as="geometry" />
        </mxCell>
        <mxCell id="MJBW3ak-J9W1hzLiZkgb-1" value="" style="shape=mxgraph.arrows.arrow_right;html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeWidth=2;strokeColor=#36393d;fillColor=#cce5ff;" parent="1" vertex="1">
          <mxGeometry x="670" y="260" width="40" height="17" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
g Project Diagram.drawio…]()

