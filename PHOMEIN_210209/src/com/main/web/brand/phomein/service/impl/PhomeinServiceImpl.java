package com.main.web.brand.phomein.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.codec.binary.StringUtils;
import org.hsqldb.lib.DataOutputStream;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.main.admin.customer.service.CustomerService;
import com.main.web.brand.phomein.service.PhomeinService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("phomeinService")
public class PhomeinServiceImpl extends EgovAbstractServiceImpl implements PhomeinService {

	private static final String MOBILENOTOMILEAGE = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><POS REQ_CODE=\"6\"><POINT_REQ><HEAD_OFFICE_NO>860</HEAD_OFFICE_NO><SHOP_NO>000001</SHOP_NO><HP_NO1>#mobileNo1</HP_NO1><HP_NO2>#mobileNo2</HP_NO2><HP_NO3>#mobileNo3</HP_NO3></POINT_REQ></POS>";

	private static final String CARDTOMILEAGEXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><POS REQ_CODE=\"3\"><POINT_REQ><HEAD_OFFICE_NO>860</HEAD_OFFICE_NO><SHOP_NO>000001</SHOP_NO><CARD_NO>#cardNo</CARD_NO><FROM_DATE>19000101</FROM_DATE><TO_DATE>99991231</TO_DATE></POINT_REQ></POS>";
	
	private static final String MERGEMILEAGEXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><POS REQ_CODE=\"5\"><CARD_CHANGE><HEAD_OFFICE_NO>860</HEAD_OFFICE_NO><SHOP_NO>000001</SHOP_NO><ORG_CARD_NO>#orgCardNo</ORG_CARD_NO><NEW_CARD_NO>#newCardNo</NEW_CARD_NO></CARD_CHANGE></POS>";

	@Resource(name = "customerService")
	private CustomerService customerService;

