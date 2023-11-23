import { Context, HttpRequest } from '@azure/functions';
import { AzureHttpAdapter } from '../adapter/azure-http-adapter';
import { createApp } from '../src/dogs/dog.azure';

export default function(context: Context, req: HttpRequest): void {
//  console.log("Dog function adapter", context, req);
  AzureHttpAdapter.handle(createApp, context, req, "dogs");
}
