describe("Home Page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });
  it("should be able to click the add to cart", () => {
    cy.get(".products article")
      .first()
      .get(".btn")
      .first()
      .click({ force: true });

    cy.get("#navbarSupportedContent").should("include.text", "My Cart (1)");
  });
});
