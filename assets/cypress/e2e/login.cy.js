/// <reference types= "cypress" />

import {urlIncludeSignIn, userSignUpStatus, forgotPasswordStatus} from "../support/functions"

describe('User main page test', () => {

  // Afficher la page de connexion
  context("should display login page", () => {
    it("url must be include /signin", () => {
      cy.visit("/")
      
      urlIncludeSignIn()
    })
  })

  // Ouvrir le modal d'inscription
  context("should open signup modal", () => {
    it("url must be include /signup", () => {
      cy.get("#openModalSignUp").click()

      cy.url()
        .should("include", "/signup")
    })

    userSignUpStatus(true)
  })

  // Fermer le modal d'inscription
  context("should close signup modal", () => {
    it("url must be include /signin", () => {
      cy.get('#closeModalSignUp')
        .click()
  
      urlIncludeSignIn()
    })

    userSignUpStatus(false)
  })

  // Ouvrir le modal de mot de passe oublié
  context("should open forgot password modal", () => {
    it("url must be include /forgot-password", () => {
      cy.get('#openModalForgotPassword')
      .click()

      cy.url()
        .should("include", "/forgot-password")
    })

    forgotPasswordStatus(true)
  })

  // Fermer le modal de mot de passe oublié
  context("should close forgot password modal", () => {
    it("url must be include /signin", () => {
      cy.get('#closeModalforgotPassword')
      .click()

      urlIncludeSignIn()
    })

    forgotPasswordStatus(false)
  })
})