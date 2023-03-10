#coding: utf-8

User.create!( name: "admin",
              email: "admin@email.com",
              password: "password",
              admin: true
              )

User.create!( name: "user1",
              email: "user1@email.com",
              password: "password"
              )