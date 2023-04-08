#coding: utf-8

User.create!( name: "admin",
              email: "admin@email.com",
              password: "password",
              admin: true
              )

User.create!( name: "user1",
              email: "sample-1@email.com",
              password: "password"
              )

User.create!( name: "user2",
              email: "sample-2@email.com",
              password: "password"
              )

Tip.create!(tips_type: "ナンバープレート",
            country: "アルバニア",
            tips_content: "両側が青い",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680971216242!6m8!1m7!1s6nVCVHAJmYv292Z9AIxggQ!2m2!1d41.31838447401625!2d19.79069523991126!3f354.8826039893345!4f-23.192005505724538!5f3.325193203789971",
            user_id: 2,
            img: ""
            )

Tip.create!(tips_type: "ナンバープレート",
            country: "イギリス",
            tips_content: "前が白、後ろが黄色",
            street_view: "https://www.google.com/maps/embed?pb=!4v1678958318256!6m8!1m7!1soKFYrsaRqlKpIatuNwSK7g!2m2!1d52.41277994547098!2d0.7504091917992586!3f18.38328895090273!4f-11.859191099740713!5f1.7807846344476657",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "道路標識",
            country: "アメリカ",
            tips_content: "速度標識がSPEED LIMIT",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680971648245!6m8!1m7!1sSNoOk4Vf726INx5x542JXw!2m2!1d38.85616027375761!2d-77.38055423012871!3f226.2855586665455!4f3.4031612291079796!5f1.7784016261154538",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "道路標識",
            country: "ブラジル",
            tips_content: "裏が黒い",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680971807276!6m8!1m7!1sxgugv4SMspvIPJ4gpffb7Q!2m2!1d-22.65694795898515!2d-43.13488582292489!3f262.65336932141537!4f-3.0253232716620175!5f1.4902846294226202",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "文字",
            country: "ポーランド",
            tips_content: "Łはポーランドのみで使われる。",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680971942408!6m8!1m7!1sJ60nW4MqnUdThekEDXKOLg!2m2!1d52.21509155304847!2d20.95646125326718!3f303.90904917722133!4f-2.50342640694943!5f3.325193203789971",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "ドメイン",
            country: "スイス",
            tips_content: ".chが使われる。",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680974047684!6m8!1m7!1sIIEOuG-FxTzjO6u3oHnBjw!2m2!1d46.94855142189744!2d7.448177765335537!3f252.58550734975242!4f-5.835036476580527!5f3.325193203789971",
            user_id: "2",
            img: ""
            ) 

Tip.create!(tips_type: "車線",
            country: "イギリス",
            tips_content: "左車線",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680973756807!6m8!1m7!1sXq8s2x2MCHGmcVNrfsV-HA!2m2!1d53.53278663575807!2d-2.209265713399566!3f132.0100052230648!4f-13.762099597408394!5f0.7820865974627469",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "道路標識",
            country: "カナダ",
            tips_content: "速度標識がMAXIMUM",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680972884366!6m8!1m7!1sEgMRzPumABydrmT3zIBnHg!2m2!1d46.804545005875!2d-71.24409949607183!3f340.7368726383065!4f-0.46627130634423963!5f3.325193203789971",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "ナンバープレート",
            country: "コロンビア",
            tips_content: "黄色",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680973634574!6m8!1m7!1sgX8hCXvK4w-dxwuEdYneYw!2m2!1d4.702809476412156!2d-74.10103637438209!3f85.15423147738275!4f-15.545259081858077!5f2.961381424899022",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "道路",
            country: "アメリカ",
            tips_content: "中央線が黄色",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680973517820!6m8!1m7!1s871z8ww9fxULeLFWThoHtw!2m2!1d46.81448720451703!2d-71.35057479410223!3f302.7105828718635!4f-22.075684304147217!5f0.7820865974627469",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "道路",
            country: "カナダ",
            tips_content: "中央線が黄色",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680973451274!6m8!1m7!1s3pz1bxnP52gowJaB78qxGA!2m2!1d48.27781182201009!2d-80.25542690015278!3f27.945174422509105!4f-24.98415078584064!5f0.7820865974627469",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "言語",
            country: "カナダ",
            tips_content: "ケベック州とニューブランズウィック州のみフランス語",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680973325263!6m8!1m7!1sDbkmp0UwU9601mXgr065lA!2m2!1d46.79529669272003!2d-71.23519585445563!3f243.08925473050203!4f9.772433056629481!5f1.7659807016925564",
            user_id: "2",
            img: ""
            )

Tip.create!(tips_type: "ドメイン",
            country: "イギリス",
            tips_content: ".uk",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680972516474!6m8!1m7!1snnBpRZuELzd2hfKzknVv0w!2m2!1d51.50890240862924!2d-0.07310837633152893!3f205.9255914860261!4f-9.572504522371162!5f3.325193203789971",
            user_id: "3",
            img: ""
            )

Tip.create!(tips_type: "ナンバープレート",
            country: "キルギス",
            tips_content: "左が赤い",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680972388931!6m8!1m7!1shg6QS9AQDGSQBO8X2yxiiw!2m2!1d42.88418042415694!2d74.58046736663441!3f144.59597957274298!4f-15.921420044944995!5f3.2963112912625743",
            user_id: "3",
            img: ""
            )

Tip.create!(tips_type: "ポーランド",
            country: "ドメイン",
            tips_content: ".po",
            street_view: "https://www.google.com/maps/embed?pb=!4v1680972150282!6m8!1m7!1setTH1mmri30dpby60Hu33g!2m2!1d52.21757391180675!2d20.96009727963147!3f226.4799922095065!4f-13.229808176589586!5f3.2543025747730545",
            user_id: "3",
            img: ""
            )






# Tip.create!(tips_type: "",
#             country: "",
#             tips_content: "",
#             street_view: "",
#             user_id: "2",
#             img: ""
#             )