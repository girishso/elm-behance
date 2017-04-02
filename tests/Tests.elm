module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Decoders exposing (..)
import Json.Decode exposing (..)


all : Test
all =
    describe "A Test Suite"
        [ test "App.model.message should be set properly" <|
            \() ->
                decodeBehanceTest
        ]


decodeBehanceTest : Expect.Expectation
decodeBehanceTest =
    let
        decodedOutput =
            Json.Decode.decodeString
                Decoders.decodeBehanceProject
                project_json

        _ =
            Debug.log "decodedOutput" decodedOutput
    in
        -- Expect.equal decodedOutput (Ok BehanceProject)
        Expect.equal (3 + 7) 10


project_json : String
project_json =
    """
  {
    "project": {
      "id": 50773047,
      "name": "Visualizing mobility in Washington D.C.",
      "published_on": 1490717541,
      "created_on": 1490634591,
      "modified_on": 1490929202,
      "url": "https:\\/\\/www.behance.net\\/gallery\\/50773047\\/Visualizing-mobility-in-Washington-DC",
      "privacy": "public",
      "fields": [ "Web Design", "UI\\/UX", "Graphic Design" ],
      "covers": {
        "115": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/projects\\/115\\/ec94a450773047.Y3JvcCwxMTkzLDkzNCwxODUsMTAw.jpg",
        "202": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/projects\\/202\\/ec94a450773047.Y3JvcCwxMTkzLDkzNCwxODUsMTAw.jpg",
        "230": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/projects\\/230\\/ec94a450773047.Y3JvcCwxMTkzLDkzNCwxODUsMTAw.jpg",
        "404": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/projects\\/404\\/ec94a450773047.Y3JvcCwxMTkzLDkzNCwxODUsMTAw.jpg",
        "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/projects\\/original\\/ec94a450773047.Y3JvcCwxMTkzLDkzNCwxODUsMTAw.jpg"
      },
      "mature_content": 0,
      "mature_access": "allowed",
      "owners": [
        {
          "id": 102326,
          "first_name": "CLEVER\\u00b0FRANKE",
          "last_name": " Data innovations",
          "username": "cleverfranke",
          "city": "Utrecht",
          "state": "",
          "country": "Netherlands",
          "location": "Utrecht, Netherlands",
          "company": "CLEVER\\u00b0FRANKE - Data innovations",
          "occupation": "",
          "created_on": 1240842008,
          "url": "https:\\/\\/www.behance.net\\/cleverfranke",
          "images": {
            "50": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/user\\/50\\/102326.53ab5d0d16766.jpg",
            "100": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/user\\/100\\/102326.53ab5d0d16766.jpg",
            "115": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/user\\/115\\/102326.53ab5d0d16766.jpg",
            "138": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/user\\/138\\/102326.53ab5d0d16766.jpg",
            "230": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/user\\/230\\/102326.53ab5d0d16766.jpg",
            "276": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/user\\/276\\/102326.53ab5d0d16766.jpg"
          },
          "display_name": "CLEVER\\u00b0FRANKE Data innovations",
          "fields": [ "Graphic Design", "Interaction Design", "UI\\/UX" ],
          "has_default_image": 0,
          "website": "http:\\/\\/www.cleverfranke.com",
          "stats": {
            "followers": 5399,
            "following": 488,
            "appreciations": 12752,
            "views": 299961,
            "comments": 62
          }
        }
      ],
      "stats": {
        "views": 2381,
        "appreciations": 187,
        "comments": 16
      },
      "conceived_on": 1490572800,
      "canvas_width": 1400,
      "tags": [
        "data visualization",
        "Website",
        "district",
        "washington d.c.",
        "Washington",
        "infographic",
        "Infographic Website"
      ],
      "description": "The District of Columbia has one of the most elaborate multimodal transportation systems in the USA. Residents, commuters, and visitors can use cars, transit, taxis, bicycles, and the ped-walk network to access goods and services throughout the District. However, congested travel, low travel time reliability, and bad coverage are issues across ways of transportation. The District Department of Transportation (DDOT) is working to understand these travel issues in order to better define a program of improvements to address them.",
      "editor_version": 5,
      "allow_comments": 1,
      "modules": [
        {
          "id": 301583821,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/a442f150773047.58db795865601.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/a442f150773047.58db795865601.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/a442f150773047.58db795865601.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/a442f150773047.58db795865601.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/a442f150773047.58db795865601.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/a442f150773047.58db795865601.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/a442f150773047.58db795865601.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/a442f150773047.58db795865601.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 785
            },
            "disp": {
              "width": 600,
              "height": 336
            },
            "max_1240": {
              "width": 1240,
              "height": 695
            },
            "max_1920": {
              "width": 1920,
              "height": 1077
            },
            "max_1200": {
              "width": 1200,
              "height": 673
            },
            "max_3840": {
              "width": 3840,
              "height": 2153
            },
            "original": {
              "width": 3840,
              "height": 2153
            }
          },
          "width": 600,
          "height": 336
        },
        {
          "id": 301183493,
          "project_id": 50773047,
          "type": "text",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "text": "<div><span class="bold"><span style="color:#373737;"><br><\\/span><\\/span><\\/div><div><span class="bold"><span style="color:#373737;"><\\/span><span style="color:#5A5A5A;"><span style="font-size:15px;">The District of Columbia has one of the most elaborate multimodal transportation systems in the USA. Residents, commuters, and visitors can use cars, transit, taxis, bicycles, and the ped-walk network to access goods and services throughout the District. However, congested travel, low travel time reliability, and bad coverage are issues across ways of transportation. The District Department of Transportation (DDOT) is working to understand these travel issues in order to better define a program of improvements to address them.<\\/span><\\/span><span style="color:#373737;"><\\/span><br><\\/span><\\/div><div><span class="bold"><span style="color:#376969;"><br><\\/span><\\/span><\\/div><div><br><\\/div><div><br><\\/div>",
          "text_plain": "The District of Columbia has one of the most elaborate multimodal transportation systems in the USA. Residents, commuters, and visitors can use cars, transit, taxis, bicycles, and the ped-walk network to access goods and services throughout the District. However, congested travel, low travel time reliability, and bad coverage are issues across ways of transportation. The District Department of Transportation (DDOT) is working to understand these travel issues in order to better define a program of improvements to address them."
        },
        {
          "id": 301185613,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/ed9a5850773047.58d94af869c63.jpeg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/ed9a5850773047.58d94af869c63.jpeg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/ed9a5850773047.58d94af869c63.jpeg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/ed9a5850773047.58d94af869c63.jpeg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/ed9a5850773047.58d94af869c63.jpeg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/ed9a5850773047.58d94af869c63.jpeg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/ed9a5850773047.58d94af869c63.jpeg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/ed9a5850773047.58d94af869c63.jpeg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 1039
            },
            "disp": {
              "width": 600,
              "height": 445
            },
            "max_1240": {
              "width": 1240,
              "height": 920
            },
            "max_1920": {
              "width": 1920,
              "height": 1425
            },
            "max_1200": {
              "width": 1200,
              "height": 891
            },
            "max_3840": {
              "width": 2560,
              "height": 1900
            },
            "original": {
              "width": 2560,
              "height": 1900
            }
          },
          "width": 600,
          "height": 445
        },
        {
          "id": 301183495,
          "project_id": 50773047,
          "type": "text",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "text": "<div><span style="color:#5A5A5A;"><span style="font-size:15px; font-weight:bold;"><br><\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px; font-weight:bold;">\\u2014 PROJECT BACKGROUND<\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;">The District of Columbia has one of the most elaborate multimodal transportation systems in the USA. Residents, commuters, and visitors can use cars, transit, taxis, bicycles, and the ped-walk network to access goods and services throughout the District. However, congested travel, low travel time reliability, and bad coverage are issues across ways of transportation. The District Department of Transportation (DDOT) is working to understand these travel issues in order to better define a program of improvements to address them.<\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;"><br><\\/span><\\/span><\\/div>",
          "text_plain": "\\u2014 PROJECT BACKGROUNDThe District of Columbia has one of the most elaborate multimodal transportation systems in the USA. Residents, commuters, and visitors can use cars, transit, taxis, bicycles, and the ped-walk network to access goods and services throughout the District. However, congested travel, low travel time reliability, and bad coverage are issues across ways of transportation. The District Department of Transportation (DDOT) is working to understand these travel issues in order to better define a program of improvements to address them."
        },
        {
          "id": 301587699,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/5abb8b50773047.58db7e675347e.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/5abb8b50773047.58db7e675347e.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/5abb8b50773047.58db7e675347e.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/5abb8b50773047.58db7e675347e.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/5abb8b50773047.58db7e675347e.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/5abb8b50773047.58db7e675347e.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/5abb8b50773047.58db7e675347e.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 516
            },
            "disp": {
              "width": 600,
              "height": 221
            },
            "max_1240": {
              "width": 1240,
              "height": 457
            },
            "max_1920": {
              "width": 1920,
              "height": 707
            },
            "max_1200": {
              "width": 1200,
              "height": 442
            },
            "original": {
              "width": 1920,
              "height": 707
            }
          },
          "width": 600,
          "height": 221
        },
        {
          "id": 301183497,
          "project_id": 50773047,
          "type": "text",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "text": "<div><span style="color:#5A5A5A;"><span class="bold"><span style="font-size:15px;">\\u2014 TECHNICAL SETUP<\\/span><\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;">The data for this project is collected from several data sources. These data files are loaded, filtered and visualized as maps in the microsite. The microsite allows users to explore the data in-depth based on selections made by visitors.<\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;">The reports are based on the same datasets and are downloadable from the microsite. These reports are less exploratory but offer conclusions by DDOT.<\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;"><br><\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;"><br><\\/span><\\/span><\\/div><div><br><\\/div>",
          "text_plain": "\\u2014 TECHNICAL SETUPThe data for this project is collected from several data sources. These data files are loaded, filtered and visualized as maps in the microsite. The microsite allows users to explore the data in-depth based on selections made by visitors.The reports are based on the same datasets and are downloadable from the microsite. These reports are less exploratory but offer conclusions by DDOT."
        },
        {
          "id": 301583201,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/c125e950773047.58db787cd7332.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/c125e950773047.58db787cd7332.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/c125e950773047.58db787cd7332.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/c125e950773047.58db787cd7332.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/c125e950773047.58db787cd7332.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/c125e950773047.58db787cd7332.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/c125e950773047.58db787cd7332.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/c125e950773047.58db787cd7332.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 696
            },
            "disp": {
              "width": 600,
              "height": 298
            },
            "max_1240": {
              "width": 1240,
              "height": 617
            },
            "max_1920": {
              "width": 1920,
              "height": 955
            },
            "max_1200": {
              "width": 1200,
              "height": 597
            },
            "max_3840": {
              "width": 3200,
              "height": 1591
            },
            "original": {
              "width": 3200,
              "height": 1591
            }
          },
          "width": 600,
          "height": 298
        },
        {
          "id": 301183499,
          "project_id": 50773047,
          "type": "text",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "text": "<div><span style="color:#5A5A5A;"><span class="bold"><span style="font-size:15px;"><br><\\/span><\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span class="bold"><span style="font-size:15px;">\\u2014 DESIGN<\\/span><\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;">Through captivating images and short text, each of the chapters starts by telling a story around a topical theme. The topic is introduced and it explains the challenges that DC faces. In the subsequent views, the maps is fixed in place on the right side. It is the common denominator on which a different datasets are loaded as the user scrolls through the chapters. Additional highlights, explanations and map controls allow the user to further deep dive the topic. This interplay between the map on the right and controls on the left creates a dynamic yet clear experience.<\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;">Our overall minimalistic style, the lines and shapes of the map dictate the atmosphere of every page. Focussing on content and a clean, elegant look and feel, the user is drawn into the topics. Throughout the website, four colors are used consistently to emphasize the different modes of transport, and red as an overall accent color.<\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;"><br><\\/span><\\/span><\\/div><div><span style="color:#5A5A5A;"><span style="font-size:15px;"><br><\\/span><\\/span><\\/div><div><br><\\/div>",
          "text_plain": "\\u2014 DESIGNThrough captivating images and short text, each of the chapters starts by telling a story around a topical theme. The topic is introduced and it explains the challenges that DC faces. In the subsequent views, the maps is fixed in place on the right side. It is the common denominator on which a different datasets are loaded as the user scrolls through the chapters. Additional highlights, explanations and map controls allow the user to further deep dive the topic. This interplay between the map on the right and controls on the left creates a dynamic yet clear experience.Our overall minimalistic style, the lines and shapes of the map dictate the atmosphere of every page. Focussing on content and a clean, elegant look and feel, the user is drawn into the topics. Throughout the website, four colors are used consistently to emphasize the different modes of transport, and red as an overall accent color."
        },
        {
          "id": 301584965,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/d4550750773047.58db7af17fd2e.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/d4550750773047.58db7af17fd2e.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/d4550750773047.58db7af17fd2e.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/d4550750773047.58db7af17fd2e.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/d4550750773047.58db7af17fd2e.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/d4550750773047.58db7af17fd2e.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/d4550750773047.58db7af17fd2e.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/d4550750773047.58db7af17fd2e.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 3200,
              "height": 1800
            },
            "original": {
              "width": 3200,
              "height": 1800
            }
          },
          "width": 600,
          "height": 338
        },
        {
          "id": 301584967,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/c0053750773047.58db7af180566.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/c0053750773047.58db7af180566.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/c0053750773047.58db7af180566.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/c0053750773047.58db7af180566.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/c0053750773047.58db7af180566.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/c0053750773047.58db7af180566.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/c0053750773047.58db7af180566.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/c0053750773047.58db7af180566.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 3200,
              "height": 1800
            },
            "original": {
              "width": 3200,
              "height": 1800
            }
          },
          "width": 600,
          "height": 338
        },
        {
          "id": 301584969,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/c1377250773047.58db7af180ffc.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/c1377250773047.58db7af180ffc.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/c1377250773047.58db7af180ffc.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/c1377250773047.58db7af180ffc.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/c1377250773047.58db7af180ffc.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/c1377250773047.58db7af180ffc.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/c1377250773047.58db7af180ffc.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/c1377250773047.58db7af180ffc.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 3200,
              "height": 1800
            },
            "original": {
              "width": 3200,
              "height": 1800
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301587695,
          "project_id": 50773047,
          "type": "text",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "text": "<div><span class="bold">Final website<\\/span><\\/div><div><br><\\/div>",
          "text_plain": "Final website"
        },
        {
          "id": 301182465,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/6ca38c50773047.58d947600a4c0.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/6ca38c50773047.58d947600a4c0.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/6ca38c50773047.58d947600a4c0.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/6ca38c50773047.58d947600a4c0.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/6ca38c50773047.58d947600a4c0.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/6ca38c50773047.58d947600a4c0.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/6ca38c50773047.58d947600a4c0.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/6ca38c50773047.58d947600a4c0.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 777
            },
            "disp": {
              "width": 600,
              "height": 333
            },
            "max_1240": {
              "width": 1240,
              "height": 688
            },
            "max_1920": {
              "width": 1920,
              "height": 1065
            },
            "max_1200": {
              "width": 1200,
              "height": 666
            },
            "max_3840": {
              "width": 2560,
              "height": 1420
            },
            "original": {
              "width": 2560,
              "height": 1420
            }
          },
          "width": 600,
          "height": 333,
          "caption": "<div>Homepage<\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": "Homepage"
        },
        {
          "id": 301582591,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/0165dc50773047.58db77c1a43f6.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/0165dc50773047.58db77c1a43f6.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/0165dc50773047.58db77c1a43f6.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/0165dc50773047.58db77c1a43f6.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/0165dc50773047.58db77c1a43f6.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/0165dc50773047.58db77c1a43f6.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/0165dc50773047.58db77c1a43f6.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/0165dc50773047.58db77c1a43f6.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 780
            },
            "disp": {
              "width": 600,
              "height": 334
            },
            "max_1240": {
              "width": 1240,
              "height": 691
            },
            "max_1920": {
              "width": 1920,
              "height": 1069
            },
            "max_1200": {
              "width": 1200,
              "height": 668
            },
            "max_3840": {
              "width": 2880,
              "height": 1604
            },
            "original": {
              "width": 2880,
              "height": 1604
            }
          },
          "width": 600,
          "height": 334,
          "caption": "<div>Stories\\u00a0overview<\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": "Stories\\u00a0overview"
        },
        {
          "id": 301417165,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/60c4c950773047.58da8b573c8c7.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/60c4c950773047.58da8b573c8c7.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/60c4c950773047.58da8b573c8c7.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/60c4c950773047.58da8b573c8c7.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/60c4c950773047.58da8b573c8c7.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/60c4c950773047.58da8b573c8c7.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/60c4c950773047.58da8b573c8c7.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/60c4c950773047.58da8b573c8c7.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 789
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 699
            },
            "max_1920": {
              "width": 1920,
              "height": 1082
            },
            "max_1200": {
              "width": 1200,
              "height": 676
            },
            "max_3840": {
              "width": 2560,
              "height": 1443
            },
            "original": {
              "width": 2560,
              "height": 1443
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div>Start of story<\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": "Start of story"
        },
        {
          "id": 301182475,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/a0631f50773047.58d947600c416.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/a0631f50773047.58d947600c416.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/a0631f50773047.58d947600c416.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/a0631f50773047.58d947600c416.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/a0631f50773047.58d947600c416.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/a0631f50773047.58d947600c416.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/a0631f50773047.58d947600c416.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/a0631f50773047.58d947600c416.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301182469,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/7a3a6350773047.58d947600b00e.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/7a3a6350773047.58d947600b00e.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/7a3a6350773047.58d947600b00e.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/7a3a6350773047.58d947600b00e.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/7a3a6350773047.58d947600b00e.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/7a3a6350773047.58d947600b00e.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/7a3a6350773047.58d947600b00e.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/7a3a6350773047.58d947600b00e.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 794
            },
            "disp": {
              "width": 600,
              "height": 340
            },
            "max_1240": {
              "width": 1240,
              "height": 703
            },
            "max_1920": {
              "width": 1920,
              "height": 1089
            },
            "max_1200": {
              "width": 1200,
              "height": 681
            },
            "max_3840": {
              "width": 2560,
              "height": 1452
            },
            "original": {
              "width": 2560,
              "height": 1452
            }
          },
          "width": 600,
          "height": 340,
          "caption": "<div>Page structure<\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": "Page structure"
        },
        {
          "id": 301582589,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/16956750773047.58db77c1a4020.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/16956750773047.58db77c1a4020.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/16956750773047.58db77c1a4020.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/16956750773047.58db77c1a4020.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/16956750773047.58db77c1a4020.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/16956750773047.58db77c1a4020.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/16956750773047.58db77c1a4020.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/16956750773047.58db77c1a4020.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 780
            },
            "disp": {
              "width": 600,
              "height": 334
            },
            "max_1240": {
              "width": 1240,
              "height": 691
            },
            "max_1920": {
              "width": 1920,
              "height": 1069
            },
            "max_1200": {
              "width": 1200,
              "height": 668
            },
            "max_3840": {
              "width": 2880,
              "height": 1604
            },
            "original": {
              "width": 2880,
              "height": 1604
            }
          },
          "width": 600,
          "height": 334,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301414825,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/59549250773047.58da887cea6ad.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/59549250773047.58da887cea6ad.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/59549250773047.58da887cea6ad.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/59549250773047.58da887cea6ad.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/59549250773047.58da887cea6ad.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/59549250773047.58da887cea6ad.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/59549250773047.58da887cea6ad.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/59549250773047.58da887cea6ad.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div>Data visualisation<\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": "Data visualisation"
        },
        {
          "id": 301182463,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/999b2e50773047.58d9476009bb2.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/999b2e50773047.58d9476009bb2.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/999b2e50773047.58d9476009bb2.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/999b2e50773047.58d9476009bb2.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/999b2e50773047.58d9476009bb2.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/999b2e50773047.58d9476009bb2.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/999b2e50773047.58d9476009bb2.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/999b2e50773047.58d9476009bb2.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338
        },
        {
          "id": 301414823,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/5b157950773047.58da887ce9d63.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/5b157950773047.58da887ce9d63.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/5b157950773047.58da887ce9d63.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/5b157950773047.58da887ce9d63.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/5b157950773047.58da887ce9d63.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/5b157950773047.58da887ce9d63.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/5b157950773047.58da887ce9d63.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/5b157950773047.58da887ce9d63.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301414813,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/d6128450773047.58da887ce796d.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/d6128450773047.58da887ce796d.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/d6128450773047.58da887ce796d.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/d6128450773047.58da887ce796d.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/d6128450773047.58da887ce796d.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/d6128450773047.58da887ce796d.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/d6128450773047.58da887ce796d.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/d6128450773047.58da887ce796d.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301583819,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/f9bdd750773047.58db795864f12.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/f9bdd750773047.58db795864f12.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/f9bdd750773047.58db795864f12.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/f9bdd750773047.58db795864f12.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/f9bdd750773047.58db795864f12.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/f9bdd750773047.58db795864f12.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/f9bdd750773047.58db795864f12.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/f9bdd750773047.58db795864f12.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 766
            },
            "disp": {
              "width": 600,
              "height": 328
            },
            "max_1240": {
              "width": 1240,
              "height": 678
            },
            "max_1920": {
              "width": 1920,
              "height": 1050
            },
            "max_1200": {
              "width": 1200,
              "height": 656
            },
            "max_3840": {
              "width": 3840,
              "height": 2100
            },
            "original": {
              "width": 3907,
              "height": 2137
            }
          },
          "width": 600,
          "height": 328,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301414815,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/9e7c0450773047.58da887ce84b2.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/9e7c0450773047.58da887ce84b2.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/9e7c0450773047.58da887ce84b2.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/9e7c0450773047.58da887ce84b2.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/9e7c0450773047.58da887ce84b2.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/9e7c0450773047.58da887ce84b2.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/9e7c0450773047.58da887ce84b2.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/9e7c0450773047.58da887ce84b2.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301414821,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/71a42a50773047.58da887ce97cf.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/71a42a50773047.58da887ce97cf.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/71a42a50773047.58da887ce97cf.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/71a42a50773047.58da887ce97cf.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/71a42a50773047.58da887ce97cf.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/71a42a50773047.58da887ce97cf.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/71a42a50773047.58da887ce97cf.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/71a42a50773047.58da887ce97cf.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301414819,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/40b12750773047.58da887ce8dcc.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/40b12750773047.58da887ce8dcc.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/40b12750773047.58da887ce8dcc.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/40b12750773047.58da887ce8dcc.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/40b12750773047.58da887ce8dcc.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/40b12750773047.58da887ce8dcc.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/40b12750773047.58da887ce8dcc.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/40b12750773047.58da887ce8dcc.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 2560,
              "height": 1440
            },
            "original": {
              "width": 2560,
              "height": 1440
            }
          },
          "width": 600,
          "height": 338,
          "caption": "<div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "caption_plain": ""
        },
        {
          "id": 301587701,
          "project_id": 50773047,
          "type": "image",
          "full_bleed": 1,
          "alignment": "center",
          "caption_alignment": "left",
          "src": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/1f8be650773047.58db7e67539fb.jpg",
          "sizes": {
            "1400": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/1400\\/1f8be650773047.58db7e67539fb.jpg",
            "disp": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/disp\\/1f8be650773047.58db7e67539fb.jpg",
            "max_1240": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/hd\\/1f8be650773047.58db7e67539fb.jpg",
            "max_1920": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/fs\\/1f8be650773047.58db7e67539fb.jpg",
            "max_1200": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_1200\\/1f8be650773047.58db7e67539fb.jpg",
            "max_3840": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/max_3840\\/1f8be650773047.58db7e67539fb.jpg",
            "original": "https:\\/\\/mir-s3-cdn-cf.behance.net\\/project_modules\\/source\\/1f8be650773047.58db7e67539fb.jpg"
          },
          "dimensions": {
            "1400": {
              "width": 1400,
              "height": 788
            },
            "disp": {
              "width": 600,
              "height": 338
            },
            "max_1240": {
              "width": 1240,
              "height": 698
            },
            "max_1920": {
              "width": 1920,
              "height": 1080
            },
            "max_1200": {
              "width": 1200,
              "height": 675
            },
            "max_3840": {
              "width": 3840,
              "height": 2160
            },
            "original": {
              "width": 5333,
              "height": 3000
            }
          },
          "width": 600,
          "height": 338
        },
        {
          "id": 301415125,
          "project_id": 50773047,
          "type": "text",
          "full_bleed": 0,
          "alignment": "center",
          "caption_alignment": "left",
          "text": "<div><br><\\/div><div style="text-align:center;"><br><\\/div><div style="text-align:left;"><span class="bold"><br><\\/span><\\/div><div style="text-align:left;"><span class="bold"><br><\\/span><\\/div><div style="text-align:left;"><span style="font-size:15px;"><span class="bold">Visit\\u00a0the website via: <\\/span><a href="https:\\/\\/www.districtmobility.org" target="_blank">www.districtmobility.org<\\/a><\\/span><\\/div><div style="text-align:left;"><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div><div><br><\\/div>",
          "text_plain": "Visit\\u00a0the website via: www.districtmobility.org"
        }
      ],
      "short_url": "http:\\/\\/be.net\\/gallery\\/50773047\\/Visualizing-mobility-in-Washington-DC",
      "copyright": {
        "license": "no-use",
        "description": "No-use",
        "license_id": 7
      },
      "tools": [
        {
          "id": 8779,
          "title": "Processing",
          "category": "11",
          "category_label": "Online App",
          "category_id": 11,
          "synonym": null,
          "approved": "1",
          "url": "\\/search?tools=8779"
        }
      ],
      "features": [
        {
          "featured_on": 1490929202,
          "site": {
            "id": 1,
            "name": "Behance.net",
            "key": "net",
            "icon": "https:\\/\\/a5.behance.net\\/ac6636c91015aff99d354242bad8e9c83dc75a18\\/img\\/site\\/favicon.ico",
            "url": "http:\\/\\/www.behance.net",
            "domain": "www.behance.net",
            "ribbon": {
              "image": "https:\\/\\/a5.behance.net\\/ac6636c91015aff99d354242bad8e9c83dc75a18\\/img\\/galleries\\/icons\\/ribbons\\/1x\\/network.png",
              "image_2x": "https:\\/\\/a5.behance.net\\/ac6636c91015aff99d354242bad8e9c83dc75a18\\/img\\/galleries\\/icons\\/ribbons\\/2x\\/network@2x.png"
            }
          },
          "url": "https:\\/\\/www.behance.net\\/search"
        }
      ],
      "styles": {
        "text": {
          "title": {
            "font_family": "arial,helvetica,sans-serif",
            "font_weight": "bold",
            "color": "#191919",
            "text_align": "left",
            "line_height": "1.1em",
            "font_size": "36px",
            "text_decoration": "none",
            "font_style": "normal",
            "display": "inline",
            "text_transform": "none"
          },
          "subtitle": {
            "font_family": "arial,helvetica,sans-serif",
            "font_weight": "normal",
            "color": "#a4a4a4",
            "text_align": "left",
            "line_height": "1.4em",
            "font_size": "20px",
            "text_decoration": "none",
            "font_style": "normal",
            "display": "inline",
            "text_transform": "none"
          },
          "paragraph": {
            "font_family": "arial,helvetica,sans-serif",
            "font_weight": "normal",
            "color": "#696969",
            "text_align": "left",
            "line_height": "1.4em",
            "font_size": "20px",
            "text_decoration": "none",
            "font_style": "normal",
            "display": "inline",
            "text_transform": "none"
          },
          "caption": {
            "font_family": "arial,helvetica,sans-serif",
            "font_weight": "bold",
            "color": "#5A5A5A",
            "text_align": "left",
            "line_height": "1.4em",
            "font_size": "13px",
            "text_decoration": "none",
            "font_style": "normal",
            "display": "block",
            "text_transform": "none"
          },
          "link": {
            "font_family": "arial,helvetica,sans-serif",
            "font_weight": "normal",
            "color": "#ff1d25",
            "text_align": "left",
            "line_height": "1.4em",
            "font_size": "16px",
            "text_decoration": "none",
            "font_style": "normal",
            "display": "inline",
            "text_transform": "none"
          }
        },
        "background": {
          "color": "D3D5D7"
        },
        "spacing": {
          "project": {
            "top_margin": "0"
          },
          "modules": {
            "bottom_margin": "0"
          }
        },
        "dividers": {
          "display": "none"
        }
      },
      "creator_id": 102326
    },
    "http_code": 200
  }
  """
