import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
// import { French } from "flatpickr/dist/l10n/fr.js"


export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      mode: "range",
      // "locale": French,
      minDate: "today", //date.value en stimulus pour reprendre la date_of_availability
      dateFormat: "d-m-y"
    })
  }
}
