# from selenium import webdriver
# from selenium.webdriver.chrome.options import Options
# import time

import re
import requests
from bs4 import BeautifulSoup

def getcontent(url):
    
        request=requests.get(url)
        cont = request.content
        return cont

def getcontenthead(url,header):
    
        request=requests.get(url,headers=header)
        cont = request.content
        return cont
    
def get_brick_price(url):
    
    try:

        cont_brick = getcontent(url_brick)

        soup_brick = BeautifulSoup(cont_brick, 'html.parser')

        # Find the <ins> tag within the <p> tag with class "price"
        ins_tag = soup_brick.find("p", class_="price").find("ins") 


        # Extract the text content within the <ins> tag
        price_text_brick = ins_tag.get_text(strip=True)
        # print(price_text_brick)


        # Use regular expression to extract numeric value
        price_value_match_brick = re.search(r'\d+\.\d+', price_text_brick)
        # print(price_value_match_brick)

        if price_value_match_brick:
            # Convert the extracted value to a float
            price_float = float(price_value_match_brick.group())
            print("Extracted price of Brick:", price_float)
        else:
            print("No valid price value found for bricks.")

    except Exception as e:
        print("Error:", e)

def get_cement_price(url):

    try:
        
        url_cement=url
        # get the HTML
        cont_cement =getcontent(url_cement)
        soup_cement=BeautifulSoup(cont_cement,"html.parser")
        span_tag = soup_cement.find("p",class_="price").find("span")
        cement_price_text = span_tag.get_text(strip=True)
        # print(cement_price_text)

        price_value_match_cement = re.search(r'[\d,]+\.\d+', cement_price_text)
        # print(price_value_match_cement)

        if price_value_match_cement:
            # Convert the extracted value to a float
            price_float_cement = float(price_value_match_cement.group().replace(',',''))
            print("Extracted price of Cement:", price_float_cement)
        else:
            print("No valid price value found for cement.")


    except Exception as e:
        print("Error:", e)

def get_sand_price(url):
    try:
        url_sand=url
        cont_sand = getcontent(url_sand)
        soup_sand= BeautifulSoup(cont_sand, 'html.parser')
        span_tag = soup_sand.find("p", class_="price").find("span")
        sand_price_text = span_tag.get_text(strip=True)


        price_sand  = re.search(r'[\d,]+\.\d+', sand_price_text)
        if price_sand:

            price_float_sand = float(price_sand.group().replace(',',''))
            price_float_sand=price_float_sand/1200 #convert trollery rate to per cubic feet
            price_float_sand=round(price_float_sand,1)
            print("Extracted Price of Sand: ", price_float_sand)
        else:
            print("No valid price value found for sand.")


    except Exception as e:
        print("Error:", e)


def get_crush_price(url):
    try:
        url_crush = url
        cont_crush = getcontent(url_crush)

        soup_crush = BeautifulSoup(cont_crush,"html.parser")
        span_tag = soup_crush.find("p", class_="price").find("span")
        crush_price_text = span_tag.get_text(strip=True)

        price_crush  = re.search(r'[\d,]+\.\d+', crush_price_text)
        if price_crush:

            price_float_crush = float(price_crush.group().replace(',',''))
            price_float_crush=price_float_crush/1200 #convert trollery rate to per cubic feet
            price_float_crush=round(price_float_crush,1)
            print("Extracted Price of Crush: ", price_float_crush)
        else:
            print("No valid price value found for crush.")


    except Exception as e:
        print("Error:", e) 

