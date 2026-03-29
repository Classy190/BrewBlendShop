class SearchForm extends HTMLElement {
  constructor() {
    super();
    this.input = null;
    this.resetButton = null;
    this.debouncedInputHandler = null;
  }

  connectedCallback() {
    this.input = this.querySelector('input[type="search"]');
    this.resetButton = this.querySelector('button[type="reset"]');

    if (this.input) {
      this.input.form.addEventListener('reset', this.onFormReset.bind(this));
      this.debouncedInputHandler = debounce((event) => {
        this.onChange(event);
      }, 300).bind(this);
      this.input.addEventListener('input', this.debouncedInputHandler);
    }
  }

  disconnectedCallback() {
    if (this.input && this.debouncedInputHandler) {
      this.input.removeEventListener('input', this.debouncedInputHandler);
    }
  }

  toggleResetButton() {
    const resetIsHidden = this.resetButton.classList.contains('hidden');
    if (this.input.value.length > 0 && resetIsHidden) {
      this.resetButton.classList.remove('hidden');
    } else if (this.input.value.length === 0 && !resetIsHidden) {
      this.resetButton.classList.add('hidden');
    }
  }

  onChange() {
    this.toggleResetButton();
  }

  shouldResetForm() {
    return !document.querySelector('[aria-selected="true"] a');
  }

  onFormReset(event) {
    // Prevent default so the form reset doesn't set the value gotten from the url on page load
    event.preventDefault();
    // Don't reset if the user has selected an element on the predictive search dropdown
    if (this.shouldResetForm()) {
      this.input.value = '';
      this.input.focus();
      this.toggleResetButton();
    }
  }
}

customElements.define('search-form', SearchForm);
