const urlIncludeSignIn = () => {
    cy.url()
      .should("include", "/signin")
}

const userSignUpStatus = (status) => {
    it(`#userSignUp must have attrs open=${status}`, () => {
        cy.get("#userSignUp").then((element) => {
            cy.get(element[0].attributes.open)
              .should("have.value", `${status}`)
        })
    })
}

const forgotPasswordStatus = (status) => {
    it(`#forgotPasswordModal must have attrs open=${status}`, () => {
        cy.get("#forgotPasswordModal").then((element) => {
            cy.get(element[0].attributes.open)
              .should("have.value", `${status}`)
        })
    })
}

export {urlIncludeSignIn, userSignUpStatus, forgotPasswordStatus};