def get_roof_insl_price(url):

    try:
        url_roof_insl = url
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}
        cont_roof_insl  =  getcontenthead(url_roof_insl,headers)
        # print(cont_roof_insl)

        soup_roof_insl = BeautifulSoup(cont_roof_insl, "html.parser")
        table = soup_roof_insl.find("figure", class_="wp-block-table")
        rows = table.find_all('tr')[1:]

        for row in rows:
            cells = row.find_all('td')
            material=cells[1].text.strip()
            estimate = cells[2].text.strip()
            
            if(material=="Roof Insulation" or material=="Waterproofing Membrane"):
                cleaned_price_range = ''.join(c for c in estimate if c.isdigit() or c == '–')
            # Check if the estimate contains a range
                if '–' in cleaned_price_range:
                    min_price, max_price = map(float, cleaned_price_range.split('–'))
                    avg = (min_price + max_price) / 2
                    if(material=="Roof Insulation"):
                        print("Extracted Price of Roof Insulation:", round(avg, 3))
                    elif(material=="Waterproofing Membrane"):
                        print("Extracted Price of Water Proofing :", round(avg, 3))

                else:
                    avg = float(cleaned_price_range)
                    if(material=="Roof Insulation"):
                        print("Extracted Price of Roof Insulation:", round(avg, 3))
                    elif(material=="Waterproofing Membrane"):
                        print("Extracted Price of Water Proofing :", round(avg, 3))

        
    except Exception as e:
        print("Error:", e)

def get_termite_price(url):

    try:
        url_termite=url
        headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
        }

        session = requests.Session()
        session.headers.update(headers)

    # Make the request using the session
        getreq_termite = session.get(url_termite)
        cont_termite = getreq_termite.content


        soup_termite=BeautifulSoup(cont_termite,"html.parser")
        span_tag = soup_termite.find("p",class_="price").find("span")
        termite_price_text=span_tag.get_text(strip=True)

        price_termite = re.search(r'[\d,]+', termite_price_text)
        if price_termite:

            price_float_termite = float(price_termite.group().replace(',',''))
            print("Extracted Price of Termite: ", price_float_termite)
        else:
            print("No valid price value found for Termite.")


    except Exception as e:
        print("Error:", e)

def get_excavation_and_armaflex_price(url):

    try:
        url_excavation = url
        cont_excavation = getcontent(url_excavation)

        soup_excavation=BeautifulSoup(cont_excavation,"html.parser")
        trs=soup_excavation.find_all("tr")[1:]
        flag1=False;
        flag2=False;
        flag3=False;

        for tr in trs:
            
            cells = tr.find_all('td')
            material=cells[0].text.strip()
            estimate = cells[1].text.strip()
            if(material=="Excavation & Backfill + Ghassu" or material=="32 mm o/d" or material=="50 mm o/d" ):
                price_text = re.search(r'\d+', estimate).group()
                price=float(price_text)
                if(material=="Excavation & Backfill + Ghassu"):

                    print("Extracted Price of Excavation & Backfill + Ghassu: ",price)
                    flag1=True

                elif(material=="32 mm o/d"):
                    print("Extracted Price of Arma Flex 32 mm o/d pipe ",price)
                    flag2=True
                elif(material=="50 mm o/d"):
                    print("Extracted Price of Arma Flex 50 mm o/d pipe ",price)
                    flag3=True
            
        if(flag1==False):
            print("Price of Excavation & Backfill + Ghassu not found")
        if(flag2==False):
            print("Price of Arma Flex 32 mm o/d pipe not found")
        if(flag3==False):
            print("Price of Arma Flex 50 mm o/d pipe not found")


    except Exception as e:
        print("Error:", e)

def get_steel_price(url):
        
    try:
        url_steel=url
        cont_steel = getcontent(url_steel)
        soup_steel=BeautifulSoup(cont_steel,"html.parser")
        span_tag = soup_steel.find("p",class_="price").find("span")
        steel_price_text = span_tag.get_text(strip=True)


        price_steel  = re.search(r'[\d,]+\.\d+', steel_price_text)
        if price_steel:

            price_float_steel = float(price_steel.group().replace(',',''))
            print("Extracted Price of Steel: ", price_float_steel)
        else:
            print("No valid price value found for sand.")



    except Exception as e:
        print("Error:", e)

