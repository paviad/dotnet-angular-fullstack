import { Component, OnInit } from '@angular/core';
import { SecuredService } from '../secured.service';

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.scss']
})
export class TestComponent implements OnInit {
  securedData: string;

  constructor(private securedSvc: SecuredService) { }

  ngOnInit(): void {
  }

  getSecuredData() {
    this.securedSvc.getData().subscribe(
      {
        next: r => this.securedData = r,
        error: r=> this.securedData = 'error',
      }
    );
  }
}
