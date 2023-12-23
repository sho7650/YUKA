import { createElement } from "lwc";
import Yuka from "c/yuka";

describe("c-yuka", () => {
  afterEach(() => {
    // The jsdom instance is shared across test cases in a single file so reset the DOM
    while (document.body.firstChild) {
      document.body.removeChild(document.body.firstChild);
    }
  });

  it("lightning-card title is Yuka", () => {
    // Arrange
    const element = createElement("c-yuka", {
      is: Yuka
    });

    // Act
    document.body.appendChild(element);

    // Assert
    const card = element.shadowRoot.querySelector("lightning-card");
    expect(card.title).toBe("Yuka");
  });

  it("lightning-input type is number", () => {
    // Arrange
    const element = createElement("c-yuka", {
      is: Yuka
    });

    // Act
    document.body.appendChild(element);

    // Assert
    const input = element.shadowRoot.querySelector("lightning-input");
    expect(input.type).toBe("number");
  });

  it("lightning-input label is TATE", () => {
    // Arrange
    const element = createElement("c-yuka", {
      is: Yuka
    });

    // Act
    document.body.appendChild(element);

    // Assert
    const input = element.shadowRoot.querySelector("lightning-input");
    expect(input.label).toBe("TATE");
  });
});