def get_pipe_price(url):
    try:
        urls_pipes=url
        
        i=0

        for urls in urls_pipes:

            cont_pipe = getcontent(urls)

            soup_pipe = BeautifulSoup(cont_pipe,"html.parser")

            span_tag=soup_pipe.find("div", class_="price-list").find("span", class_="price")
            pipe_price_text = span_tag.get_text(strip=True)
            numeric_part = re.search(r'\d[\d,]*', pipe_price_text).group()

            price_pipe = float(numeric_part.replace(',', ''))
            price_pipe=price_pipe/13.1 #change 4 meters to  price per foot
            price_pipe=round(price_pipe,1)

            if(i==0):
                print("Extracted Price of 25mm o/d Pipe:", price_pipe)
            elif(i==1):
                print("Extracted Price of 32mm o/d Pipe:", price_pipe)
            elif(i==2):
                print("Extracted Price of 40mm o/d Pipe:", price_pipe)
            elif(i==3):
                print("Extracted Price of 50mm o/d Pipe:", price_pipe)
            i+=1

    except Exception as e:
        print("Error:", e)


def scrap_dia_pipes(url):
    
    try:
        cont_diapipe=getcontent(url)

        soup_dia_pipes=BeautifulSoup(cont_diapipe, 'html.parser')

        text='null'

        for i in range(2,5):
            label_tags = soup_dia_pipes.find_all("div", class_="radio")

            flag=False
            for div_element in label_tags:
                #print(str(i)+'"')
                concatenate=str(i)+'"'
                                           
                label_elements = div_element.find_all("label")
                for label_element in label_elements:

                    text = label_element.get_text(strip=True)
        
                    if text.startswith(concatenate):
                        flag=True
                        i=i+1
                        break
                     
                if flag==True:
                    
                    break
                      
            text= ' '.join(text.split())

            text= text[i:]    #removing 1st 2 char from string
         
            # Extract numeric part using regular expression
            numeric_part = re.search(r'[\d,]+', text)

            j=i-1

            if numeric_part:
                price_dia_pipe = float(numeric_part.group().replace(',', ''))
                price_dia_pipe=price_dia_pipe/13.1
                price_dia_pipe=round(price_dia_pipe,1)
                print("Extracted price of "+str(j)+" Dia pipe:",price_dia_pipe)
                
            else:
                print("No numeric value found")   
                             
      
    except Exception as e:
        print("Error:", e)   


def scrap_sevarage_6dia(url):
    
    try:
        cont_severage_6dia=getcontent(url)
        
        soup_sevarage_6dia=BeautifulSoup(cont_severage_6dia, 'html.parser')

        text='null'

        for i in range(6,7):
            label_tags = soup_sevarage_6dia.find_all("div", class_="radio")

            flag=False
            for div_element in label_tags:
                
                
                label_elements = div_element.find_all("label")
                for label_element in label_elements:

                    text = label_element.get_text(strip=True)
                    if text.startswith('6"'):
                        flag=True
                        break

                if flag==True:
                    break
        
            text= ' '.join(text.split())

            text= text[2:]    #removing 1st 2 char from string

            # Extract numeric part using regular expression
            numeric_part = re.search(r'[\d,]+', text)

            if numeric_part:
                price_sevarage_6dia = float(numeric_part.group().replace(',', ''))
                price_sevarage_6dia=price_sevarage_6dia/13.1
                price_sevarage_6dia=round(price_sevarage_6dia,1)
                print("Extracted price of Severage 6 Dia pipe:",price_sevarage_6dia)
            else:
                print("No numeric value found")   
      
    except Exception as e:
        print("Error:", e) 