	@Override
	public Map<String, Object> getMobileNoToMilage(String mobileNo) {
		// mobileNo = "010-4076-1223";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "");
		resultMap.put("mileage", 0);
		String url = "http://asp.easypos.net/servlet/PosChannelSVL?cmd=TlxPhomeinCMD";
		BufferedReader in = null;
		InputSource is = null;
		DataOutputStream wr = null;
		// DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		try {
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/soap+xml; charset=utf-8");
			con.setDoOutput(true);
			wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(MOBILENOTOMILEAGE.replaceAll("#mobileNo1", mobileNo.split("-")[0])
					.replaceAll("#mobileNo2", mobileNo.split("-")[1]).replaceAll("#mobileNo3", mobileNo.split("-")[2]));
			wr.flush();
			wr.close();
			String responseStatus = con.getResponseMessage();
			System.out.println(responseStatus);
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			wr.close();
			System.out.println("response:" + response.toString());

			// xml 파싱하기
			is = new InputSource(new StringReader(response.toString()));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			XPathExpression statusExpr = xpath.compile("/POS");
			NodeList statusNodeList = (NodeList) statusExpr.evaluate(doc, XPathConstants.NODESET);

			NamedNodeMap nm = statusNodeList.item(0).getAttributes();
			for (int j = 0; j < nm.getLength(); j++) {
				Node node = nm.item(j);
				if (StringUtils.equals("RESPONSE", node.getNodeName())
						&& StringUtils.equals("0000", node.getTextContent())) {
					XPathExpression mileageExpr = xpath.compile("/POS/POINT_REQ/CURRENT_POINT");
					NodeList mileageNodeList = (NodeList) mileageExpr.evaluate(doc, XPathConstants.NODESET);
					if (mileageNodeList.item(0) != null) {
						NodeList mileageChild = mileageNodeList.item(0).getChildNodes();
						resultMap.put("mileage", mileageChild.item(0).getTextContent());
					} else {
						resultMap.put("message", "보유 마일리지가 없습니다");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("message", "시스템 관리자에게 문의하세요");
		} finally {
			try {
				in.close();
			} catch (Exception e) {

			}
			try {
				wr.close();
			} catch (Exception e) {

			}
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> getCardToMilage(String cardNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "");
		resultMap.put("cardMileage", 0);
		String url = "http://asp.easypos.net/servlet/PosChannelSVL?cmd=TlxPhomeinCMD";
		BufferedReader in = null;
		InputSource is = null;
		DataOutputStream wr = null;
		// DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		try {
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/soap+xml; charset=utf-8");
			con.setDoOutput(true);
			wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(CARDTOMILEAGEXML.replaceAll("#cardNo", cardNo));
			wr.flush();
			wr.close();
			String responseStatus = con.getResponseMessage();
			System.out.println(responseStatus);
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			wr.close();
			System.out.println("response:" + response.toString());

			// xml 파싱하기
			is = new InputSource(new StringReader(response.toString()));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			XPathExpression statusExpr = xpath.compile("/POS");
			NodeList statusNodeList = (NodeList) statusExpr.evaluate(doc, XPathConstants.NODESET);

			NamedNodeMap nm = statusNodeList.item(0).getAttributes();
			for (int j = 0; j < nm.getLength(); j++) {
				Node node = nm.item(j);
				if (StringUtils.equals("RESPONSE", node.getNodeName())
						&& StringUtils.equals("0000", node.getTextContent())) {
					XPathExpression pointExpr = xpath.compile("/POS/POINT_REQ");
					NodeList pointNodeList = (NodeList) pointExpr.evaluate(doc, XPathConstants.NODESET);
					if (pointNodeList.item(0) != null) {
						NodeList pointChild = pointNodeList.item(0).getChildNodes();
						for (int i = 0; i < pointChild.getLength(); i++) {
							if (StringUtils.equals("CURRENT_POINT", pointChild.item(i).getNodeName())) {
								resultMap.put("cardMileage", pointChild.item(i).getTextContent());
							}
						}
					} else {
						resultMap.put("message", "카드번호에 해당하는 마일리지 정보가 존재하지 않습니다");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("message", "시스템 관리자에게 문의하세요");
		} finally {
			try {
				in.close();
			} catch (Exception e) {

			}
			try {
				wr.close();
			} catch (Exception e) {

			}
		}
		return resultMap;
	}
	
	@Override
	public Map<String , Object> mergeCardToMilage(Map<String, Object> paramMap) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String url = "http://asp.easypos.net/servlet/PosChannelSVL?cmd=TlxPhomeinCMD";
		BufferedReader in = null;
		InputSource is = null;
		DataOutputStream wr = null;
		// DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		try {
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/soap+xml; charset=utf-8");
			con.setDoOutput(true);
			wr = new DataOutputStream(con.getOutputStream());
			String data_MERGEMILEAGEXML = "";
			data_MERGEMILEAGEXML = MERGEMILEAGEXML.replaceAll("#orgCardNo", (String)paramMap.get("cardno"));
			data_MERGEMILEAGEXML = data_MERGEMILEAGEXML.replaceAll("#newCardNo", (String)paramMap.get("hp"));
			System.out.println("data_MERGEMILEAGEXML:" + data_MERGEMILEAGEXML);
			wr.writeBytes(data_MERGEMILEAGEXML);
			wr.flush();
			wr.close();
			String responseStatus = con.getResponseMessage();
			System.out.println(responseStatus);
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			wr.close();
			System.out.println("response:" + response.toString());

			// xml 파싱하기
			is = new InputSource(new StringReader(response.toString()));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			XPathExpression statusExpr = xpath.compile("/POS");
			NodeList statusNodeList = (NodeList) statusExpr.evaluate(doc, XPathConstants.NODESET);

			NamedNodeMap nm = statusNodeList.item(0).getAttributes();
			for (int j = 0; j < nm.getLength(); j++) {
				Node node = nm.item(j);
				if (StringUtils.equals("RESPONSE", node.getNodeName())
						&& StringUtils.equals("0000", node.getTextContent())) {
					XPathExpression pointExpr = xpath.compile("/POS/CARD_CHANGE");
					NodeList pointNodeList = (NodeList) pointExpr.evaluate(doc, XPathConstants.NODESET);
					if (pointNodeList.item(0) != null) {
						NodeList pointChild = pointNodeList.item(0).getChildNodes();
						
						for (int i = 0; i < pointChild.getLength(); i++) {
							
							if (StringUtils.equals("RESP_CODE", pointChild.item(i).getNodeName())) {
								
								//System.out.println("==================::IF NODE1::"+ pointChild.item(i).getNodeName() );
								//System.out.println("==================::IF NODE2::"+ pointChild.item(i).getNodeValue() );
								
								//if(pointChild.item(i).getNodeName().equals("1")) {
								if(pointChild.item(i).getNodeName().equals("1") || pointChild.item(i).getNodeValue().equals("1")) {
									resultMap.put("result" , "SUCCESS");
									resultMap.put("code" , pointChild.item(i).getNodeName());
									//System.out.println("==================::SUCCESS::"+ pointChild.item(i).getNodeName() );
								}else {
									resultMap.put("result" , "FAIL");
									resultMap.put("code" , pointChild.item(i).getNodeName());
									resultMap.put("message", "시스템 관리자에게 문의하세요");
									//System.out.println("==================::FAIL::"+ pointChild.item(i).getNodeName() );
								}
								
							}
							
						}
						
					} else {
						resultMap.put("result" , "FAIL");
						resultMap.put("code" , "4");
						resultMap.put("message", "시스템 관리자에게 문의하세요");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result" , "FAIL");
			resultMap.put("code" , "4");
			resultMap.put("message", "시스템 관리자에게 문의하세요");
		} finally {
			try {
				in.close();
			} catch (Exception e) {
				resultMap.put("result" , "FAIL");
				resultMap.put("code" , "4");
				resultMap.put("message", "시스템 관리자에게 문의하세요");
			}
			try {
				wr.close();
			} catch (Exception e) {
				resultMap.put("result" , "FAIL");
				resultMap.put("code" , "4");
				resultMap.put("message", "시스템 관리자에게 문의하세요");
			}
		}
		
		return resultMap;
	}

}