def gi_welded_pipe_price(url):
    try:
        cont_gi_welded=getcontent(url)
        
        soup_gi_welded=BeautifulSoup(cont_gi_welded, 'html.parser')

        text='null'

        for i in range(6,7):
            label_tags = soup_gi_welded.find_all("div", class_="radio")

            flag=False
            for div_element in label_tags:
                
                
                label_elements = div_element.find_all("label")
                for label_element in label_elements:

                    text = label_element.get_text(strip=True)
                    if text.startswith('3/'):
                        flag=True
                        break

                if flag==True:
                    break
        
            text= ' '.join(text.split())

            text= text[4:]    #removing 1st 2 char from string
            # Extract numeric part using regular expression
            numeric_part = re.search(r'[\d,]+', text)

            if numeric_part:
                price_gi_welded = float(numeric_part.group().replace(',', ''))
                price_gi_welded=price_gi_welded/19.6 #convert 6 meter rate to per foot
                price_gi_welded=round(price_gi_welded,1)
                print("Extracted price of GI Welded Pipe:",price_gi_welded)
            else:
                print("No numeric value found for GI Welded Pipe") 

    except Exception as e:
        print("Error:", e) 



def get_gas_cock_price(url):
    try:
        cont_gas_cock = getcontent(url)
        soup_gas_cock = BeautifulSoup(cont_gas_cock,'html.parser')
        bdi_tag=soup_gas_cock.find("p", class_="price").find("span", class_="amount").find("bdi")
        price_text = bdi_tag.get_text(strip=True)

        numeric_part = re.sub(r'[^\d.]', '', price_text)
         # print(price_value_match_cement)

        if numeric_part:
            # Convert the extracted value to a float
            price_float_gas_cock = float(numeric_part.replace(',',''))
            print("Extracted price of Gas Cock:", price_float_gas_cock)
        else:
            print("No valid price value found for Gas Cock.")


    except Exception as e:
        print("Error:", e) 


def get_water_pump_price(url):
    try:
        cont_water_pump = getcontent(url)
        soup_water_pump = BeautifulSoup(cont_water_pump,'html.parser')
        bdi_tag=soup_water_pump.find("p", class_="price").find("span", class_="amount").find("bdi")
        price_text = bdi_tag.get_text(strip=True)

        numeric_part = re.sub(r'[^\d.]', '', price_text)

        if numeric_part:
            # Convert the extracted value to a float
            price_float_water_pump = float(numeric_part.replace(',',''))
            print("Extracted price of Water Pump:", price_float_water_pump)
        else:
            print("No valid price value found for Water Pump.")
    

    except Exception as e:
        print("Error:", e)           

def get_floor_drain_price(url):
    try:
        cont_floor_drain =  getcontent(url)
        # print(cont_floor_drain)
        soup_floor_drain = BeautifulSoup(cont_floor_drain, 'html.parser')
        span_tag = soup_floor_drain.find("div", class_="detail-offer-left").find("p",class_="detail-offer").find("span", class_="new-price")
        price_text=span_tag.get_text(strip=True)
        numeric_part = re.sub(r'\D', '', price_text)

        if numeric_part:
            # Convert the extracted value to a float
            price_float = float(numeric_part)
            print("Extracted price of Floor Drain:", price_float)
        else:
            print("No valid price value found.")

    
    except Exception as e:
        print("Error:", e)        

def get_ac_drainage_price(url):
    try:
        cont_ac_drainage= getcontent(url)
        # print(cont_ac_drainage)
        soup_ac_drainage = BeautifulSoup(cont_ac_drainage,'html.parser')
        
        b_tag = soup_ac_drainage.find("div", class_="single_detail").find("div",class_="list").find("b")
        price_text=b_tag.get_text(strip=True)

        numeric_part = re.sub(r'\D', '', price_text)

        if numeric_part:
            price_float = float(numeric_part)
            print("Extracted price of AC Drainage Pipe:", price_float)
        else:
            print("No valid price value found for AC Drainage Pipe.")

          
    except Exception as e:
        print("Error:", e)        

def get_water_transfer_price(url):
    try:
        cont_water_transfer  = getcontent(url)
        soup_water_transfer = BeautifulSoup(cont_water_transfer,'html.parser')
        bdi_tag=soup_water_transfer.find("p", class_="price").find("span", class_="amount").find("bdi")
        price_text = bdi_tag.get_text(strip=True)

        numeric_part = re.sub(r'[^\d.]', '', price_text)

        if numeric_part:
            # Convert the extracted value to a float
            price_float_water_transfer = float(numeric_part.replace(',',''))
            print("Extracted price of Water Transfer:", price_float_water_transfer)
        else:
            print("No valid price value found for Water Transfer.")
    
    except Exception as e:
        print("Error:", e)        


def four_core_16_mm_price(url):
    try:
        cont_four_core = getcontent(url)
        soup_four_core = BeautifulSoup(cont_four_core,'html.parser')
        bdi_tag = soup_four_core.find("p", class_="price").find("span", class_="amount").find("bdi")
        price_text = bdi_tag.get_text(strip=True)

        numeric_part = re.sub(r'[^\d.]', '', price_text)

        if numeric_part:
            # Convert the extracted value to a float
            price_float_four_core = float(numeric_part.replace(',',''))
            print("Extracted price of 4 core 16 mm conducting cable:", price_float_four_core)
        else:
            print("No valid price value found for 4 core 16 mm conducting cable.")
            



    except Exception as e:
        print("Error:", e)        

def get_phn_cable_price(url):
    try:
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}
        cont_phn_cable = getcontenthead(url,headers)

        soup_phn_cable = BeautifulSoup(cont_phn_cable,'html.parser')
        div_tag = soup_phn_cable.find("div", class_="clear-custom").find("div", class_="col-sm-12")
        price_text = div_tag.get_text(strip=True)

        numeric_part = re.sub(r'\D', '', price_text)

        if numeric_part:
            price_float = float(numeric_part)
            price_float=price_float/300 #convert 300 ft rate to per foot
            price_float=round(price_float,1)
            print("Extracted price of Telephone Cable:", price_float)
        else:
            print("No valid price value found for Telephone Cable.")


    except Exception as e:
        print("Error:", e)        

def get_coxl_price(url):
    try:
        content_coxl = getcontent(url)
        soup_coxl = BeautifulSoup(content_coxl,"html.parser")
        b_tag = soup_coxl.find("div", class_="single_detail").find("div",class_="list").find("b")
        price_text=b_tag.get_text(strip=True)

        numeric_part = re.sub(r'\D', '', price_text)

        if numeric_part:
            price_float = float(numeric_part)
            print("Extracted price of Coaxial Cable:", price_float)
        else:
            print("No valid price value found for Coaxial Cable.")

    except Exception as e:
        print("Error:", e)        


def copper_wire_price(url):
    try:
        urlarray=url
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}

        i=0
        for urls in urlarray:
            cont_copper_wire = getcontenthead(urls,headers)
            # print(cont_copper_wire)
            soup = BeautifulSoup(cont_copper_wire, 'html.parser')

            # Find the label tag associated with the input element
            label_element = soup.find('label', id='sizelradio1')

            # Extract the text content of the label
            if label_element:
                label_text = label_element.get_text(strip=True)
                # Extracting the numeric part from the label text
                price = label_text.split('.')[1]
                price=float(price)
                if(i==0):
                    print("Extracted Price of 1.5 mm conductor wire: ",price)
                elif(i==1):
                    print("Extracted Price of 2.5 mm conductor wire: ",price)
                elif(i==2):
                    print("Extracted Price of 4 mm conductor wire: ",price)
                i+=1


    except Exception as e:
        print("Error:", e)        



if __name__ == "__main__":
    
    url_brick="https://zarea.pk/product/awal-bricks-machine-made/"

    url_cement="https://zarea.pk/product/bestway-cement-opc/"

    url_sand = "https://zarea.pk/product/chanab-sand-a-trolley-1250-cft/"

    url_crush = "https://zarea.pk/product/margalla-crush-900cft/"

    url_roof_insl = "https://alsyedconstruction.com/construction-material-price-in-pakistan/"

    url_termite="https://terminixpakistan.com/product/cypermethrin-10ec-anti-insecticide-1ltr-cotton-boll-worms-commodity-insect/"

    url_excavation = "https://blog.olx.com.pk/properties/3-marla-house-construction-cost-in-pakistan/"

    url_steel = "https://zarea.pk/product/amreli-60-grade-steel-bar/"

    urls_pipes=[
            "https://supertuff.pk/products/super-flo-pprc-pipe-16-din?variant=33671406321801",
            "https://supertuff.pk/products/super-flo-pprc-pipe-16-din?variant=39576081694857",
            "https://supertuff.pk/products/super-flo-pprc-pipe-16-din?variant=39576084152457",
            "https://supertuff.pk/products/super-flo-pprc-pipe-16-din?variant=39576089690249"
        ]


    url_dia_pipes="https://zahidco.com/Pipe-uPVC-Royal-Schedule40"

    url_severage_6dia="https://zahidco.com/uPVC-Royal-Pipe-ClassB"

    url_copper_wires =[
        "https://sukh100.com/shop/power-tech-cables/electric-meterial/cables/2140/15mm-std-7053-copper-wire--power-tech-cables.html",
        "https://sukh100.com/shop/power-tech-cables/electric-meterial/cables/2131/25-mm-1100076-copper-wire--power-tech-cables.html",
        "https://sukh100.com/shop/power-tech-cables/electric-meterial/cables/2126/40mm-7085-std-copper-wire--power-tech-cables.html"
    ]



    url_gi_welded = "https://zahidco.com/Pipe-IIL-GI-EL"

    url_gas_cock = "https://electrobes.com/product/3-4-inch-24vdc-solenoid-valve-normally-closed/"
    
    url_water_pump = "https://ingcomart.com.pk/product/total-gasoline-water-pump-tp3401/"

    url_water_transfer = "https://ezmakaan.com/product/espa-submersible-clean-water-transfer-pump-1hp-220v/"
    
    url_floor_drain="https://www.laptab.com.pk/bounce-press-floor-drain-strainer.html"

    url_ac_drainage = "https://shop.hamariweb.com/inlet-pipe-ac-pipe-4-feet-washing-machine-parts-mpid630898"

    url_four_core_16mmm="https://fiaz.com.pk/product/cable-4-core-standard-16mm/"

    url_telephone_cable = "https://adjungle.pk/ad/coaxial-cable-rg6-300-feet-almost-wire-tv-cable/"

    url_coaxial_cable = "https://shop.hamariweb.com/-30-feet-coaxial-cable-tv-antenna-cable-with-male-female-connector-satellite-dish-digital-signal-audio-video-cable-rg-6-mpid548914"



    get_brick_price(url_brick)

    get_cement_price(url_cement)
    
    get_sand_price(url_sand)
    
    get_crush_price(url_crush)
    
    get_roof_insl_price(url_roof_insl)
    
    get_termite_price(url_termite)
    
    get_excavation_and_armaflex_price(url_excavation)
    
    get_steel_price(url_steel)
    
    get_pipe_price(urls_pipes)
    
    scrap_dia_pipes(url_dia_pipes)

    scrap_sevarage_6dia(url_severage_6dia)

    copper_wire_price(url_copper_wires)

    gi_welded_pipe_price(url_gi_welded)

    get_gas_cock_price(url_gas_cock)

    get_water_pump_price(url_water_pump)

    get_water_transfer_price(url_water_transfer)

    get_floor_drain_price(url_floor_drain)

    get_ac_drainage_price(url_ac_drainage)

    four_core_16_mm_price(url_four_core_16mmm)

    get_phn_cable_price(url_telephone_cable)

    get_coxl_price(url_coaxial_cable)    